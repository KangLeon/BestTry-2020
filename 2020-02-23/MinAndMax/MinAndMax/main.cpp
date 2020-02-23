//
//  main.cpp
//  MinAndMax
//
//  Created by 吉腾蛟 on 2020/2/23.
//  Copyright © 2020 JY. All rights reserved.
//

//题目要求：使用一个函数找出一个整形数组中的最大值或最小值

#include <iostream>
#include <stdlib.h>
using namespace std;

namespace CompanyA {
    int getMaxOrMin(int *arr, int count, bool isMax){
        int temp = arr[0];
        for (int i=1; i<count; i++) {
            if (isMax) {
                if (temp < arr[i]) {
                    temp = arr[i];
                }
            }else{
                if (temp>arr[i]) {
                    temp = arr[i];
                }
            }
        }
        
        return temp;
    }
}

int main(int argc, const char * argv[]) {
    
    int arr1[4] = {3,5,1,7};
    bool isMax = false;
    cin >> isMax;
    cout << CompanyA::getMaxOrMin(arr1, 4, isMax) << endl;
    
//    system("pause");
    return 0;
}
