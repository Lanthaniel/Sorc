//
//  ViewController.swift
//  Sorc
//
//  Created by Nate on 4/28/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    //The game restart button
    @IBOutlet weak var resetBtn: UIButton!
    
    
    //Properties
    var p1: Character!
    var p2: Character!
    var currentAttacker: Character!
    var currentDefender: Character!
    var bgMusic: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAudio()
        setUpGame()
        
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
                currentAttacker.attackSound.play();
            }
            
            p1HpLbl.text = "\(p1.hp) HP"
            p2HpLbl.text = "\(p2.hp) HP"
            
            isPlayerDead()
        }
    
    }

    @IBAction func onResetPressed(sender: AnyObject) {
        setUpGame()
    }

    
    func isPlayerDead() {
        if(!p1.isAlive()) {
            p1.deathSound.play()
            p1Image.hidden = true
            
            statusText.text = "\(p2.name) has won the battle!"
            gameIsOver(p2Image)
        }
        if(!p2.isAlive()) {
            p2.deathSound.play()
            p2Image.hidden = true
            
            statusText.text = "\(p1.name) has won the battle!"
            gameIsOver(p1Image)
        }
        
    }
    
    //The game is over, so hide game components and show reset button
    func gameIsOver(winner: UIImageView!) {
        p1Image.hidden = true
        p2Image.hidden = true
        p1HpLbl.hidden = true
        p2HpLbl.hidden = true
        p1AttackBtn.hidden = true
        p2AttackBtn.hidden = true
        resetBtn.hidden = false
        winner.hidden = false
    }
    
    
    //re-enables the attack button
    func enableAttackButton(timer: NSTimer) {
        let btn = timer.userInfo as! UIButton!
        btn.enabled = true
    }
    
    //for game initialization
    func setUpGame() {
        
        //create the players
        p1 = Orc()
        p2 = Soldier()
        
        //initialize the text labels
        p1HpLbl.text = "\(p1.hp) HP"
        p2HpLbl.text = "\(p2.hp) HP"
        statusText.text = "Let the battle begin!"
        
        
        //hide and unhide needed objects
        p1Image.hidden = false
        p2Image.hidden = false
        p1HpLbl.hidden = false
        p2HpLbl.hidden = false
        p1AttackBtn.hidden = false
        p2AttackBtn.hidden = false
        resetBtn.hidden = true
        
    }
    
    func setUpAudio() {
        let path = NSBundle.mainBundle().pathForResource("bg", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try bgMusic = AVAudioPlayer(contentsOfURL: soundURL)
            bgMusic.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
        
        
        bgMusic.play()
        bgMusic.volume = 0.1
    
    }
}

