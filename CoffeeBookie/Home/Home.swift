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
    
    var body: some View {
        NavigationView{
            List {
    //            Toggle(isOn: $userData.showFavoritesOnly) {
    //                Text("Show Favorites Only")
    //            }
                
                ForEach(userData.beans.indices) { i in
                    NavigationLink(destination: BeanDetail(bean: self.userData.beans[i], index: i)){
                        BeanRow(bean: self.userData.beans[i])
                    }
                }
            }
            .navigationBarTitle(Text("Beans"))
            .onAppear(perform: {
                UITableView.appearance().tableFooterView = UIView()
            })
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
