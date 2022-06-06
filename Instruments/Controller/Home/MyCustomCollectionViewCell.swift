//
//  MyCustomCollectionViewCell.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 26/05/22.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    // A good practice is to keep all the UI private
    @IBOutlet weak private var instrumentImage: UIImageView!
    @IBOutlet weak private var instrumentLabel: UILabel!
          
    // MARK: - Initialization
    
    
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .lightGray
        instrumentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        instrumentLabel.textColor = .purple
    }
    
    func setupWithInstrument(_ instrument: Instrument) {
        instrumentImage.image = instrument.image
        instrumentLabel.text = instrument.name
    }
    
    func setupWithInstrumentModels(_ instrument: InstrumentModel) {
        instrumentImage.image = instrument.image
        instrumentLabel.text = instrument.name
    }
}
