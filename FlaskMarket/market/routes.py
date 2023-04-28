from market import app, mysql
from flask import render_template, redirect, url_for, request, flash, send_file
import threading
import os
from werkzeug.utils import secure_filename
from datetime import datetime
from market.forms import RegisterForm, CarForm, ContractForm, PaymentForm
from market.models import Car, Login, Contract, Payment



mutex = threading.Lock()

@app.route('/register', methods=['GET', 'POST'])
def register_page():
    form = RegisterForm()
    if form.validate_on_submit():
        login = Login(1, 'sdf', 'sdf', 'sdf')
        login.add_login_db(form.username.data, form.mail.data, form.password1.data)
        return redirect(url_for('home_page'))
    if form.errors != {}: #If there are not errors from the validations
        for err_msg in form.errors.values():
            flash(f'There was an error with creating a user: {err_msg}', category='danger')
    return render_template('signUp.html', form=form)
    
@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')

@app.route('/visiter')
def visiter_page():
    return render_template('first.html')
@app.route('/admin')
def market_page():
    car = Car(1, 'BMW', 2001, 'Diesel', 5, 'Automatique', 1000,  '123456', 'bmw.jpg')
    all_cars = car.get_cars()
    return render_template('market.html', dataItem=all_cars)

@app.route('/cars')
def cars_page():
    car = Car(1, 'BMW', 2001, 'Diesel', 5, 'Automatique', 1000,  '123456', 'bmw.jpg')
    available_cars = car.get_available_cars()
    return render_template('index.html', dataItem=available_cars)

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in {'jpg', 'jpeg', 'png', 'gif'}



@app.route('/add_car', methods=['POST', 'GET'])
def add_car():
    form = CarForm()
    if request.method == 'POST':
        car_image = request.files['car_image']
        filename = secure_filename(car_image.filename)
        car_image.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            
        if form.validate_on_submit():
            car = Car(1, 'BMW', 2001, 'Diesel', 5, 'Automatique', 1000,  '123456', 'bmw.jpg')
            car.add_car_db(form.marque.data, form.model.data, form.type_carburant.data, form.nombre_place.data, form.transmission.data, form.prix_location.data, form.matricule.data, os.path.join(app.config['UPLOAD_FOLDER'], filename))
            flash('Car has been added successfully', 'success')
            return redirect(url_for('market_page'))
    return render_template('addCar.html', form=form)



@app.route('/image/<filename>')
def image(filename):
    return send_file(os.path.join(app.config['UPLOAD_FOLDER'], filename))


@app.route('/delete_car/<int:item_id>')
def delete_car(item_id):
    car = car = Car(1, 'BMW', 2001, 'Diesel', 5, 'Automatique', 1000,  '123456', 'bmw.jpg')
    deleted  = car.delete_car(item_id)
    if deleted:
        flash('Car has been deleted successfully', 'success')
    else:
        flash('Car has not been deleted', 'danger')
    return redirect(url_for('market_page'))

@app.route('/payment', methods=['GET', 'POST'])
def contract_submit():
    form = ContractForm()
    form2 = PaymentForm()
    form.mysql = mysql
    item_id = request.args.get('item_id')
    car_data = None
    if item_id:
        car = Car(1, 'BMW', 2001, 'Diesel', 5, 'Automatique', 1000,  '123456', 'bmw.jpg')
        car_data = car.get_car_by_id(item_id)
    if form.validate_on_submit():
            contrat = Contract(1, 'nom', 'prenom', 2356 , 34, 'mail', 'adresse', 'pays', 'ville', 34, 'rental_charge')
            rental_charge = 0
            contrat.add_contract_db(form.nom.data, form.prenom.data, form.start_date.data, form.finish_date.data, form.mail.data, form.adresse.data, form.pays.data, form.ville.data, form.zip.data, rental_charge)
            
            payment = Payment(1, 'card_name', 3434, 34, 334)
            payment.add_payment_db(form2.nom_carte.data, form2.numero_carte.data, form2.expiration.data, form2.cvv.data)
            # Redirect the user to a confirmation page
            return redirect(url_for('cars_page'))
    if form.errors != {}:
        for err_msg in form.errors.values():
            flash(f'There was an error with creating a user: {err_msg}', category='danger')
    return render_template('payment.html', form=form, form2=form2, car_data=car_data)


@app.route('/switch_availability/<item_id>/<availability>')
def switch_availability(item_id, availability):
    car = Car(id_car=None, marque=None, modele=None, type_carburant=None, nombre_place=None, transmission=None, prix_location=None, matricule=None, car_image=None)
    car.switch_availability(item_id, availability)
    return redirect(url_for('cars_page'))

