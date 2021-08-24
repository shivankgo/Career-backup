using namespace std;
#include <cmath>
#include <iomanip>
#include <iostream>

int fibonachiSeries(int index)
{
    int first = 1;
    int second = first;
    int third = 2;
    if (index < 3)
    {
        return 1;
    }

    for (int i = 0; i < index - 2; ++i)
    {
        third = second;
        second = first;
        first = third + second;
    }

    return first;
}

bool isPrime(int num)
{
    if (num <= 1)
    {
        return false;
    }

    for (int i = 2; i < sqrt(num); ++i)
    {
        if (num % i == 0)
        {
            return false;
        }
    }
    return true;
}

int main()
{
    int index;
    cout << "Enter the index" << endl;
    cin >> index;
    cout << fibonachiSeries(index) << endl;
    cout << isPrime(2) << endl;
    return 0;
}