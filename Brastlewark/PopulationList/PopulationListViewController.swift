//
//  ViewController.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import UIKit

class PopulationListViewController: UITableViewController {

    
    var population:[HabitantDataModel] = []
    
    var viewModel:PopulationListViewModel!{
        didSet{
            viewModel.populationDidChange = { [unowned self] viewModel in
                self.population = viewModel.population
                self.tableView.reloadData()
                refreshControl?.endRefreshing()
            }
            
            viewModel.fetchFailedCallBack = { [unowned self] viewModel in
                self.showAlert(title: "An error ocurred try again!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        
        refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
                
        refresh(nil)
    }
    
    @objc func refresh(_ sender: AnyObject?){
        refreshControl?.beginRefreshing()
        viewModel.fetchPopulation()
        
    }
    
    func showAlert(title:String){
        let alert  = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.show(self, sender: nil)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return population.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PopulationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PopulationTableViewCell", for: indexPath) as! PopulationTableViewCell
        
        cell.setup(habitant: population[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = population[indexPath.row]
        showHabitantDetailVC(model: model)
    }
    
    func showHabitantDetailVC(model:HabitantDataModel){
        
      
        let view = ModelFactory.singleton.CreateHabitantDetailVC(model: model)
        
        self.present(view, animated: true, completion: nil)

    }
    
}

