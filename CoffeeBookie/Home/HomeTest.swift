//
//  HomeTest.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 8/5/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI
import CoreData

struct HomeTest: View {
    var beans: [NSManagedObject] = []
    
    var body: some View {
        Text(beans[0].value(forKey: "name") as? String)
    }
}

struct HomeTest_Previews: PreviewProvider {
    static var previews: some View {
        HomeTest()
    }
}
