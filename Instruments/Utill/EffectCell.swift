//
//  UIButtonExtesnsion.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 24/05/22.
//

import UIKit

extension UIButton {
    
    // Borde redondo
    
    func round() {
        layer.cornerRadius = bounds.height / 2.0
        clipsToBounds = true
    }
    
    // Brilla
    
    func shine()  {
        
        UIView.animate(withDuration: 0.1, animations:{ self.alpha = 0.5
        }){(completion) in
            
            UIView.animate(withDuration: 0.1, animations: { self.alpha = 1
            })
        }
    }
    
}
