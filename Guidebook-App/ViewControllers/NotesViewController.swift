//
//  NotesViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//


import UIKit

class NotesViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        
        // Display the popup
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADDNOTES_VIEWCONTROLLER) as! AddNoteViewController
        
        // Pass the place object through
        addNoteVC.place = place
        
        // Configure the popup mode
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        // Present it
        present(addNoteVC, animated: true, completion: nil)
        
    }
    
}
