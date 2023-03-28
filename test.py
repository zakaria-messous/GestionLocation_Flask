

cars = []
# Description: This is a test file


class Car:
    def __init__(self, id, model, marque, year, plate, price):
        self.id = id
        self.model = model
        self.marque = marque
        self.year = year
        self.plate = plate
        self.price = price

    def get_id(self):
        return self.id

    def get_model(self):
        return self.model

    def get_marque(self):
        return self.marque

    def get_year(self):
        return self.year

    def get_plate(self):
        return self.plate

    def get_price(self):
        return self.price

    def set_id(self, id):
        self.id = id

    def set_model(self, model):
        self.model = model

    def set_marque(self, marque):
        self.marque = marque

    def set_year(self, year):
        self.year = year

    def set_plate(self, plate):
        self.plate = plate

    def set_price(self, price):
        self.price = price

    def display(self):
        print("id : ", self.get_id())
        print("model : ", self.get_model())
        print("marque : ", self.get_marque())
        print("year : ", self.get_year())
        print("plate : ", self.get_plate())
        print("price : ", self.get_price())


def add_car(cars):
    id = input("Enter Id")  # auto increment id
    model = input("Enter Model")
    marque = input("Enter Marque")
    year = input("Enter Year")
    plate = input("Enter Plate")
    price = input("Enter Price")
    carx = Car(id, model, marque, year, plate, price)

    cars.append(carx)
    return cars


def display_all(cars):
    for car in cars:
        car.display()


def update(cars):
    id = input("Enter Id")
    for car in cars:
        if car.get_id() == id:
            model = input("Enter Model")
            marque = input("Enter Marque")
            year = input("Enter Year")
            plate = input("Enter Plate")
            price = input("Enter Price")
            car.set_model(model)
            car.set_marque(marque)
            car.set_year(year)
            car.set_plate(plate)
            car.set_price(price)
            return cars


def delete(cars):
    id = input("Enter Id")
    for car in cars:
        if car.get_id() == id:
            cars.remove(car)
            return cars


def search(cars):
    id = input("Enter Id")
    for car in cars:
        if car.get_id() == id:
            car.display()
            return cars


def menu():
    print("1- Add Car")
    print("2- Display All")
    print("3- Update")
    print("4- Delete")
    print("5- Search")
    print("6- Exit")
    choice = input("Enter your choice")
    return choice


add_car(cars)
add_car(cars)
display_all(cars)
update(cars)
display_all(cars)
