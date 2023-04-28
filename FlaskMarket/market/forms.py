
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError, Regexp
from wtforms.fields import DecimalField, IntegerField
from market import app, mysql
from market.models import Login

class StrictlyPositive:
    def __call__(self, form, field):
        if field.data is None or field.data < 100:
            raise ValidationError('The number must be strictly superior to 100')
class StrictlyPositiveInteger:
    def __call__(self, form, field):
        if field.data is None or field.data < 0:
            raise ValidationError('The number must be strictly positive')

class ContractForm(FlaskForm):
    nom = StringField(label='Nom', validators=[DataRequired()])
    prenom = StringField(label='Prenom', validators=[DataRequired()])
    start_date = StringField(label='Date de debut', validators=[DataRequired()])
    finish_date = StringField(label='Date de fin', validators=[DataRequired()])
    mail = StringField(label='Email', validators=[Email(), DataRequired()])
    adresse = StringField(label='Adresse', validators=[DataRequired()])
    pays = StringField(label='Pays', validators=[DataRequired()])
    ville = StringField(label='Ville', validators=[DataRequired()])
    zip = IntegerField(label='Zip', validators=[ DataRequired()])


class PaymentForm(FlaskForm):
    nom_carte = StringField(label='Nom sur la carte', validators=[DataRequired()])
    numero_carte = IntegerField(label='Numero de la carte', validators=[DataRequired(), Length(min=16, max=16, message='The card number should be 16 digits long.'), Regexp('^[0-9]*$', message='The card number should contain only digits.')])
    expiration = StringField(label='Expiration (MM/YY)', validators=[DataRequired(), Regexp('^(0[1-9]|1[0-2])\/([0-9]{2})$', message='The expiration date should be in the format MM/YY.')])
    cvv = IntegerField(label='CVV', validators=[DataRequired(), Length(min=3, max=3, message='The CVV should be 3 digits long.'), Regexp('^[0-9]*$', message='The CVV should contain only digits.')])
    submit = SubmitField(label='Payer')

class RegisterForm(FlaskForm):
    # def __init__(self, mysql=None, *args, **kwargs):
    #     super(RegisterForm, self).__init__(*args, **kwargs)
    #     self.mysql = mysql

    def validate_username(self, username_to_check):
        login = Login(1,'username', 'mail', 'password')
        user = login.get_username(username_to_check.data)
        if user:
            raise ValidationError('Username already exists! Please try a different username.')

    def validate_mail(self, mail_to_check):
        login = Login(1,'username', 'mail', 'password')
        user = login.get_mail(mail_to_check.data)
        if user:
            raise ValidationError('Email already exists! Please try a different email.')

    username = StringField(label='Username', validators=[Length(min=2, max=30), DataRequired()])
    mail = StringField(label='Email', validators=[Email(), DataRequired()])
    password1 = PasswordField(label='Password', validators=[Length(min=5), DataRequired()])
    password2 = PasswordField(label='Confirm password', validators=[EqualTo('password1'), DataRequired()])
    submit = SubmitField(label='Create Account')


class CarForm(FlaskForm):
    marque = StringField(label='Marque', validators=[DataRequired()])
    model = StringField(label='Model', validators=[DataRequired()])
    type_carburant = StringField(label='Type de carburant', validators=[DataRequired()])
    nombre_place = IntegerField(label='Nombre de place', validators=[DataRequired(), StrictlyPositiveInteger()])
    transmission = StringField(label='Transmission', validators=[DataRequired()])
    prix_location = DecimalField(label='Prix de location', validators=[DataRequired(), StrictlyPositive()])
    disponibilite = StringField(label='Disponibilite', validators=[DataRequired()])
    matricule = StringField(label='Matricule', validators=[DataRequired()])
    submit = SubmitField(label='Ajouter')
