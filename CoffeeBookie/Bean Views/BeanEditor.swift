//
//  BeanEditor.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanEditor: View {
    @Binding var bean : Bean
    
    
    var body: some View {
        List {
            HStack {
                Text("Bean Name").bold()
                Divider()
                TextField("Bean Name", text: $bean.name)
            }
            HStack {
                Text("Bean Origin")
                Divider()
                TextField("Bean Origin", text: $bean.origin)
            }
            HStack {
                Text("Bean Species")
                Divider()
                TextField("Bean Species", text: $bean.species)
            }
        }
        .onAppear(perform: {
            UITableView.appearance().tableFooterView = UIView()
        })
    }
}

struct BeanEditor_Previews: PreviewProvider {
    static var previews: some View {
        BeanEditor(bean: .constant(.default))
    }
}
