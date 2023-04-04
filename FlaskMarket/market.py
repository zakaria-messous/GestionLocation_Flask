from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///market.db'

db = SQLAlchemy(app)

class Item(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    barcode = db.Column(db.String(12), nullable=False, unique=True)
    price = db.Column(db.Integer, nullable=False)
    description = db.Column(db.String(120), nullable=False, default='No description provided')

    def __repr__(self):
        return f'Item {self.name}'

@app.route('/')
@app.route('/home')
def home_page():
    return render_template('home.html')

@app.route('/market')
def market_page():
    items = [
    {'id': 1, 'name': 'Mercedes', 'barcode': 'Mg5', 'price': 500},
    {'id': 2, 'name': 'Renault', 'barcode': 'clio 5', 'price': 900},
    {'id': 3, 'name': 'bmw', 'barcode': 'X5', 'price': 150},
    {'id': 4, 'name': 'audi', 'barcode': 'A5', 'price': 200},
    {'id': 5, 'name': 'toyota', 'barcode': 'yaris', 'price': 100},
]
    return render_template('market.html', items=items)


if __name__ == '__main__':
    app.run(debug=True)
