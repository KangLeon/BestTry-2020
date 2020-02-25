//
//  Teacher.cpp
//  Construction
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include "Teacher.hpp"

Teacher::Teacher(string name, int age, int m):m_strName(name),m_iAge(age),m_iMax(m){
    cout << "Teacher(string name, int age)" << endl;
}

int Teacher::getMax(){
    return m_iMax;
}

void Teacher::setName(string _name){
    m_strName=_name;
}
string Teacher::getName(){
    return m_strName;
}
void Teacher::setAge(int _age){
    m_iAge = _age;
}
int Teacher::getAge(){
    return m_iAge;
}
void Teacher::teach(){
    cout << "现在上课..." << endl;
}
