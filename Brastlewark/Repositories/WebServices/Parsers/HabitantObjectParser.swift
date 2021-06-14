//
//  HabitantObjectParser.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation



class HabitantObjectParser {
    static func parse(dic:[String:Any]) -> HabitantDataModel?{
        
        guard let id = dic["id"] as? Int else{
            return nil
        }
    
        let name = dic["name"] as? String
        let thumbnail = dic["thumbnail"] as? String
        let age = dic["age"] as? Int
        let weight = dic["weight"] as? Float
        let height = dic["height"] as? Float

        let hair_color = dic["hair_color"] as? String
        
        let professions = dic["professions"] as? [String] ?? []

        let friends = dic["friends"] as? [String] ?? []
  
        return HabitantDataModel(id: id, name: name, thumbnailUrl: thumbnail, age: age, weight: weight, height: height, hairColor: hair_color, professions: professions, friends: friends)
    }
}
