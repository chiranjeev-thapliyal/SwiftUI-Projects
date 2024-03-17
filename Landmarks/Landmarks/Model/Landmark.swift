//
//  Landmark.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let category: Category
    var isFavorite: Bool
    let isFeatured: Bool
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    
    private let imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private let coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        let latitude: Double
        let longitude: Double
    }
    
}
