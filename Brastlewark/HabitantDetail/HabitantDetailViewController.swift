//
//  HabitantDetailViewController.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import UIKit

class HabitantDetailViewController: UIViewController {

    var viewModel:HabitantViewModel!{
        didSet{
            viewModel.habitantDidChange = { [unowned self] viewModel in
                self.nameLabel.text = viewModel.habitant.name
                
                if let age =  viewModel.habitant.age{
                    self.ageLabel.text = String(age)
                }else{
                    self.ageLabel.text = "Unknowned"
                }
                
                if let height =  viewModel.habitant.height{
                    self.heightLabel.text = String(height)
                }else{
                    self.heightLabel.text = "Unknowned"
                }
                
                if let weight =  viewModel.habitant.weight{
                    self.weightLabel.text = String(weight)
                }else{
                    self.weightLabel.text = "Unknowned"
                }
                
                if let hairColor =  viewModel.habitant.hairColor{
                    self.hairColorLabel.text = String(hairColor)
                }else{
                    self.hairColorLabel.text = "Unknowned"
                }
                
                self.professionsLabel.text = viewModel.habitant.professions.joined(separator: ",")
              
                
                self.friendsLabel.text = viewModel.habitant.friends.joined(separator: ",")
               
                
                loadImageView(habitant: viewModel.habitant)
            }
        }
    }

    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!
    @IBOutlet var ageLabel:UILabel!
    @IBOutlet var weightLabel:UILabel!
    @IBOutlet var heightLabel:UILabel!
    @IBOutlet var hairColorLabel:UILabel!
    @IBOutlet var professionsLabel:UILabel!
    @IBOutlet var friendsLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadHabitantData()
    }
    
    func loadImageView(habitant:HabitantDataModel) {
        if let urlString = habitant.thumbnailUrl{
            if let url = URL(string: urlString){
                thumbnailImageView?.af.setImage(withURL: url)
            }
        }
    }
    
    @IBAction func clickClose(){
        dismiss(animated: true, completion: nil)
    }
}
