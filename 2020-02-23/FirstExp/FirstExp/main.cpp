//
//  main.cpp
//  FirstExp
//
//  Created by 吉腾蛟 on 2020/2/23.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    
    cout << "请输入一个整数：" << endl;
    int x=0;
    cin >> x;
    //oct dec hex 分别是8进制、10进制、16进制的英文缩写
    cout << oct << x << endl;
    cout << dec << x << endl;
    cout << hex << x << endl;
    
    cout << "请输入一个Bool值(0,1) : " << endl;
    bool y = false;
    cin >> y;
    cout << boolalpha << y << endl;
    
    system("pause");
    return 0;
}
