//
//  BeanAdd.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 8/4/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanAdd: View {
    static let DefaultBeanName = "An untitled masterpiece"
    static let DefaultBeanSpecies = "Genre-buster"
    static let DefaultBeanOrigin = "Genre-buster"
    static let DefaultBeanRoast = "Genre-buster"
    static let DefaultBeanBrewTemp = "Genre-buster"
    static let DefaultBeanGrindSetting = "Genre-buster"
    static let DefaultBeanBloomTime = "Genre-buster"
    static let DefaultBeanRatio = "Genre-buster"
    static let DefaultBeanGrindTime = "Genre-buster"
    
    @State var name = ""
    @State var species = ""
    @State var origin = ""
    @State var roast = ""
    @State var brewTemp = ""
    @State var grindSetting = ""
    @State var bloomTime = ""
    @State var ratio = ""
    @State var grindTime = ""

    let onComplete: (String, String, String, String, String, String, String, String, String) -> Void
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Bean Info")){
                    TextField("Name", text: $name)
                    TextField("Species", text: $species)
                    TextField("Origin", text: $origin)
                    TextField("Roast", text: $roast)
                }
                Section(header: Text("Brew Settings")){
                    TextField("Brew Temp", text: $brewTemp)
                    TextField("Grind Setting", text: $grindSetting)
                    TextField("Bloom Time", text: $bloomTime)
                    TextField("Ratio", text: $ratio)
                    TextField("Grind Time", text: $grindTime)
                }
                Section{
                    Button(action: addBeanAction) {
                        Text("Add Bean")
                    }
                }
            }
            .navigationBarTitle(Text("Add Bean"), displayMode: .inline)
        }
        .offset(y: -keyboardResponder.currentHeight*0.9)
    }
    
    
    private func addBeanAction() {
        onComplete(
            name.isEmpty ? BeanAdd.DefaultBeanName : name,
            species.isEmpty ? BeanAdd.DefaultBeanSpecies : species,
            origin.isEmpty ? BeanAdd.DefaultBeanOrigin : origin,
            roast.isEmpty ? BeanAdd.DefaultBeanRoast : roast,
            brewTemp.isEmpty ? BeanAdd.DefaultBeanBrewTemp : brewTemp,
            grindSetting.isEmpty ? BeanAdd.DefaultBeanGrindSetting : grindSetting,
            bloomTime.isEmpty ? BeanAdd.DefaultBeanBloomTime : bloomTime,
            ratio.isEmpty ? BeanAdd.DefaultBeanRatio : ratio,
            grindTime.isEmpty ? BeanAdd.DefaultBeanGrindTime : grindTime
        )
    }
}

//struct BeanAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        BeanAdd(name: "name", species: "species", origin: "origin", roast: "roast", brewTemp: "brewtemp", grindSetting: "grindsetting", bloomTime: "bloomtime", ratio: "ratio", grindTime: "grindtime")
//    }
//}
