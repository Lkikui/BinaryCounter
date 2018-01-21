//  CustomCell.swift
//  BinaryCounter
//
//  Created by Lisa Ryland on 1/20/18.
//  Copyright © 2018 Lisa Ryland. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    weak var deligate: CustomCellDelegate?
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        deligate?.customCellDidSubtract(self)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        deligate?.customCellDidAdd(self)
    }
    
}
