//
//  main.cpp
//  InitList
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
#include "Teacher.hpp"

/*
 Teacher类
    自定义有参默认构造函数
    使用初始化列表初始化数据
 数据：
    名字
    年龄
 成员函数：
    数据成员的封装函数
 扩展：
    定义可以带最多学生的个数，此为常量
 
 */

int main(int argc, const char * argv[]) {
    
    Teacher t1("Merry",12,150);
    cout << t1.getName() << " " << t1.getAge() << " " << t1.getMax() << endl;
    
    return 0;
}
