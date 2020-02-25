//
//  main.cpp
//  NewAndDelete
//
//  Created by 吉腾蛟 on 2020/2/25.
//  Copyright © 2020 JY. All rights reserved.
//

#include <iostream>
using namespace std;
 
int main(int argc, const char * argv[]) {
    
    int *p = new int[1000];
    
    if (NULL == p) {
        return 0;
    }
    
    p[0] = 10;
    p[1] = 20;
    cout << p[0] << "," << p[1] << endl;
    
    cout << *p << endl;
    delete []p;
    p = NULL;
    
    return 0;
}
