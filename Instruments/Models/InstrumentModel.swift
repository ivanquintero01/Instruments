//
//  InstrumentModel.swift
//  Instruments
//
//  Created by Johnattan on 6/06/22.
//

import UIKit
import Foundation

enum Instrument: String {
    // Good practice is to have the cases in lowercase.
    case acordeon = "Acordeon"
    case armonica = "Armonica"
    case bajo = "Bajo"
    case guitarra = "Guitarra"
    
    // When it is just one line of code the return keyword could be skipped.
    var name: String {
        rawValue
    }
    
    var image: UIImage? {
        UIImage(named: name)
    }
}

struct InstrumentModel {
    let name: String
    let image: UIImage?
}
