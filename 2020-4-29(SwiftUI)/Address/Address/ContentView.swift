//
//  ContentView.swift
//  Address
//
//  Created by JY on 2020/4/29.
//  Copyright © 2020 JY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var textString = ""
    
    var body: some View {
        
        Form {
            TextField("请输入内容",text: $textString)
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
