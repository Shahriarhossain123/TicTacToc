//
//  ViewController.swift
//  Tic Tac Toc
//
//  Created by apple on 3/12/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var allover: UIView!
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewEdit()
        
    }
    
    //R:35 G:35 B:35
    
    func viewEdit() {
        topImage.image = UIImage(named: "X")
        
        playOutlet.layer.cornerRadius = 30
        playOutlet.layer.masksToBounds = false
        playOutlet.layer.shadowColor = UIColor.blue.cgColor
        playOutlet.layer.shadowOffset =  CGSize.zero
        playOutlet.layer.shadowOpacity = 0.5
        playOutlet.layer.shadowRadius = 6
        
        allover.layer.cornerRadius = 6
        allover.layer.masksToBounds = false
        allover.layer.shadowColor = UIColor.black.cgColor
        allover.layer.shadowOffset =  CGSize.zero
        allover.layer.shadowOpacity = 0.5
        allover.layer.shadowRadius = 6
    }
    
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "X"), for: UIControl.State())
                sender.layer?.backgroundColor = UIColor.clear.cgColor
                sender.imageView!.tintColor = UIColor(red: 0/255, green: 86/255, blue: 186/255, alpha: 1.0)
                topImage.image = UIImage(named: "O")
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "O"), for: UIControl.State())
                sender.layer?.backgroundColor = UIColor.clear.cgColor
                sender.imageView!.tintColor = UIColor(red: 217/255, green: 12/255, blue: 36/255, alpha: 1.0)
                topImage.image = UIImage(named: "X")
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    winLabel.text = "wins!"
                    topImage.image = UIImage(named: "X")
                }
                else
                {
                    winLabel.text = "wins!"
                    topImage.image = UIImage(named: "O")
                }
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            winLabel.text = "draws"
        }
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
         activePlayer = 2
         gameIsActive = true
         gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

         for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
                button.layer.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1.0).cgColor
            }

        }
    }
}

