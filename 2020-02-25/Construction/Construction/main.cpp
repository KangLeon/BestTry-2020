//
//  main.cpp
//  Construction
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
#include <stdlib.h>
#include <string>
#include "Teacher.hpp"
using namespace std;
/*
 
    Teacher类:
 自定义无参构造函数
 自定义有参构造函数
 
 数据：
    名字
    年龄
 成员函数：
    数据成员的封装函数
 
 */

int main(int argc, const char * argv[]) {
    
    Teacher t1;
    Teacher t2("Merry",15);
    
    cout << t1.getName() << " " << t1.getAge() << endl;
    cout << t2.getName() << " " << t2.getAge() << endl;
    
    return 0;
}
