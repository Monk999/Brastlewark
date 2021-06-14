//
//  File.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation

enum GetPopulationError:Error{
    case Unknowed(detail:String)
}


protocol BrastlewarkPopulationRepository:AnyObject {
    func getPopulation(completion: @escaping (_ result:Result<[HabitantDataModel],GetPopulationError>) -> Void)
}
