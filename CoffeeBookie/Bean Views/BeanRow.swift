//
//  BeanRow.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI
import CoreData

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
                bean.origin.map(Text.init)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct BeanRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let newBean = Bean.init(context: context)
        newBean.name = "Bean Name"
        newBean.origin = "Bean Origin"
        newBean.roast = "Bean Roast"
        return BeanRow(bean: newBean).environment(\.managedObjectContext, context)
    }
}
