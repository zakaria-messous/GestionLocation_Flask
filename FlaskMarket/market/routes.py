from market import app, mysql
from flask import render_template, redirect, url_for, request, flash
import threading

mutex = threading.Lock()

@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')

@app.route('/market')
def market_page():
    conn = mysql.connection
    cur = conn.cursor()
    cur.execute("SELECT * FROM cars")
    cars = cur.fetchall()
    cur.close()
    return render_template('market.html', dataItem=cars)

@app.route('/add_car', methods=['POST', 'GET'])
def add_car():
    if request.method == 'POST':
        with mutex:
            name = request.form.get('name')
            barcode = request.form.get('barcode')
            price = request.form.get('price')
            description = request.form.get('description')
            conn = mysql.connection
            cur = conn.cursor()
            cur.execute("INSERT INTO cars (name, barcode, price, description) VALUES (%s, %s, %s, %s)",
                        (name, barcode, price, description))
            conn.commit()
            cur.close()
            flash('Car has been added successfully', 'success')
            return redirect(url_for('market_page'))
    return render_template('addCar.html')

@app.route('/delete_car/<int:item_id>')
def delete_car(item_id):
    with mutex:
        conn = mysql.connection
        cur = conn.cursor()
        cur.execute("DELETE FROM cars WHERE id=%s", (item_id,))
        conn.commit()
        cur.close()
        flash('Car has been deleted successfully', 'success')
        return redirect(url_for('market_page'))
