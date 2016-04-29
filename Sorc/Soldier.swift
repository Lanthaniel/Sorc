//
//  Soldier.swift
//  Sorc
//
//  Created by Nate on 4/29/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation


class Soldier: Character {
    
    convenience init() {
        self.init(hp: 100, attackPwr: 15, name: "Soldier Dude")
    }
    
    convenience init(name: String) {
        self.init(hp: 100, attackPwr: 15, name: name)
    }
}