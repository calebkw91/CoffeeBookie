//
//  BeanAdd.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 8/4/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanAdd: View {
    @EnvironmentObject var userData: UserData
    @State var draftBean = Bean.default
    @Binding var isPresented: Bool
    
    var saveButton: some View {
        Button(action: {
            self.userData.beans.append(self.draftBean)
            self.isPresented = false
        }) {
            Text("Save")
        }
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                saveButton
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            TextField("Name", text: $draftBean.name)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .keyboardType(.default)
            List{
                Section(header: Text("Bean")) {
                    Text("Roast: \(draftBean.category.rawValue)")
                    HStack {
                        Text("Origin:")
                        TextField("Origin", text: $draftBean.origin)
                    }
                    HStack {
                        Text("Species:")
                        TextField("Species", text: $draftBean.species)
                    }
                }
                Section(header: Text("Brew Details")) {
                    HStack {
                        Text("Brew Temp:")
                        TextField("Brew Temp", text: $draftBean.brewTemp)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Grind Setting:")
                        TextField("Grind Setting", text: $draftBean.grind)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Bloom Time:")
                        TextField("Bloom Time", text: $draftBean.bloomTime)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Ratio:")
                        TextField("Ratio", text: $draftBean.ratio)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Grind Time:")
                        TextField("Grind Time", text: $draftBean.grindTime)
                            .keyboardType(.numberPad)
                    }
                }
            }
            .onAppear(perform: {
                UITableView.appearance().tableFooterView = UIView()
            })
        }
    }
}

struct BeanAdd_Previews: PreviewProvider {
    static var previews: some View {
        BeanAdd(isPresented: .constant(true))
    }
}
