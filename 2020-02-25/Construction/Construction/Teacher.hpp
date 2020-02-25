//
//  Teacher.hpp
//  Construction
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#ifndef Teacher_hpp
#define Teacher_hpp
#include <string>
#include <stdio.h>
#include <iostream>

using namespace std;

class Teacher{
public:
    Teacher();
    Teacher(string name, int age);
    
    void setName(string _name);
    string getName();
    void setAge(int _age);
    int getAge();
    void teach();
private:
    string m_strName;
    int m_iAge;
};

#endif /* Teacher_hpp */
