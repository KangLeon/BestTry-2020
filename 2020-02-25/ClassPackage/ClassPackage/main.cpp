//
//  main.cpp
//  ClassPackage
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
#include <string>
using namespace std;

/*
 数据的封装：
 
 定义一个Student类，含有如下信息：
 1.姓名：name
 2.性别：gender
 3.学分（只读）：score
 4.学习：study
 
 */

class Student {
public:
    void setName(string _name){
        m_strName=_name;
    }
    string getName(){
        return m_strName;
    }
    void setGender(string _gender){
        m_str_Gender=_gender;
    }
    string getGender(){
        return m_str_Gender;
    }
    int getScore(){
        return m_iScore;
    }
    
    void initScore(){
        m_iScore=0;
    }
    void study(int _score){
        m_iScore += _score;
    }
private:
    string m_strName;
    string m_str_Gender;
    int m_iScore;
};

int main(int argc, const char * argv[]) {
    Student stu;
    stu.initScore();
    stu.setName("Kang jiyoung");
    stu.setGender("女");
    stu.study(3);
    stu.study(5);
    
    cout << stu.getName() << "" << stu.getGender() << "" << stu.getScore() << endl;
    
    return 0;
}
