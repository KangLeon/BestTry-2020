//
//  main.cpp
//  NameSpaceTme
//
//  Created by 吉腾蛟 on 2020/2/23.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
using namespace std;

namespace A {
    int x = 1;
    void fun(){
        cout << "A" << endl;
    }
}

namespace B {
    int x = 2;
    void fun(){
        cout << "B" << endl;
    }
    void fun2(){
        cout << "2B" << endl;
    }
}

using namespace B;
int main(int argc, const char * argv[]) {
    
    cout << A::x << endl;
    B::fun();
    fun2();
    
    system("pause");
    return 0;
}
