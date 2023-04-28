from flask import Flask
from flask_mysqldb import MySQL
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt


app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'C:\\Users\\iouad\\Documents\\GitHub\\Python_PFA\\FlaskMarket\\images'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'location_voiture'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/location_voiture'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'your_secret_key_here'




mysql = MySQL(app)
bcrypt = Bcrypt(app)

from market import models
from market import forms
from market import routes
