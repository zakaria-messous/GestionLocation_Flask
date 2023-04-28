from flask import current_app
from market import app, mysql, bcrypt
from datetime import datetime



class Login:
    def __init__(self, id_login, username, mail, password):
        self.id_login = id_login
        self.username = username
        self.mail = mail
        self.password = password
        self.mysql = mysql
    
    def add_login_db(self, username, mail, password):
        conn = self.mysql.connection
        cur = conn.cursor()
        cur.execute("INSERT INTO login (username, mail, password) VALUES (%s, %s, %s)", (username, mail, password))
        conn.commit()
        cur.close()
        return True
    def get_username(self, username):
        cur = self.mysql.connection.cursor()
        cur.execute("SELECT * FROM login WHERE username = %s", (username,))
        user = cur.fetchone()
        cur.close()
        return user
    def get_mail(self, mail):
        cur = self.mysql.connection.cursor()
        cur.execute("SELECT * FROM login WHERE mail = %s", (mail,))
        user = cur.fetchone()
        cur.close()
        return user
    # @property
    # def password(self):
    #     return self.password
    # @password.setter
    # def password(self, plain_password):
    #     self.password = bcrypt.generate_password_hash(plain_password).decode('utf-8')
class Car:
    def __init__(self, id_car, marque, modele, type_carburant, nombre_place, transmission, prix_location, matricule, car_image):
        self.id_car = id_car
        self.marque = marque
        self.modele = modele
        self.type_carburant = type_carburant
        self.nombre_place = nombre_place
        self.transmission = transmission
        self.prix_location = prix_location
        self.matricule = matricule
        self.car_image = car_image
        self.mysql = mysql

    def add_car_db(self, marque, modele, type_carburant, nombre_place, transmission, prix_location, matricule, car_image):
        conn = self.mysql.connection
        cur = conn.cursor()
        cur.execute("INSERT INTO car (marque, model, type_carburant, nombre_place, transmission, prix_location, disponibilite, matricule, car_image) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (marque, modele, type_carburant, nombre_place, transmission, prix_location, 1, matricule, car_image))
        conn.commit()
        cur.close()
        return True
    
    def get_cars(self):
        cur = self.mysql.connection.cursor()
        cur.execute("SELECT * FROM car")
        all_cars = cur.fetchall()
        cur.close()
        return all_cars
    
    def get_car_by_id(self, item_id):
        cur = self.mysql.connection.cursor()
        cur.execute("SELECT * FROM car WHERE id_car = %s", (item_id,))
        car = cur.fetchone()
        cur.close()
        return car
        
    def switch_availability(self, item_id, availability):
        cur = self.mysql.connection.cursor()
        cur.execute("UPDATE car SET disponibilite = %s WHERE id_car = %s", (availability, item_id))
        self.mysql.connection.commit()
        cur.close()
        return True

    def get_available_cars(self):
        cur = self.mysql.connection.cursor()
        cur.execute("SELECT * FROM car WHERE disponibilite = 1")
        all_cars = cur.fetchall()
        cur.close()
        return all_cars

    def delete_car(self, item_id):
        cur = self.mysql.connection.cursor()
        cur.execute("DELETE FROM car WHERE id_car = %s", (item_id,))
        self.mysql.connection.commit()
        cur.close()
        return True



class Contract:
    def __init__(self, id_paiment, nom, prenom, start_date, finish_date, mail, adresse, pays, ville, zip, rental_charge):
        self.id_paiment = id_paiment
        self.nom = nom
        self.prenom = prenom
        self.start_date = start_date
        self.finish_date = finish_date
        self.mail = mail
        self.adresse = adresse
        self.pays = pays
        self.ville = ville
        self.zip = zip
        self.rental_charge = rental_charge
        self.mysql = mysql

    def add_contract_db(self, nom, prenom, start_date, finish_date, mail, adresse, pays, ville, zip, rental_charge):
        conn = self.mysql.connection
        cur = conn.cursor()
        cur.execute("INSERT INTO contrat (nom, prenom, start_date, finish_date, mail, adresse, pays, ville, zip, rental_charge) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (nom, prenom, start_date, finish_date, mail, adresse, pays, ville, zip, rental_charge))
        conn.commit()
        cur.close()
        return True
    # Calculate rental charge, price from car model * days
    def days_rented(self):
        delta = self.finish_date - self.start_date
        return delta.days

class Payment:
    def __init__(self, id, nom_carte, numero_carte, expiration, cvv):
        self.id = id
        self.nom_carte = nom_carte
        self.numero_carte = numero_carte
        self.expiration = expiration
        self.cvv = cvv
        self.mysql = mysql
    def add_payment_db(self, nom_carte, numero_carte, expiration, cvv):
        conn = self.mysql.connection
        cur = conn.cursor()
        cur.execute("INSERT INTO payment (nom_carte, numero_carte, expiration, cvv) VALUES (%s, %s, %s, %s)",
                    (nom_carte, numero_carte, expiration, cvv))
        conn.commit()
        cur.close()
        return True
