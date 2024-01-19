//
//  mission.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import Foundation



struct Mission : Codable, Identifiable{
    
    let id : Int
    let launchDate : Date?
    let crew : [CrewRole]
    let description : String
    var displayName : String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    struct CrewRole: Codable {
        let name: String
        let role : String
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
        }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y"

        return launchDate.map { dateFormatter.string(from: $0) } ?? "N/A"

        }
    
    
}
