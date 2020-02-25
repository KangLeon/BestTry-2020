//
//  main.cpp
//  ClassAndInstance
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
using namespace std;

class Coordinate{
public:
    int x;
    int y;
    void printX(){
        cout << x << endl;
    }
    void printY(){
        cout << y << endl;
    }
};

int main(int argc, const char * argv[]) {
    
    //栈的方式
    Coordinate coor;
    coor.x = 10;
    coor.y= 20;
    coor.printX();
    coor.printY();
    
    //堆的方式
    Coordinate *p = new Coordinate ();
    if (p == NULL) {
        return 0;
    }
    p->x = 100;
    p->y = 200;
    p->printY();
    p->printY();
    delete p;
    p = NULL;
    
    return 0;
}
