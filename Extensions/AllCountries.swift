//
//  AllCountries.swift
//  Learning Countries
//
//  Created by Eduard Sinyakov on 23/05/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class AllCountries: NSObject {
    
    var europeCountries = [String]()
    
    var asiaCountries = [String]()
    
    var africaCountries = [String]()
    
    func getEuropeCountries() -> [String] {
        
        europeCountries = ["Albania", "Armenia", "Andorra", "Austria", "Azerbaijan", "Bosnia_and_Herzegovina", "Bulgaria", "Belarus", "Belgium", "Croatia", "Cyprus", "Czech_Republic", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kazakhstan", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San_Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Turkey", "Ukraine", "United_Kingdom"]
        
        
        return europeCountries
    }
    
    func getAsiaCountries() -> [String] {
        
        asiaCountries = ["Brunei", "Bangladesh", "Bhutan", "Cambodia", "People's_Republic_of_China", "India", "Indonesia", "Japan", "Laos", "Lran", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "North_Korea", "Pakistan", "Philippines", "Singapore", "Sri_Lanka", "South_Korea", "Thailand", "Vietnam"]
        return asiaCountries
    }
}


