//
//  Home.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct Home: View {
    @FetchRequest(entity: Bean.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Bean.name, ascending: true)]) var beans: FetchedResults<Bean>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isPresented = false
        
    var body: some View {
        TabView {
            NavigationView{
                List {
                    ForEach(beans, id: \.name) {bean in
                        NavigationLink(
                            destination: BeanDetail(bean: bean)
                        ) {
                            BeanRow(bean: bean)
                        }
                    }
                    .onDelete(perform: deleteBean)
                }
                .sheet(isPresented: $isPresented) {
                    BeanAdd { name, species, origin, roast, brewTemp, grindSetting, bloomTime, ratio, grindTime in
                        self.addBean(name: name, species: species, origin: origin, roast: roast, brewTemp: brewTemp, grindSetting: grindSetting, bloomTime: bloomTime, ratio: ratio, grindTime: grindTime)
                        self.isPresented = false
                    }
                }
                .navigationBarTitle("Beans", displayMode: .inline)
                .navigationBarItems(leading: Button(action: { self.isPresented.toggle()}){Image(systemName: "plus.circle")}, trailing: EditButton())
            }
                .tabItem {
                    Image(systemName: "folder")
                    Text("Beans")
            }
            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
            }
            Text("Settings Screen")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }

    }
    
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }

    func addBean(name: String, species: String, origin: String, roast: String, brewTemp: String, grindSetting: String, bloomTime: String, ratio: String, grindTime: String) {
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
