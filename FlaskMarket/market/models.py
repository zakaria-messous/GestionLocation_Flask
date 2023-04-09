
from flask import flash, redirect, render_template, request, url_for
from market import db





class Item(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    barcode = db.Column(db.String(12), nullable=False, unique=True)
    price = db.Column(db.Integer, nullable=False)
    description = db.Column(db.String(120), nullable=False,default='No description provided')
    owner = db.Column(db.Integer, db.ForeignKey('user.id'))
    def __repr__(self):
        return f'Item {self.name}'
    

# class UserForm:
#     id = db.Column(db.Integer, primary_key=True)
#     username = db.Column(db.String(30), nullable=False, unique=True)
#     email_address = db.Column(db.String(50), nullable=False, unique=True)
#     password_hash = db.Column(db.String(60), nullable=False)
#     budget = db.Column(db.Integer, nullable=False, default=1000)
#     items = db.relationship('Item', backref='owned_user', lazy=True)
#     def __repr__(self):
#         return f'User {self.username}'