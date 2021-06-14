//
//  PopulationListViewModel.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import Foundation

class PopulationListViewModel{
    
    var repository:BrastlewarkPopulationRepository = BrastlewarkPopulationRepositoryDummy()
    
    var populationDidChange: ((PopulationListViewModel) -> ())?
    
    var fetchFailedCallBack: ((PopulationListViewModel) -> ())?

    var population:[HabitantDataModel] = []
    {
        didSet{
            self.populationDidChange?(self)
        }
    }
    
    init(repository:BrastlewarkPopulationRepository) {
        self.repository = repository
    }
    public func fetchPopulation(){
        repository.getPopulation {[unowned self] result in
            switch result{
            case .success(let data):
                self.population = data
                break
            case .failure(let error):
                switch error {
                case .Unknowed(let detail):
                    print(detail)
                    self.fetchFailedCallBack?(self)
                }
                break
            }
        }
    }
    
    
}
