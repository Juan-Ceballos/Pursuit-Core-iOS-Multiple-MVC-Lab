//
//  AnimalCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Juan Ceballos on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalRegionLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    func configureCell(for zooAnimal: ZooAnimal)    {
        animalRegionLabel.text = zooAnimal.origin
        animalNameLabel.text = zooAnimal.name
        animalImage.image = UIImage(named: zooAnimal.imageNumber.description)
    }
}
