//
//  CollectionViewCell.swift
//  TouchGameDemo
//
//  Created by nier on 2021/2/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: PaddingLabel!
    
    private var mainColor: UIColor!
    
    var indexOfCell: Int = 0 {
        willSet(newValue) {
            switch newValue % 6 {
            case 0, 1:
                mainColor = .red
            case 2, 3:
                mainColor = .green
            case 4, 5:
                mainColor = .blue
            default:
                break
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                label.textColor = .white
                label.backgroundColor = mainColor
            } else {
                label.textColor = mainColor
                label.backgroundColor = mainColor.withAlphaComponent(0.3)
            }
        }
    }
}
