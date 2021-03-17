//
//  NotesViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//


import UIKit
import CoreData

class NotesViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fetchedNotesRC:NSFetchedResultsController<Note>?
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        refresh()
        
    }
    // MARK: = Methods
    
    func refresh() {
        
        // Check if there's a place set
        if let place = place {
            
            // Get a fetch request for the places
            let request:NSFetchRequest<Note> = Note.fetchRequest()
            request.predicate = NSPredicate(format: "place = %@", place)
            
            // Set a sort descriptor
            let sort = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [sort]
            
            do {
                
                // Create a fetched results controller
                fetchedNotesRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
                
                // Execute the fetch
                try fetchedNotesRC!.performFetch()
            }
            catch {}
            
            // Tell table view to request data
            tableView.reloadData()
        }
        
    }
    
    
    @IBAction func addNoteTapped(_ sender: Any) {
        
        // Display the popup
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADDNOTES_VIEWCONTROLLER) as! AddNoteViewController
        
        // Set set as delegate so we can be notified of new note being added
        addNoteVC.delegate = self
        
        // Pass the place object through
        addNoteVC.place = place
        
        // Configure the popup mode
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        // Present it
        present(addNoteVC, animated: true, completion: nil)
        
    }
}

extension NotesViewController: AddNoteDelegate {
    func noteAdded() {
        
        // Refetch the notes from core data and display in table view
        refresh()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedNotesRC?.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NOTE_CELL, for: indexPath)
        
        // Get reference to the labels
        let dateLabel = cell.viewWithTag(1) as! UILabel
        let noteLabel = cell.viewWithTag(2) as! UILabel

        // Get the note
        let note = fetchedNotesRC?.object(at: indexPath)
        
        if let note = note {
            
            dateLabel.text = "June 2020"
            noteLabel.text = note.text
            
        }
        return cell
    }
    
    
    
    
}
