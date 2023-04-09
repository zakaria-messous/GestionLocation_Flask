
from market import app
from flask import render_template, redirect, url_for, request, flash
import sqlite3
import threading


mutex = threading.Lock()


@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')


@app.route('/market')
def market_page():
    with app.app_context():
        conn = sqlite3.connect('market.db')
        cur = conn.cursor()
        cur.execute("SELECT * FROM item")
        dataItem = cur.fetchall()
    return render_template('market.html', dataItem=dataItem)


@app.route('/add_car', methods=['POST', 'GET'])
def add_car():
    if request.method == 'POST':
        with mutex:
            name = request.form.get('name')
            barcode = request.form.get('barcode')
            price = request.form.get('price')
            description = request.form.get('description')
            conn = sqlite3.connect('market.db')
            cur = conn.cursor()
            cur.execute("INSERT INTO item (name, barcode, price, description) VALUES (?, ?, ?, ?)",
                        (name, barcode, price, description))
            conn.commit()
            cur.close()
            flash('Item has been added successfully', 'success')
            return redirect(url_for('add_car'))
    return render_template('addCar.html')


@app.route('/delete_car/<int:item_id>')
def delete_car(item_id):
    with mutex:
        conn = sqlite3.connect('market.db')
        cur = conn.cursor()
        cur.execute("DELETE FROM item WHERE id=?", (item_id,))
        conn.commit()
        cur.close()
        flash('Item has been deleted successfully', 'success')
        return redirect(url_for('market_page'))


