//
//  main.cpp
//  Functional
//
//  Created by 吉腾蛟 on 2020/2/24.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>

inline void fun(int i = 30,int j = 20,int k = 10);
inline void fun(double i, double j);

int main(int argc, const char * argv[]) {
    
    fun();
    fun(100);
    fun(100,200);
    fun(100,200,300);
    
    fun(1.1, 2.2);
    fun(1,2);
    
    return 0;
}

void fun(int i,int j, int k){
    std::cout << i << "," << k << std::endl;
}
void fun(double i, double j){
    std::cout << i << "," << j << std::endl;
}
