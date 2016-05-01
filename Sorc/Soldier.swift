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
        setSounds();
    }
    
    convenience init(name: String) {
        self.init(hp: 100, attackPwr: 15, name: name)
        setSounds();
    }
    
    func setSounds() {
        self.setDeathSound("MaleGrunt", type: "wav")
        self.setAttackSound("Spear", type: "wav")
    }
}