//
//  BeanEdit.swift
//  CoffeePad
//
//  Created by Caleb Walker on 8/11/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanEdit: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var bean: Bean
    @Binding var isPresented: Bool

    @State private var newName = ""
    @State private var newRoast = ""
    @State private var newOrigin = ""
    @State private var newSpecies = ""
    @State private var newBrewTemp = ""
    @State private var newGrindSetting = ""
    @State private var newBloomTime = ""
    @State private var newRatio = ""
    @State private var newGrindTime = ""
    @State private var offset = 0.0
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Bean Info")){
                    TextField("Name", text: $newName, onCommit: {self.offset = 0.0})
                    .onAppear {
                        self.newName = self.bean.name != nil ? "\(self.bean.name!)" : ""
                    }
                    
                    TextField("Roast", text: $newRoast, onCommit: {self.offset = 0.0})
                    .onAppear {
                        self.newRoast = self.bean.roast != nil ? "\(self.bean.roast!)" : ""
                    }
                    
                    TextField("Origin", text: $newOrigin, onCommit: {self.offset = 0.0})
                    .onAppear {
                        self.newOrigin = self.bean.origin != nil ? "\(self.bean.origin!)" : ""
                    }
                    
                    TextField("Species", text: $newSpecies, onCommit: {self.offset = 0.2})
                    .onAppear {
                        self.newSpecies = self.bean.species != nil ? "\(self.bean.species!)" : ""
                    }

                }
                Section(header: Text("Brew Settings")){
                    TextField("Brew Temp", text: $newBrewTemp, onCommit: {self.offset = 0.3})
                    .onAppear {
                        self.newBrewTemp = self.bean.brewTemp != nil ? "\(self.bean.brewTemp!)" : ""
                    }
                    
                    TextField("Grind Settings", text: $newGrindSetting, onCommit: {self.offset = 0.4})
                    .onAppear {
                        self.newGrindSetting = self.bean.grindSetting != nil ? "\(self.bean.grindSetting!)" : ""
                    }
                    
                    TextField("Bloom Time", text: $newBloomTime, onCommit: {self.offset = 0.4})
                    .onAppear {
                        self.newBloomTime = self.bean.bloomTime != nil ? "\(self.bean.bloomTime!)" : ""
                    }
                    
                    TextField("Ratio", text: $newRatio, onCommit: {self.offset = 0.4})
                    .onAppear {
                        self.newRatio = self.bean.ratio != nil ? "\(self.bean.ratio!)" : ""
                    }
                    
                    TextField("Grind Time", text: $newGrindTime, onCommit: {self.offset = 0.4})
                    .onAppear {
                        self.newGrindTime = self.bean.grindTime != nil ? "\(self.bean.grindTime!)" : ""
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: editBeanAction) {Text("Save")})
            .navigationBarTitle(Text("Edit Bean"), displayMode: .inline)
        }
        .offset(y: -keyboardResponder.currentHeight*CGFloat(offset))
    }
    
    func editBeanAction(){
        self.bean.name = self.newName
        self.bean.roast = self.newRoast
        self.bean.origin = self.newOrigin
        self.bean.species = self.newSpecies
        self.bean.brewTemp = self.newBrewTemp
        self.bean.grindSetting = self.newGrindSetting
        self.bean.bloomTime = self.newBloomTime
        self.bean.ratio = self.newRatio
        self.bean.grindTime = self.newGrindTime
        
        try? self.managedObjectContext.save()
        self.isPresented.toggle()
    }
}
