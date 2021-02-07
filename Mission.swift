//
//  Mission.swift
//  Moonshot
//
//  Created by Apple on 06/02/21.
//

import Foundation

struct Mission : Codable , Identifiable {
    
    struct CrewRole : Codable {
        let name : String
        let role : String
    }
    
    
    let id : Int
    let description : String
    let launchDate : Date?
    let crew : [CrewRole]
    
    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String {
        if let launchDate = launchDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
           return dateFormatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}



