//
//  ViewController.swift
//  Queues
//
//  Created by Duncan Champney on 10/11/18.
//  Copyright © 2018 Duncan Champney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = ""
    }
    
    @IBAction func startTestButtonPress(_ sender: UIButton) {
        
        messageLabel.text = "Starting test"
        
        activityIndicator.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            Thread.sleep(until: Date(timeIntervalSinceNow: 2.0))
            
            DispatchQueue.main.async {
                
                self?.activityIndicator.stopAnimating()
                
                self?.messageLabel.text = "Test completed"
            }
        }
    }
}
