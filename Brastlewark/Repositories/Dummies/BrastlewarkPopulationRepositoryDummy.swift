//
//  BrastlewarkPopulationRepositoryDummy.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation

class BrastlewarkPopulationRepositoryDummy:BrastlewarkPopulationRepository {
    
    func getPopulation(completion: @escaping (Result<[HabitantDataModel], GetPopulationError>) -> Void) {
        
        let dummies = [HabitantDataModel(id: 0, name: "Name1", thumbnailUrl: "", age: 10, weight: 100.2, height: 200.2, hairColor: "blue", professions: ["Police"], friends: ["One"])]
        
        completion(.success(dummies))
        
    }
    
}
