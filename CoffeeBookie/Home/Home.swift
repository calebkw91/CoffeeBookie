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
                }
                .navigationBarTitle(Text("Beans"))
                .navigationBarItems(trailing: addButton)
                .sheet(isPresented: $showingAdd) {
                    BeanAdd(isPresented: self.$showingAdd)
                        .environmentObject(self.userData)
                }
                .onAppear(perform: {
                    UITableView.appearance().tableFooterView = UIView()
                })
                
            }
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Beans")
            }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Friends")
            }
            Text("Nearby Screen")
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Nearby")
            }
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
