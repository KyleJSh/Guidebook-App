//
//  InfoViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        summaryLabel.text = place?.summary
        
    }
    

}
