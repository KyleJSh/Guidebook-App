//
//  AddNoteViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-16.
//


import UIKit
import CoreData

class AddNoteViewController: UIViewController {

    // MARK: - Variables and Properties
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardView.layer.cornerRadius = 5
        
        // Add shadow styling
        cardView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
    }
    
// MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
        // Create a new note
        let n = Note(context: context)
        
        // Configure the properties
        n.date = Date()
        n.text = textView.text
        n.place = place
        
        // Save the core data context
        appDelegate.saveContext()
        
        // Dismiss popup when save is tapped
        dismiss(animated: true, completion: nil)
    }
    
}
