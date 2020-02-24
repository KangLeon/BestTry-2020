//
//  main.cpp
//  Constant
//
//  Created by 吉腾蛟 on 2020/2/24.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>

void fun(const int &a, const int &b);

int main(int argc, const char * argv[]) {
    
    //1.
//    const int x = 3;
//    x = 5;//❌
    
    //2.
//    int x = 3;
//    int const *p = &x; //与const int *p = &x;
//    *p = 5;//❌
    
    //3.
//    int x = 3;
//    int y = 5;
//    int *const p =&x;
////    p = &y;//❌
//    *p = 10;//✅
//    std::cout << x << std::endl;
    
    //4.
//    int x = 3;
//    int y = 5;
//    int const* p = &x;
//    std::cout << *p << std::endl;
//    p = &y;//????????????why?//✅
//    std::cout << *p << std::endl;
    
    //5.
//    int x = 3;
//    int y = 5;
//    int &z = x;
//    z = 10;//✅
//    std::cout << x << std::endl;
    
    //6.
//    int x = 3;
//    int y = 5;
//    int const &z = x;
//    z = 10;//❌
//    std::cout << x << std::endl;
    
    //7.
    
    
    return 0;
}

void fun(const int &a, const int &b){
//    a = 10;//❌不能给常量赋值
//    b = 20;//❌能给常量赋值
}
