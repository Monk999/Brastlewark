//
//  Factory.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation
import  UIKit
class ViewControllerFactory {
    
    func CreateHabitantDetailVC(model:HabitantDataModel) -> HabitantDetailViewController{
        let viewModel = HabitantViewModel(habitant: model)
        
        let storyboard = UIStoryboard(name:"main", bundle: nil)
        
        let view = storyboard.instantiateViewController(identifier: "HabitantDetailViewController") as! HabitantDetailViewController
        
        view.viewModel = viewModel
        
        return view
    }
    
}
