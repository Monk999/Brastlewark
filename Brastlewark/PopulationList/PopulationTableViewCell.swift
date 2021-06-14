//
//  PopulationTableViewCell.swift
//  Brastlewark
//
//  Created by Gerardo Juarez sanchez on 14/06/21.
//

import UIKit
import AlamofireImage
class PopulationTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!

    func setup(habitant:HabitantDataModel){
        nameLabel.text = habitant.name
        
        if let urlString = habitant.thumbnailUrl{
            if let url = URL(string: urlString){
                thumbnailImageView.af.setImage(withURL: url)
            }
        }
    }
    
    

}
