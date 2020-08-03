//
//  BeanDetailHost.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanDetailHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var bean: Bean
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.bean = self.userData.beans[self.index]
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                BeanDetail(bean: bean, index: 0)
            } else {
                BeanEditor(bean: $bean)
                    .onAppear {
                        self.bean = self.userData.beans[self.index]
                    }
                    .onDisappear {
                        self.userData.beans[self.index] = self.bean
                    }
            }
        }
        .padding()
    }
}

struct BeanDetailHost_Previews: PreviewProvider {
    static var previews: some View {
        BeanDetailHost(bean: beanData[0], index: 0)
    }
}
