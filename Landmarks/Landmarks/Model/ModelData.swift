//
//  ModelData.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import Foundation

let landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    var data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find the file \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't fetch data from \(filename) \\n\(error)")
    }
    
}
