//
//  PetsTableViewCell.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

import UIKit

class PetsTableViewCell: UITableViewCell {

    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeCell()
    }
    
    func customizeCell() {
        DispatchQueue.main.async {
            self.petImageView.layer.cornerRadius = self.petImageView.frame.size.width / 2
            self.petImageView.clipsToBounds = true
        }
    }
}
