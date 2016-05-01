//
//  Player.swift
//  Sorc
//
//  Created by Nate on 4/29/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation
import AVFoundation

class Character{
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name: String = "DefaultName"
    private var _attackSound: AVAudioPlayer!
    private var _deathSound: AVAudioPlayer!
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = name
        }
    }
    
    var attackSound: AVAudioPlayer {
        get {
            return _attackSound
        }
    }
    
    var deathSound: AVAudioPlayer {
        get {
            return _deathSound
        }
    }
    

    //contructor
    init(hp: Int, attackPwr: Int, name: String) {
        self._hp = hp
        self._attackPwr = attackPwr
        self._name = name
    }
    
    //
    init(hp: Int, attackPwr: Int) {
        self._hp = hp
        self._attackPwr = attackPwr
    }
    
    
    //Function that determines if Alive
    func isAlive() -> Bool {
        if(_hp > 0) {
            return true
        }
        else {
            return false
        }
    }
    
    //function for this object getting attacked
    func attemptAttack(attackPwr: Int) -> Bool {
        if (self.hp <= 0) {
            return false
        }
        else {
            self._hp -= attackPwr
            return true
            
        }
    }
    
    //Set attack sound
    func setAttackSound(sound: String, type: String) {
        let path = NSBundle.mainBundle().pathForResource(sound, ofType: type)
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try _attackSound = AVAudioPlayer(contentsOfURL: soundURL)
            _attackSound.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func setDeathSound(sound: String, type: String) {
        let path = NSBundle.mainBundle().pathForResource(sound, ofType: type)
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try _deathSound = AVAudioPlayer(contentsOfURL: soundURL)
            _deathSound.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
    }
}