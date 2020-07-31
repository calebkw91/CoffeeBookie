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
                Text(bean.name)
                    .fontWeight(.medium)
                Spacer()

                if bean.isFavorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
            HStack {
                Text(bean.category.rawValue)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(bean.origin)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct BeanRow_Previews: PreviewProvider {
    static var previews: some View {
        BeanRow(bean: beanData[0])
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
