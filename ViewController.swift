// Sowad Khan
// Assignment 3, Question 2
// March 15th, 2020
// Created a Craps! Dice game
// Modifications: March 16th - Created GUI layout, methods that connect all the buttons
//                March 17th - Created all win and lose conditions, new play again button and second roll button
//                April 16th - Added music to game

import UIKit
import AVFoundation

class ViewController: UIViewController { // Main class
    // Variables and connections to all GUI objects
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var rollButton2: UIButton!
    @IBOutlet weak var replayButton: UIButton!
    
    // Variables for things needed
    var leftDice = 0
    var rightDice = 0
    var sum = 0
    var points = 0
    var dice = ["1", "2", "3", "4", "5", "6"]
    var audio = AVAudioPlayer() // Audio player variable
    
    override func viewDidLoad() { // Override function
        super.viewDidLoad() // Calling parent class
        
        // Setting buttons to either visbile or not visible
        rollButton2.isHidden = true
        rollButton.isHidden = false
        replayButton.isHidden = true
        
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Background_music", ofType: "mp3")!) // Creating variable to find path of music
        audio = try! AVAudioPlayer(contentsOf: sound as URL) // Creating a file URL
        audio.prepareToPlay()
        audio.numberOfLoops = -1 // Keep the music looping
        audio.play() // Play the music
    }
    
    func rollDice() -> Int { // Function to roll dice
        // Selectring random number from 1 to 6
        leftDice = Int.random(in: 1 ... 6)
        rightDice = Int.random(in: 1 ... 6)
        return leftDice + rightDice // Returns sum of dice
    }
    
    @IBAction func replayButton(_ sender: Any) { // Replay button function
        replayButton.isHidden = true // Button is visible
        rollButton(Any.self) // Calling rollButton function
    }
    
    @IBAction func rollButton2(_ sender: Any) { // Another button class
        sum = rollDice() // Calling rollDice function
        // Setting dice images on screen
        dice1.image = UIImage(named: dice[leftDice - 1])
        dice2.image = UIImage(named: dice[rightDice - 1])
    
        if sum == points { // If sum of dice equal to previous roll
            label1.text = ("You win!") // Win label
            replayButton.isHidden = false // Show replau button
            rollButton2.isHidden = true // Hide roll button
        }
        else if sum == 7 { // If the sum is  7
            label1.text = ("You lose!") // Player loses
            replayButton.isHidden = false // Show replay
            rollButton2.isHidden = true // Hide roll
        }
        
    }
    
    @IBAction func rollButton(_ sender: Any) { // Roll button function
        sum = rollDice() // Calling rollDice function
        // Setting images of dice on screen
        dice1.image = UIImage(named: dice[leftDice - 1])
        dice2.image = UIImage(named: dice[rightDice - 1])
                
        if sum == 2 || sum == 3 || sum == 12 { // Conditions to lose
            label1.text = ("Craps! You Lose!")
            replayButton.isHidden = false
            rollButton.isHidden = true
        }
        else if sum == 7 || sum == 11 { // Conditions to win
            label1.text = ("Natural! You Win!")
            replayButton.isHidden = false
            rollButton.isHidden = true
        }
        else if sum == 1 || sum == 4 || sum == 5 || sum == 6 || sum == 8 || sum == 9 || sum == 10 { // If the sum is none of the numbers above
            points = sum // Set player points equal to sum
            label1.text = ("Your points are: \(points)") // Display points on screen
            rollButton2.isHidden = false
            rollButton.isHidden = true
        }
    }
}
