//
//  Home.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var beans: [Bean] = []
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isPresented = false
    
//    var addButton: some View {
//        Button(action: { self.showingAdd.toggle() }) {
//            Image(systemName: "plus.circle")
//                .imageScale(.large)
//                .accessibility(label: Text("Add Bean"))
//                .padding()
//        }
//    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(beans, id: \.name) {
                    BeanRow(bean: $0)
                }
                .onDelete(perform: deleteBean)
            }
            .sheet(isPresented: $isPresented) {
                BeanAdd { name, species, ratio, origin, brewTemp, roast, grindSetting, grindTime, bloomTime in
                    self.addBean(name: name, origin: origin, roast: roast, species: species, brewTemp: brewTemp, bloomTime: bloomTime, ratio: ratio, grindTime: grindTime, grindSetting: grindSetting)
                    self.isPresented = false
                }
            }
            .navigationBarTitle("Beans", displayMode: .inline)
            .navigationBarItems(leading: Button(action: { self.isPresented.toggle()}){Image(systemName: "plus.circle")}, trailing: EditButton())
        }
    }
    
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }

    func addBean(name: String, origin: String, roast: String, species: String, brewTemp: String, bloomTime: String, ratio: String, grindTime: String, grindSetting: String) {
        let newBean = Bean(context: managedObjectContext)
        
        newBean.name = name
        newBean.roast = roast
        newBean.species = species
        newBean.brewTemp = brewTemp
        newBean.bloomTime = bloomTime
        newBean.grindTime = grindTime
        newBean.ratio = ratio
        newBean.origin = origin
        newBean.grindSetting = grindSetting
    }
    
    func deleteBean(offsets: IndexSet){
        offsets.forEach { index in
            let bean = self.beans[index]
            
            self.managedObjectContext.delete(bean)
        }
        
        saveContext()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home()
        }
    }
}
