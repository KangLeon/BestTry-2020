//
//  main.cpp
//  String
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
#include <string>
#include <stdlib.h>
using namespace std;
/*
 题目描述：
 1.提示用户输入姓名
 2.接受用户的输入
 3.然后向用户问好，hello ***
 4.告诉用户名字的长度
 5.告诉用户名字的首字母是什么？
 6.如果用户直接输入回车，那么告诉用户的输入为空
 7.如果用户输入的是"admin",那么告诉用户的角色是一个管理员
 */

int main(int argc, const char * argv[]) {
    
    string name;
    cout << "Plaease input your name:";
    getline(cin, name);
    if (name.empty()) {
        cout << "input is null.." << endl;
        return 0;
    }
    
    if (name == "admin") {
        cout << "you are administrator" << endl;
    }
    
    cout << "hello" + name << endl;
    cout << "your name lenth :" << name.size() << endl;
    cout << "your name first letter is " << name [0] << endl;
    
    return 0;
}
