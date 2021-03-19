//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit

class SearchFlightViewController: UIViewController {
    
    //    @IBOutlet weak var departTown : UITextField!
    //    @IBOutlet weak var arriveTown : UITextField!
    //    @IBOutlet weak var departDate : UITextField!
    //    @IBOutlet weak var arriveDate : UITextField!
    
    //    private let textField = UITextField()
    //    var flightArray : [Flight]?
    //    var state
    
    var flight : Flight?
    var flightArray : [Flight]?
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        
        print("SEARCH1")
        //setUp()
        print("SEARCH2")
        
    }
    
    //MARK: - Private methods
    
    private func setUp() {
        
        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
        print(planes.first)
        
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        print(codeAirport)
        
        NetworkServiceFlight.shared.getFlightDetailsFor(flightId: "20210115+AF+1496") { (result) in
            switch result {
            case .success(let flight):
                print("Flight detail: \(flight)")
                DispatchQueue.main.async {
                    self.flight = flight
                }
            case .failure(let error):
                print("Error getting flight details: \(error.localizedDescription)")
            }
        }
        
        NetworkServiceFlight.shared.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DSS", destination: "CDG") { [weak self] (resultflight) in
            switch resultflight {
            case .success(let flights):
                print("Flights found: \(flights)")
                self?.flightArray = flights
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"
        
        view.backgroundColor = UIColor.lightGray
        
        // Créér Image
        let imagePlane = UIImage(systemName: "airplane")
        let myImagePlane:UIImageView = UIImageView()
        myImagePlane.contentMode = UIView.ContentMode.left
        myImagePlane.contentMode = UIView.ContentMode.scaleAspectFit
        //        myImagePlane.frame.size.width = 150
        //        myImagePlane.frame.size.height = 150
        //        myImagePlane.center = self.view.center
        myImagePlane.image = imagePlane
        //        view.addSubview(myImagePlane)
        
        // Title Label Depart
        let titleLabelDepart = UILabel()
        titleLabelDepart.text = "Depart"
        titleLabelDepart.numberOfLines = 0
        titleLabelDepart.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelDepart.textAlignment = .center
        titleLabelDepart.textColor = .black
        titleLabelDepart.adjustsFontForContentSizeCategory = true
        titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView Image Plane + Title Label Depart
        let contentStackViewDepart = UIStackView(arrangedSubviews: [myImagePlane, titleLabelDepart])
        contentStackViewDepart.axis = .horizontal
        contentStackViewDepart.alignment = .fill
        contentStackViewDepart.distribution = .fill
        contentStackViewDepart.spacing = UIStackView.spacingUseSystem
        contentStackViewDepart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStackViewDepart)
        
        NSLayoutConstraint.activate([
            //            https://dev.to/andrewlawlerdev/programmatic-constraints-in-swift-kj
            
            //         TOP
            contentStackViewDepart.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            //            contentStackViewImageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            
            //           LEADING
            contentStackViewDepart.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3.0),
            //            contentStackViewImageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // TRAILING
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackViewDepart.trailingAnchor, multiplier: 3.0)
            //            contentStackViewImageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //            CenterX Anchor / CenterY Anchor
            //            contentStackViewImageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // contentStackViewImageTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30)
            
            //            Width Anchor / Height Anchor
            //            contentStackViewImageTitle.heightAnchor.constraint(equalToConstant: 50),
            //            contentStackViewImageTitle.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        // Label Ville
        let titleLabel = UILabel()
        titleLabel.text = "Ville"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .cyan
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textField = UITextField()
        textField.placeholder = "Depart"
        
        // StackView Label Ville + Textfield Depart
        let contentStackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        contentStackView.axis = .horizontal
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentStackView)
        // setup les views(
        
        NSLayoutConstraint.activate([
            
            //            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentStackViewImageTitle.topAnchor, multiplier: 3.0)
            
            contentStackView.topAnchor.constraint(equalTo: contentStackViewDepart.topAnchor, constant: 40),
            
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3.0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 3.0),
        ])
        
        let textOr = UILabel()
        textOr.text = "OR"
        textOr.font = UIFont.preferredFont(forTextStyle: .headline)
        textOr.textColor = .black
        textOr.textAlignment = .center
        textOr.adjustsFontForContentSizeCategory = true
        textOr.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textOr)
        
        // Debug colors
        textOr.backgroundColor = .red
        titleLabel.backgroundColor = .purple
        textField.backgroundColor = .orange
        
        NSLayoutConstraint.activate([
            textOr.topAnchor.constraint(equalToSystemSpacingBelow: contentStackView.topAnchor, multiplier: 3.0),
            
            textOr.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3.0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: textOr.trailingAnchor, multiplier: 3.0),
        ])
        
        // Current Location
        let imageLocation = UIImage(systemName: "magnifyingglass")
        let myImageLocation:UIImageView = UIImageView()
        myImageLocation.contentMode = UIView.ContentMode.left
        myImageLocation.contentMode = UIView.ContentMode.scaleAspectFit
        myImageLocation.image = imageLocation

        // Title Label Arrive
        let titleLabelArrive = UILabel()
        titleLabelArrive.text = "Arrive"
        titleLabelArrive.numberOfLines = 0
        titleLabelArrive.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelArrive.textAlignment = .center
        titleLabelArrive.textColor = .black
        titleLabelArrive.adjustsFontForContentSizeCategory = true
        titleLabelArrive.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

