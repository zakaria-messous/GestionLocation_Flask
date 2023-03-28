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


car1 = Car(1, "X5", "BMW", 2020, "ABC123", 50000)
car1.display()
