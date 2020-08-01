//
//  BeanList.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView{
            List {
    //            Toggle(isOn: $userData.showFavoritesOnly) {
    //                Text("Show Favorites Only")
    //            }
                
                ForEach(userData.beans) { bean in
                    NavigationLink(destination: BeanDetailHost(bean: bean)){
                        BeanRow(bean: bean)
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

struct BeanList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BeanList()
        }
        .environmentObject(UserData())
    }
}
