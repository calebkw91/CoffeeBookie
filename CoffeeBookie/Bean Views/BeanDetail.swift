//
//  Bean Detail.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanDetail: View {
    
    var bean: Bean
    
    var body: some View {
        HStack {
            VStack {
                Text(bean.name)
                    .font(.largeTitle)
                    .padding(.all)
                List{
                    Section(header: Text("Bean")) {
                        Text("Roast: \(bean.category.rawValue)")
                        Text("Origin: \(bean.origin)")
                        Text("Species: \(bean.species)")
                    }
                    Section(header: Text("Brew Details")) {
                        Text("Brew Temp: \(bean.brewTemp)")
                        Text("Grind Setting: \(bean.grind)")
                        Text("Bloom Time: \(bean.bloomTime)")
                        Text("Ratio: \(bean.ratio)")
                        Text("Grind Time: \(bean.grindTime)")
                    }
                }
                .onAppear(perform: {
                    UITableView.appearance().tableFooterView = UIView()
                })
            }
        }
    }
}

struct BeanDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeanDetail(bean: beanData[0])
    }
}
