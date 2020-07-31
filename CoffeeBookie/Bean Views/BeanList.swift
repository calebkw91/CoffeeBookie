//
//  BeanList.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanList: View {
    var bean: [Bean] = beanData
    
    var body: some View {
        List {
//            Toggle(isOn: $userData.showFavoritesOnly) {
//                Text("Show Favorites Only")
//            }
            
            ForEach(beanData) { bean in
                BeanRow(bean: bean)
            }
        }
    }
}

struct BeanList_Previews: PreviewProvider {
    static var previews: some View {
        BeanList()
    }
}
