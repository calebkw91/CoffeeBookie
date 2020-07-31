//
//  Espresso.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Bean: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var origin: String
    var species: String
    var category: Category
    var isFavorite: Bool
    var grind: Int
    var bloomTime: Int
    var brewTemp: Int
    var ratio: String
    var grindTime: Int
    
    static let `default` = Self(id: 0, name: "Bean Edit", imageName: "image", coordinates: Coordinates(latitude: 0, longitude: 0), origin: "Africa", species: "Arabica", category: .lightRoast, isFavorite: true, grind: 9, bloomTime: 35, brewTemp: 190, ratio: "1:1.3", grindTime: 6)

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case espresso = "Espresso"
        case lightRoast = "Light Roast"
        case mediumRoast = "Medium Roast"
        case darkRoast = "Dark Roast"
    }
}

extension Bean {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
