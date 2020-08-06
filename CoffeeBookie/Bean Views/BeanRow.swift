//
//  BeanRow.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanRow: View {
    var bean: Bean
    
    var body: some View {
        VStack {
            HStack {
                bean.name.map(Text.init)
                    .font(.headline)
                Spacer()
            }
            HStack {
                bean.roast.map(Text.init)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Spacer()
                bean.roast.map(Text.init)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

//struct BeanRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BeanRow(bean: beanData[0])
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
