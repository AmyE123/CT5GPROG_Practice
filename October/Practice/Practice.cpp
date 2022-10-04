#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Vehicle
{
public:
    string name;
    void speak()
    {
        cout << "Animal baseclass" << endl;
    }
};

class Bike : public Vehicle
{
public:
    void speak()
    {
        cout << "Bike class" << endl;
    }
};

int main()
{
    Bike bike1;
    bike1.speak();
    bike1.Vehicle::speak();
}
