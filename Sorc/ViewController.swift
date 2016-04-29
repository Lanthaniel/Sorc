//
//  ViewController.swift
//  Sorc
//
//  Created by Nate on 4/28/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    
    //The bottom game status text
    @IBOutlet weak var statusText: UILabel!
    
    //The players' HP Labels
    @IBOutlet weak var p1HpLbl: UILabel!
    @IBOutlet weak var p2HpLbl: UILabel!
    
    //The players' attack buttons
    @IBOutlet weak var p1AttackBtn: UIButton!
    @IBOutlet weak var p2AttackBtn: UIButton!
    
    //The player image icons
    @IBOutlet weak var p1Image: UIImageView!
    @IBOutlet weak var p2Image: UIImageView!
    
    
    
    //Properties
    var p1: Character!
    var p2: Character!
    var currentAttacker: Character!
    var currentDefender: Character!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create the players
        p1 = Orc()
        p2 = Soldier()
        
        //initialize the player HP bars
        p1HpLbl.text = "\(p1.hp) HP"
        p2HpLbl.text = "\(p2.hp) HP"
        
    }

    
    @IBAction func onAttackPressed(btn: UIButton!) {
        
        if(p1.isAlive() && p2.isAlive()) {
            //determine who is attacking who
            if (btn.tag == 1){
                currentAttacker = p1
                currentDefender = p2
                p2AttackBtn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3.0, target:self, selector: #selector(enableAttackButton), userInfo: p2AttackBtn, repeats: false)
            }
            else {
                currentAttacker = p2
                currentDefender = p1
                p1AttackBtn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3.0, target:self, selector: #selector(enableAttackButton), userInfo: p1AttackBtn, repeats: false)
            }
            
            if(currentDefender.attemptAttack(currentAttacker.attackPwr)) {
                statusText.text = "\(currentAttacker.name) attacked \(currentDefender.name)!"
            }
            
            p1HpLbl.text = "\(p1.hp) HP"
            p2HpLbl.text = "\(p2.hp) HP"
            
            isPlayerDead()
        }
    
    }


    
    func isPlayerDead() {
        if(!p1.isAlive()) {
            p1Image.hidden = true
            
            statusText.text = "\(p2.name) has won the battle!"
        }
        if(!p2.isAlive()) {
            p2Image.hidden = true
            
            statusText.text = "\(p1.name) has won the battle!"
        }
    }
    
    func enableAttackButton(timer: NSTimer) {
        let btn = timer.userInfo as! UIButton!
        btn.enabled = true
    }
    
}

