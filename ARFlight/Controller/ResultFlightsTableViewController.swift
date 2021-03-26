//
//  ResultFlightsTableViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit
import MapKit

//Créer mapview et tableview dans une stackview
//
// A) Mapkit :
// a) Créer une carte
// b) Connecté : object location et Mapkit
// c) Créer annotation dans la mapview : Location (Depart, Arrivé)
// d) le rendre dynamique

// Modele :
/*
 Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Arrive:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
*/

// B)
// Créer tableview
// Créer CustomCell avec les infos du voyage du modele de donnée : Code vol, Code Company, Airport Depart, Airport Arrivée, Heure Départ, Heure Arrvivé

// Modele :

/*
1)
 Code vol (Identifiant vol) :
 Flight -> flightNumber;
 
2)
 Code Company: 
 Flight -> company -> code
 
3)
 Airport Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Airport Arrivée:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
 
4)
 Heure Départ
 Flight -> departureDate
 
 5)
 Flight -> FlightLegs -> arrival -> times -> scheduled
 
 */




class ResultFlightsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
