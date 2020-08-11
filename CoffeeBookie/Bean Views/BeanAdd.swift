//
//  BeanAdd.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 8/4/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI

struct BeanAdd: View {
    static let DefaultBeanName = "Defualt Bean"
    static let DefaultBeanSpecies = "Species"
    static let DefaultBeanOrigin = "Origin"
    static let DefaultBeanRoast = "Roast"
    static let DefaultBeanBrewTemp = "Brew Temp"
    static let DefaultBeanGrindSetting = "Grind Setting"
    static let DefaultBeanBloomTime = "Bloom Time"
    static let DefaultBeanRatio = "Ratio"
    static let DefaultBeanGrindTime = "Grind Time"
    
    @State var name = ""
    @State var species = ""
    @State var origin = ""
    @State var roast = ""
    @State var brewTemp = ""
    @State var grindSetting = ""
    @State var bloomTime = ""
    @State var ratio = ""
    @State var grindTime = ""
    @State var offset: Double = 0.0
    @State var focused: [Bool] = [true, false, false, false, false, false, false, false, false]

    let onComplete: (String, String, String, String, String, String, String, String, String) -> Void
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Bean Info")){
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 0, placeholder: "Name" , keyboardOffset: $offset, text: $name, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 1, placeholder: "Species", keyboardOffset: $offset, text: $species, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 2, placeholder: "Origin", keyboardOffset: $offset, text: $origin, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 3, placeholder: "Roast", keyboardOffset: $offset, text: $roast, isfocusAble: $focused)
                }
                Section(header: Text("Brew Settings")){
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 4, placeholder: "Brew Temp", keyboardOffset: $offset, text: $brewTemp, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 5, placeholder: "Grind Setting", keyboardOffset: $offset, text: $grindSetting, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 6, placeholder: "Bloom Time", keyboardOffset: $offset, text: $bloomTime, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .next, tag: 7, placeholder: "Ratio", keyboardOffset: $offset, text: $ratio, isfocusAble: $focused)
                    TextFieldTyped(keyboardType: .default, returnVal: .done, tag: 8, placeholder: "Grind Time", keyboardOffset: $offset, text: $grindTime, isfocusAble: $focused)
                }
                Section{
                    Button(action: addBeanAction) {
                        Text("Add Bean")
                    }
                }
            }
            .navigationBarTitle(Text("Add Bean"), displayMode: .inline)
        }
        .offset(y: -keyboardResponder.currentHeight*CGFloat(offset))

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
    
    struct TextFieldTyped: UIViewRepresentable {
        let keyboardType: UIKeyboardType
        let returnVal: UIReturnKeyType
        let tag: Int
        let placeholder: String
        @Binding var keyboardOffset: Double
        @Binding var text: String
        @Binding var isfocusAble: [Bool]

        func makeUIView(context: Context) -> UITextField {
            let textField = UITextField(frame: .zero)
            textField.keyboardType = self.keyboardType
            textField.returnKeyType = self.returnVal
            textField.tag = self.tag
            textField.delegate = context.coordinator
            textField.autocorrectionType = .no
            textField.placeholder = self.placeholder

            return textField
        }

        func updateUIView(_ uiView: UITextField, context: Context) {
            if isfocusAble[tag] {
                uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UITextFieldDelegate {
            var parent: TextFieldTyped

            init(_ textField: TextFieldTyped) {
                self.parent = textField
            }

            func updatefocus(textfield: UITextField) {
                textfield.becomeFirstResponder()
            }

            func textFieldShouldReturn(_ textField: UITextField) -> Bool {

                if parent.tag == 0 {
                    parent.isfocusAble = [false, true, false, false, false, false, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.0
                } else if parent.tag == 1 {
                    parent.isfocusAble = [false, false, true, false, false, false, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.0
                } else if parent.tag == 2 {
                    parent.isfocusAble = [false, false, false, true, false, false, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.0
                } else if parent.tag == 3 {
                    parent.isfocusAble = [false, false, false, false, true, false, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.2
                } else if parent.tag == 4 {
                    parent.isfocusAble = [false, false, false, false, false, true, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.3
                } else if parent.tag == 5 {
                    parent.isfocusAble = [false, false, false, false, false, false, true, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.4
                } else if parent.tag == 6 {
                    parent.isfocusAble = [false, false, false, false, false, false, false, true, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.4
                } else if parent.tag == 7 {
                    parent.isfocusAble = [false, false, false, false, false, false, false, false, true]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.4
                } else if parent.tag == 8 {
                    parent.isfocusAble = [false, false, false, false, false, false, false, false, false]
                    parent.text = textField.text ?? ""
                    parent.keyboardOffset = 0.4
                }

                return true
            }
        }
    }
}
