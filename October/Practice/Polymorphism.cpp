#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Vehicle
{
public:
    virtual void Draw() = 0;
};

class Bike : public Vehicle
{
public:
    void Draw()
    {
        cout << "Bike class" << endl;
    }

    void ParkBike()
    {
        cout << "Park Bike" << endl;
        cout << "---" << endl;
    }
};

class Train : public Vehicle
{
public:
    void Draw()
    {
        cout << "Train class" << endl;
    }

    void CheckTickets()
    {
        cout << "Check tickets" << endl;
        cout << "---" << endl;
    }
};

class Car : public Vehicle
{
public:
    void Draw()
    {
        cout << "Car class" << endl;
    }

    void ParkCar()
    {
        cout << "Park Car" << endl;
        cout << "---" << endl;
    }
};


int main()
{
    //Vector to populate
    vector<Vehicle*> vehicles; 

    //Allocating memory from the freestore
    Bike* newBike = new Bike;
    Train* newTrain = new Train;
    Car* newCar = new Car;

    //Populating vector
    vehicles.push_back(newBike);
    vehicles.push_back(newTrain);
    vehicles.push_back(newCar);

    //Iterating through vector and running draw function
    for (int i = 0; i < vehicles.size(); i++)
    {
        vehicles[i]->Draw();

        Bike* bike;
        Train* train;
        Car* car;

        //Dynamically casting the vehicles to run their specific functions
        bike = dynamic_cast<Bike*>(vehicles[i]);
        train = dynamic_cast<Train*>(vehicles[i]);
        car = dynamic_cast<Car*>(vehicles[i]);

        if (bike != NULL) { bike->ParkBike(); }
        if (train != NULL) { train->CheckTickets(); }
        if (car != NULL) { car->ParkCar(); }       
    }

    //Clearing Up
    delete newBike;
    delete newTrain;
    delete newCar;
}