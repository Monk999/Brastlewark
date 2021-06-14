//
//  HabitantDataModel.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation

struct HabitantDataModel {
    let id:Int
    let name:String?
    let thumbnailUrl:String?
    let age:Int?
    let weight:Float?
    let height:Float?
    let hairColor:String?
    let professions:[String]
    let friends:[String]
}
