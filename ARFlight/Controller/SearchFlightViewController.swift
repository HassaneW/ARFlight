//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit

class ActionButton: UIButton {
    
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    private func sharedInit() {
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.red.cgColor
        backgroundColor = UIColor.purple
    }
}

class SearchFlightViewController: UIViewController {
    
    //    @IBOutlet weak var departTown : UITextField!
    //    @IBOutlet weak var arriveTown : UITextField!
    //    @IBOutlet weak var departDate : UITextField!
    //    @IBOutlet weak var arriveDate : UITextField!
    
    //    private let textField = UITextField()
    //    var flightArray : [Flight]?
    //    var state
    
    private let textOr = UILabel()
    
    var flight : Flight?
    var flightArray : [Flight]?
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        
        print("SEARCH1")
        setUp()
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
        
        // 1) StackView Depart
        
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
        
        //  StackView Depart
        let contentStackViewDepart = UIStackView(arrangedSubviews: [myImagePlane, titleLabelDepart])
        contentStackViewDepart.axis = .horizontal
        contentStackViewDepart.alignment = .fill
        contentStackViewDepart.distribution = .fill
        contentStackViewDepart.spacing = UIStackView.spacingUseSystem
        contentStackViewDepart.translatesAutoresizingMaskIntoConstraints = false
         
        
        // 2) StackView Ville Depart
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
        textField.delegate = self
        textField.placeholder = "Depart"
        
        // StackView Ville Depart
        let stackViewCityStart = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackViewCityStart.axis = .horizontal
        stackViewCityStart.alignment = .fill
        stackViewCityStart.spacing = UIStackView.spacingUseSystem
        stackViewCityStart.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // 3) text OR
        textOr.text = "OR"
        textOr.font = UIFont.preferredFont(forTextStyle: .headline)
        textOr.textColor = .black
        textOr.textAlignment = .center
        textOr.adjustsFontForContentSizeCategory = true
        textOr.translatesAutoresizingMaskIntoConstraints = false
         
        
        // 3 StackView Current Location
        
        // Créér Image
        let imageSearch = UIImage(systemName: "magnifyingglass.circle.fill")
        let myImageSearch:UIImageView = UIImageView()
        myImageSearch.contentMode = UIView.ContentMode.left
        myImageSearch.contentMode = UIView.ContentMode.scaleAspectFit
        myImageSearch.image = imageSearch
        
        // Title Label Current
        let currentLabelDepart = UILabel()
        currentLabelDepart.text = "Current"
        currentLabelDepart.numberOfLines = 0
        currentLabelDepart.font = UIFont
            .preferredFont(forTextStyle: .headline)
        currentLabelDepart.textAlignment = .center
        currentLabelDepart.textColor = .black
        currentLabelDepart.adjustsFontForContentSizeCategory = true
        
        // Switch Current
        
        let currentSwitch = UISwitch()
        currentSwitch.setOn(false, animated: false)
        currentSwitch.tintColor = UIColor.blue
        currentSwitch.onTintColor = UIColor.cyan
        currentSwitch.thumbTintColor = UIColor.red
        
//               currentSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: UIControlEvents.valueChanged)

        let stackViewCurrentLocation = UIStackView(arrangedSubviews: [myImageSearch, currentLabelDepart, currentSwitch])
        stackViewCurrentLocation.axis = .horizontal
        stackViewCurrentLocation.alignment = .fill
        stackViewCurrentLocation.spacing = UIStackView.spacingUseSystem
        stackViewCurrentLocation.translatesAutoresizingMaskIntoConstraints = false
        
         
        
        
        // 1) StackView Arrive
        
        // Créér Image
        let imagePlaneArrive = UIImage(systemName: "airplane")
        let myImagePlaneArrive:UIImageView = UIImageView()
        myImagePlaneArrive.contentMode = UIView.ContentMode.left
        myImagePlaneArrive.contentMode = UIView.ContentMode.scaleAspectFit
        myImagePlaneArrive.image = imagePlaneArrive
        
        // Title Label Depart
        let titleLabelArrive = UILabel()
        titleLabelArrive.text = "Arrive"
        titleLabelArrive.numberOfLines = 0
        titleLabelArrive.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelArrive.textAlignment = .center
        titleLabelArrive.textColor = .black
        titleLabelArrive.adjustsFontForContentSizeCategory = true
        titleLabelArrive.translatesAutoresizingMaskIntoConstraints = false
        
        //  StackView Depart
        let contentStackViewArrive = UIStackView(arrangedSubviews: [myImagePlaneArrive, titleLabelArrive])
        contentStackViewArrive.axis = .horizontal
        contentStackViewArrive.alignment = .fill
        contentStackViewArrive.distribution = .fill
        contentStackViewArrive.spacing = UIStackView.spacingUseSystem
        contentStackViewArrive.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 2) StackView VilleArrive
        // Label Ville
        let titleLabelVilleArrive = UILabel()
        titleLabelVilleArrive.text = "Ville"
        titleLabelVilleArrive.numberOfLines = 0
        titleLabelVilleArrive.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelVilleArrive.textColor = .cyan
        titleLabelVilleArrive.adjustsFontForContentSizeCategory = true
        titleLabelVilleArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textFieldVilleArrive = UITextField()
        textFieldVilleArrive.placeholder = "Arrive"
        
        // StackView Ville Depart
        let contentStackViewVilleArrive = UIStackView(arrangedSubviews: [titleLabelVilleArrive, textFieldVilleArrive])
        contentStackViewVilleArrive.axis = .horizontal
        contentStackViewVilleArrive.alignment = .fill
        contentStackViewVilleArrive.spacing = UIStackView.spacingUseSystem
        contentStackViewVilleArrive.translatesAutoresizingMaskIntoConstraints = false
        
        //view.addSubview(contentStackViewVilleArrive)
        
        // StackView Calendar
        
        // Créér Image
        let imageCalendar = UIImage(systemName: "calendar.circle")
        let myImageCalendar:UIImageView = UIImageView()
        myImageCalendar.contentMode = UIView.ContentMode.left
        myImageCalendar.contentMode = UIView.ContentMode.scaleAspectFit
        myImageCalendar.image = imageCalendar
        
        // Title Label Current
        let currentLabelCalendar = UILabel()
        currentLabelCalendar.text = "Calendar "
        currentLabelCalendar.numberOfLines = 0
        currentLabelCalendar.font = UIFont
            .preferredFont(forTextStyle: .headline)
        currentLabelCalendar.textAlignment = .center
        currentLabelCalendar.textColor = .black
        currentLabelCalendar.adjustsFontForContentSizeCategory = true
        
        let stackViewCalendar = UIStackView(arrangedSubviews: [myImageCalendar, currentLabelCalendar])
        stackViewCalendar.axis = .horizontal
        stackViewCalendar.alignment = .fill
        stackViewCalendar.spacing = UIStackView.spacingUseSystem
        stackViewCalendar.translatesAutoresizingMaskIntoConstraints = false
        
        //view.addSubview(stackViewCalendar)
        
        
        // StackView Date Depart
        
        // Label Ville
        let titleLabelDateDepart = UILabel()
        titleLabelDateDepart.text = "Date entre le "
        titleLabelDateDepart.numberOfLines = 0
        titleLabelDateDepart.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelDateDepart.textColor = .cyan
        titleLabelDateDepart.adjustsFontForContentSizeCategory = true
        titleLabelDateDepart.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textFieldDateDepart = UITextField()
        textFieldDateDepart.placeholder = "Date"
        
        // StackView Ville Depart
        let contentStackViewDateDepart = UIStackView(arrangedSubviews: [titleLabelDateDepart, textFieldDateDepart])
        contentStackViewDateDepart.axis = .horizontal
        contentStackViewDateDepart.alignment = .fill
        contentStackViewDateDepart.spacing = UIStackView.spacingUseSystem
        contentStackViewDateDepart.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView Date Arrive
        
        // Label Ville
        let titleLabelDateArrive = UILabel()
        titleLabelDateArrive.text = "Et le "
        titleLabelDateArrive.numberOfLines = 0
        titleLabelDateArrive.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelDateArrive.textColor = .cyan
        titleLabelDateArrive.adjustsFontForContentSizeCategory = true
        titleLabelDateArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textFieldDateArrive = UITextField()
        textFieldDateArrive.placeholder = "Date"
        
        // StackView Ville Depart
        let contentStackViewDateArrive = UIStackView(arrangedSubviews: [titleLabelDateArrive, textFieldDateArrive])
        contentStackViewDateArrive.axis = .horizontal
        contentStackViewDateArrive.alignment = .fill
        contentStackViewDateArrive.spacing = UIStackView.spacingUseSystem
        contentStackViewDateArrive.translatesAutoresizingMaskIntoConstraints = false
        
        
        //let mapView = MKMapKit() // tiale fixe
        //let tableView = UITableView() // le tout dans stackView
        // custom cell
        //
        let myButton = ActionButton()
        myButton.title = "My button"
        
        let contentStackView = UIStackView(arrangedSubviews: [contentStackViewDepart, stackViewCityStart, textOr, stackViewCurrentLocation, contentStackViewArrive, contentStackViewVilleArrive , stackViewCalendar, contentStackViewDateDepart,contentStackViewDateArrive, myButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackView.setCustomSpacing(20, after: textOr)
        contentStackView.setCustomSpacing(20, after: stackViewCurrentLocation)
        //view.addSubview(contentStackView)
        
        // setup les views(
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5),

            
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 3.0)

            
        ])
        
        // Debug colors
        textOr.backgroundColor = .red
        titleLabel.backgroundColor = .purple
        textField.backgroundColor = .orange
        currentSwitch.backgroundColor = UIColor.yellow
        currentLabelDepart.backgroundColor = UIColor.green
        
        
        
//        NSLayoutConstraint.activate([
//            textOr.topAnchor.constraint(equalToSystemSpacingBelow: contentStackView.topAnchor, multiplier: 3.0),
//
//            textOr.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3.0),
//            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: textOr.trailingAnchor, multiplier: 3.0),
//        ])
        
        // Current Location
        let imageLocation = UIImage(systemName: "magnifyingglass")
        let myImageLocation:UIImageView = UIImageView()
        myImageLocation.contentMode = UIView.ContentMode.left
        myImageLocation.contentMode = UIView.ContentMode.scaleAspectFit
        myImageLocation.image = imageLocation

        // Title Label Arrive
        let titleLabelArrived = UILabel()
        titleLabelArrived.text = "Arrive"
        titleLabelArrived.numberOfLines = 0
        titleLabelArrived.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelArrived.textAlignment = .center
        titleLabelArrived.textColor = .black
        titleLabelArrived.adjustsFontForContentSizeCategory = true
        titleLabelArrived.translatesAutoresizingMaskIntoConstraints = false
        
    }
}



/*
 Constraints
 //            contentStackViewImageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
 
 //            CenterX Anchor / CenterY Anchor
 //            contentStackViewImageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 // contentStackViewImageTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30)
 
 //            Width Anchor / Height Anchor
 //            contentStackViewImageTitle.heightAnchor.constraint(equalToConstant: 50),
 //            contentStackViewImageTitle.widthAnchor.constraint(equalToConstant: 80)
 
 //            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentStackViewImageTitle.topAnchor, multiplier: 3.0)
 
 //            contentStackViewImageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
 
 //            contentStackViewImageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
 
 */
extension SearchFlightViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textOr.isHidden = true
    }
}
