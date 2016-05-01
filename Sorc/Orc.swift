//
//  Orc.swift
//  Sorc
//
//  Created by Nate on 4/29/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation


class Orc: Character {
    
    
    convenience init() {
        self.init(hp: 150, attackPwr: 10, name: "Orc Man")
        setSounds();
    }
    
    convenience init(name: String) {
        self.init(hp: 150, attackPwr: 10, name: name)
        setSounds();
    }
    
    func setSounds() {
        self.setDeathSound("OrcGrunt", type: "wav")
        self.setAttackSound("Club", type: "wav")
    }
}