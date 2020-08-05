//
//  Home.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var userData: UserData
    @State var showingAdd = false
    
    var addButton: some View {
        Button(action: { self.showingAdd.toggle() }) {
            Image(systemName: "plus.circle")
                .imageScale(.large)
                .accessibility(label: Text("Add Bean"))
                .padding()
        }
    }
    
    var body: some View {
        TabView {
            NavigationView{
                List {
                    ForEach(userData.beans.indices, id: \.self) { i in
                        NavigationLink(destination: BeanDetail(bean: self.userData.beans[i], index: i)){
                            BeanRow(bean: self.userData.beans[i])
                        }
                    }
                    .onMove(perform: moveBean)
                    .onDelete(perform: deleteBean)
                }
                .navigationBarTitle("Beans", displayMode: .inline)
                .navigationBarItems(leading: addButton, trailing: EditButton())
                .sheet(isPresented: $showingAdd) {
                    BeanAdd(isPresented: self.$showingAdd)
                        .environmentObject(self.userData)
                }
                .onAppear(perform: {
                    UITableView.appearance().tableFooterView = UIView()
                })
                
            }
                .tabItem {
                    Image(systemName: "tray")
                    Text("Beans")
            }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
            }
            Text("Nearby Screen")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
    }
    
    func deleteBean(offsets: IndexSet){
        withAnimation{
            userData.beans.remove(atOffsets: offsets)
        }
    }
    
    func moveBean(from: IndexSet, to: Int){
        withAnimation{
            userData.beans.move(fromOffsets: from, toOffset: to)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home()
        }
        .environmentObject(UserData())
    }
}
