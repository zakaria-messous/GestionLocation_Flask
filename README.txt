Car Rental Website : Luxe Drive

This web application is built using Flask and Python, with MySQL as the database management system. It is a PFA project for 3IIR work, assigned by Mr. AMEKSA, which aims to teach us how to manipulate databases using Python.

Features

There are two types of users: simple users and admins.
Admins can sign in using the following credentials: 

- username: admin
- password: admin

Simple users can access the home page, cars page, and checkout form.
Admins can add, delete, or modify cars in the database.

There are four classes defined in models.py: Login, Car, Contract, and Payment, each with its own methods for connecting to the location_voiture database.
Form input validation is handled in forms.py. There are five form classes defined: LoginForm, RegisterForm, ContractForm, PaymentForm, and CarForm.
The app uses Jinja syntax to render nine HTML templates: base.html, index.html, cars.html, checkout.html, login.html, register.html, admin.html, add_car.html, and edit_car.html.

The design images used on the website such as the homepage, portfolio, and team are stored in the "images" folder. 
When an admin adds a new car, they must upload a picture of the car to the same folder. Instead of downloading the images, we store the path of the image in the car table of our database. 
Whenever we need to display an image on the website, we use the function "@app.route('/image/<filename>')" to retrieve the image file from the "images" folder and display it on the webpage. 
This way, we are able to efficiently manage and display images on the website.
If you find any issue with pictures, you may need to change the path to your needs in the application.

Installation

To run this app, you will need to install the following Python packages:

Flask
Flask-MySQLdb
Flask-WTF
Pillow
You can install them using pip:

pip install Flask Flask-MySQLdb Flask-WTF Pillow

After installing the dependencies, you can run the app using the following command:

python run.py

Credits

This project was developed by :

- Larbi OUADEIH
- Zakaria MESSOUS
- Chaimae OUKHOUY

License
This project is licensed under the EMSI License.