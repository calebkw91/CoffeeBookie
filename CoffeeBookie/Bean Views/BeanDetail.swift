//
//  Bean Detail.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.


import SwiftUI
import CoreData

struct BeanDetail: View {
    @State var bean: Bean
    @State var isPresented = false
    
//    var editButton: some View {
//        Button(action: {
//            if self.showingEdit == true {
//                self.userData.beans[self.index] = self.bean
//            }
//
//            self.showingEdit.toggle()
//        }) {
//            if self.showingEdit == false {
//                Text("Edit")
//            } else {
//                Text("Done")
//            }
//        }
//    }

    var body: some View {
        VStack {
            List{
                Section(header: Text("Bean")) {
                    HStack {
                        Text("Name: ")
                        bean.name.map(Text.init)
                    }
                    HStack {
                        Text("Roast: ")
                        bean.roast.map(Text.init)
                    }
                    HStack {
                        Text("Origin: ")
                        bean.origin.map(Text.init)
                    }
                    HStack {
                        Text("Species: ")
                        bean.species.map(Text.init)
                    }
                }
                Section(header: Text("Brew Details")) {
                    HStack {
                        Text("Brew Temp: ")
                        bean.brewTemp.map(Text.init)
                    }
                    HStack {
                        Text("Grind Setting: ")
                        bean.grindSetting.map(Text.init)
                    }
                    HStack {
                        Text("Bloom Time: ")
                        bean.bloomTime.map(Text.init)
                    }
                    HStack {
                        Text("Ratio: ")
                        bean.ratio.map(Text.init)
                    }
                    HStack {
                        Text("Grind Time: ")
                        bean.grindTime.map(Text.init)
                    }
                }
            }
            .onAppear(perform: {
                UITableView.appearance().tableFooterView = UIView()
            })
            .sheet(isPresented: $isPresented) {BeanEdit(bean: self.bean, isPresented: self.$isPresented)}
            .navigationBarItems(trailing: Button(action: { self.isPresented.toggle()}){Text("Edit")})
        }
    }
}

struct BeanDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newBean = Bean.init(context: context)
        newBean.name = "Bean Name"
        newBean.origin = "Bean Origin"
        newBean.roast = "Bean Roast"
        newBean.bloomTime = "Bloom Time"
        newBean.ratio = "Ratio"
        newBean.brewTemp = "Brew Temp"
        newBean.grindTime = "Grind Time"
        newBean.grindSetting = "Grind Setting"
        newBean.species = "Species"
        return BeanDetail(bean: newBean).environment(\.managedObjectContext, context)
    }
}
