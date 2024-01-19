//
//  Bundle-Decodable.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import Foundation

extension Bundle {
    func decode<T: Codable >(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed ot located \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        let yearFormatter = DateFormatter()
        
        formatter.dateFormat = "y-MM-dd"
        yearFormatter.dateFormat = "y"
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
    
}
