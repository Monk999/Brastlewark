//
//  BrastlewarkPopulationRepository.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//
import Foundation

import Alamofire


class BrastlewarkPopulationRepositoryWS:BrastlewarkPopulationRepository {
    
    func getPopulation(completion: @escaping (_ result:Result<[HabitantDataModel],GetPopulationError>) -> Void){
        
        let endpoint = APIConstants.endpoints.brastlewarkPopulation
    
        let request = AF.request(endpoint,method: .get)
        
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let jsonDic = value as? [String:Any] else {
                    completion(.failure(.Unknowed(detail: "Json parse error")))
                    break
                }
                guard let brastlewark = jsonDic["Brastlewark"] as? [[String:Any]] else {
                    completion(.failure(.Unknowed(detail: "brastlewark key is missing")))
                    break
                }
                
                var population:[HabitantDataModel] = []
                
                for item in brastlewark{
                    guard let object = HabitantObjectParser.parse(dic: item) else {
                        continue
                    }
                    population.append(object)
                    
                }
                completion(.success(population))
                
            case .failure(let error):
                completion(.failure(.Unknowed(detail: error.localizedDescription)))
                break
            }
        }

    }
}
