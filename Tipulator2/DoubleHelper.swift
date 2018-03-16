//
//  DoubleHelper.swift
//  Tipulator2
//
//  Created by Jacob Metcalf on 3/15/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
