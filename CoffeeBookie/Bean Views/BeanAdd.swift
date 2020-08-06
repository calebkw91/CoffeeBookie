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
    @State var beanRatio = ""
    @State var grindTime = ""

    let onComplete: (String, String, String, String, String, String, String, String, String) -> Void
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Bean Name")){
                    TextField("Name", text: $name)
                }
                Section(header: Text("Origin")){
                    TextField("Origin", text: $origin)
                }
                Section(header: Text("Roast")){
                    TextField("Roast", text: $roast)
                }
            }
            .navigationBarTitle(Text("Add Bean"), displayMode: .inline)
        }
    }
    private func addMoveAction() {
        onComplete(
            name.isEmpty ? BeanAdd.DefaultBeanName : name,
            species.isEmpty ? BeanAdd.DefaultBeanSpecies : species,
            roast.isEmpty ? BeanAdd.DefaultBeanRoast : roast,
            origin.isEmpty ? BeanAdd.DefaultBeanOrigin : origin,
            brewTemp.isEmpty ? BeanAdd.DefaultBeanBrewTemp : brewTemp,
            grindSetting.isEmpty ? BeanAdd.DefaultBeanGrindSetting : grindSetting,
            bloomTime.isEmpty ? BeanAdd.DefaultBeanBloomTime : bloomTime,
            beanRatio.isEmpty ? BeanAdd.DefaultBeanRatio : beanRatio,
            grindTime.isEmpty ? BeanAdd.DefaultBeanGrindTime : grindTime
        )
    }
}

//struct BeanAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        BeanAdd(name: "Name", species: "Species", origin: "Origin", roast: "Roast", brewTemp: "BreTemp", grindSetting: "GrindSetting", bloomTime: "BloomTime", beanRatio: "BeanRatio", grindTime: "GrindTime", onComplete: (String, String, String, String, String, String, String, String, String) -> Void)
//    }
//}
