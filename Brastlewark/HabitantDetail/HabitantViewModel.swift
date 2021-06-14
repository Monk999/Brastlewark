//
//  HabitantViewModel.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation

class HabitantViewModel {
    
    var habitant: HabitantDataModel{
        didSet{
            self.habitantDidChange?(self)
        }
    }
    
    var habitantDidChange: ((HabitantViewModel) -> ())?

    required init(habitant: HabitantDataModel) {
            self.habitant = habitant
    }
    
    func reloadHabitantData(){
        self.habitantDidChange?(self)
    }
}
