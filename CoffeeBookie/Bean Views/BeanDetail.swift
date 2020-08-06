//
//  Bean Detail.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

//import SwiftUI
//
//struct BeanDetail: View {
//    @State var bean: Bean
//    var index: Int
//    @State var showingEdit = false
//    
//    
//    var editButton: some View {
//        Button(action: {
//            if self.showingEdit == true {
//                self.userData.beans[self.index] = self.bean
//            }
//            
//            self.showingEdit.toggle()
//        }) {
//            if self.showingEdit == false {
//                Text("Edit")
//            } else {
//                Text("Done")
//            }
//        }
//    }
//
//    var body: some View {
//            VStack {
//                if showingEdit {
//                    TextField("Name", text: $bean.name)
//                        .font(.largeTitle)
//                        .multilineTextAlignment(.center)
//                        .keyboardType(.default)
//                    List{
//                        Section(header: Text("Bean")) {
//                            Text("Roast: \(bean.category.rawValue)")
//                            HStack {
//                                Text("Origin:")
//                                TextField("Origin", text: $bean.origin)
//                            }
//                            HStack {
//                                Text("Species:")
//                                TextField("Species", text: $bean.species)
//                            }
//                        }
//                        Section(header: Text("Brew Details")) {
//                            HStack {
//                                Text("Brew Temp:")
//                                TextField("Brew Temp", text: $bean.brewTemp)
//                                    .keyboardType(.numberPad)
//                            }
//                            HStack {
//                                Text("Grind Setting:")
//                                TextField("Grind Setting", text: $bean.grind)
//                                    .keyboardType(.numberPad)
//                            }
//                            HStack {
//                                Text("Bloom Time:")
//                                TextField("Bloom Time", text: $bean.bloomTime)
//                                    .keyboardType(.numberPad)
//                            }
//                            HStack {
//                                Text("Ratio:")
//                                TextField("Ratio", text: $bean.ratio)
//                                    .keyboardType(.numberPad)
//                            }
//                            HStack {
//                                Text("Grind Time:")
//                                TextField("Grind Time", text: $bean.grindTime)
//                                    .keyboardType(.numberPad)
//                            }
//                        }
//                    }
//                    .onAppear(perform: {
//                        UITableView.appearance().tableFooterView = UIView()
//                    })
//                }
//                
//                else {
//                    List{
//                        Section(header: Text("Bean")) {
//                            Text("Roast: \(bean.category.rawValue)")
//                            Text("Origin: \(bean.origin)")
//                            Text("Species: \(bean.species)")
//                        }
//                        Section(header: Text("Brew Details")) {
//                            Text("Brew Temp: \(bean.brewTemp)")
//                            Text("Grind Setting: \(bean.grind)")
//                            Text("Bloom Time: \(bean.bloomTime)")
//                            Text("Ratio: \(bean.ratio)")
//                            Text("Grind Time: \(bean.grindTime)")
//                        }
//                    }
//                    .navigationBarTitle(bean.name)
//                    .onAppear(perform: {
//                        UITableView.appearance().tableFooterView = UIView()
//                    })
//                }
//            }
//            .navigationBarItems(trailing: editButton)
//    }
//}
//
//struct BeanDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BeanDetail(bean: beanData[0], index: 0)
//    }
//}
