//
//  ViewController.swift
//  Guidebook-App
//
//  Created by Kyle Sherrington on 2021-03-15.
//


import UIKit

class ViewController: UIViewController {
    
    // get reference to Core Data
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            // Get the places from Core Data
            places = try context.fetch(Place.fetchRequest())
        }
        catch {
           print("Couldn't fetch places from core data")
        }
        
        // Set view controller as delegate and data source of tableView
        tableView.dataSource = self
        tableView.delegate = self
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Double check that a row was selected
        if tableView.indexPathForSelectedRow == nil {
            // Nothing is selected
            return
        }
        
        // Get the selected place
        let selectedPlace = self.places[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the place view controller
        let placeVC = segue.destination as! PlaceViewController
        
        // Set the place
        placeVC.place = selectedPlace
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell reference
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PLACE_CELL) as! PlaceTableViewCell
        
        // Get the place
        let p = self.places[indexPath.row]
        
        // Customize the cell for the place that we're trying to show
        cell.setCell(p)
        
        // Return the cell
        return cell
    }
    
  
    
}
