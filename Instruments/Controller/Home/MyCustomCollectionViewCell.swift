//
//  MyCustomCollectionViewCell.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 26/05/22.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var instrumentImage: UIImageView!
    @IBOutlet weak var instrumentLabel: UILabel!
          
    // MARK: - Initialization
    
    
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .lightGray
        instrumentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        instrumentLabel.textColor = .purple
        
        
    }
    
    
}
