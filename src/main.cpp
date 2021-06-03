#include <iostream>
using namespace std;

class Calculator {
public:
double x,y;
void getinfo() {
   cout << "Enter a number - ";
   cin >> x;
   cout << "Enter another number - ";
   cin >> y;
}

double add () {
 return x + y;
}
double subtract () {
 return x - y;
}
double multiply () {
 return x * y;
}
double divide () {
 return x / y;
}
};

int main() {
    int function;
    Calculator calc1;
    cout << "Enter + to add 2 Numbers"
        << "\nEnter - to subtract 2 Numbers"
        << "\nEnter * to multiply 2 Numbers"
        << "\nEnter / to divide 2 Numbers"
        << "\n";
        cout << "\nEnter a function: ";
        cin >> function;
        switch (function) {
        case 1:
            calc1.getinfo();
            cout << "Answer: " << calc1.add() << endl;
            break;
        case 2:
            calc1.getinfo();
            cout << "Answer: " << calc1.subtract() << endl;
            break;
        case 3:
            calc1.getinfo();
            cout << "Answer: " << calc1.multiply() << endl;
            break;
        case 4:
            calc1.getinfo();
            cout << "Answer: " << calc1.divide() << endl;
            break;
        }
}