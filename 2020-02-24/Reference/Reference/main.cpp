//
//  main.cpp
//  Reference
//
//  Created by 吉腾蛟 on 2020/2/24.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
#include <stdlib.h>
using namespace std;

typedef struct{
    int x;
    int y;
}Coord;

void fun(int &a, int &b);

int main(int argc, const char * argv[]) {
    int a = 10;
    int &b = a;
    
    b = 20;
    cout << a << endl;
    
    a=30;
    cout << b << endl;
    
    Coord c;
    Coord &c1 = c;
    
    c1.x = 10;
    c1.y = 20;
    
    cout << c.x << "," << c.y << endl;
    
    int another = 3;
    int *p = &another;
    int *&q = p;
    
    *q = 5;
    cout << another << endl;
    
    int exchangeA = 10;
    int exchangeB = 20;
    cout << exchangeA << "," << exchangeA << endl;
    fun(exchangeA, exchangeB);
    
    cout << exchangeA << "," << exchangeA << endl;
    
    system("pause");
    return 0;
}

void fun(int &a, int &b){
    int c = 0;
    c = a;
    a = b;
    b = c;
}
