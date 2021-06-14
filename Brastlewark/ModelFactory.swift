//
//  Factory.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation
import  UIKit

enum EnviromentType {
    case WebService
    case Dummy
}
class ModelFactory {
    
    
    
    static var singleton:ModelFactory = ModelFactory()
    
    let enviroment:EnviromentType = .WebService // Set the enviroment
    
    private init(){}
    
     func CreateHabitantDetailVC(model:HabitantDataModel) -> HabitantDetailViewController{
        
        let viewModel = HabitantViewModel(habitant: model)
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(identifier: "HabitantDetailViewController") as! HabitantDetailViewController
        
        view.viewModel = viewModel
        
        return view
    }
    
    func CreatePopulationListViewController() -> PopulationListViewController{
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        var repository:BrastlewarkPopulationRepository!

        switch enviroment {
        case .Dummy:
            repository = BrastlewarkPopulationRepositoryDummy()
        case .WebService:
            repository = BrastlewarkPopulationRepositoryWS()
        }
        
        let viewModel = PopulationListViewModel(repository: repository)

        let view = storyboard.instantiateViewController(identifier: "PopulationListViewController") as! PopulationListViewController
        
        view.viewModel = viewModel
        
        return view
    }
    
}
