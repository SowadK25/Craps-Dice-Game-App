//  SecondViewController.swift
//  SowadKA3Q2
//
//  Created by Sowad Khan on 2020-03-17.
//  Copyright © 2020 Sowad Khan. All rights reserved.

import UIKit

class SecondViewController: UIViewController { // Second view controller class
    
    // Variables for textVeiw and playButton
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    // Play button action listener function
    @IBAction func playButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "segue", sender: self) // Will go to the game view controller
    }

    override func viewDidLoad() { // Loading function
        super.viewDidLoad()
    }
}
