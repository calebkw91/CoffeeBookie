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
    @State var draftBean = Bean.default
    @State var bean: Bean
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftBean = self.bean
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                BeanDetail(bean: bean)
            } else {
                BeanEditor(bean: $draftBean)
                    .onAppear {
                        self.draftBean = self.bean
                    }
                    .onDisappear {
                        self.bean = self.draftBean
                    }
            }
        }
        .padding()
    }
}

struct BeanDetailHost_Previews: PreviewProvider {
    static var previews: some View {
        BeanDetailHost(bean: beanData[0])
    }
}
