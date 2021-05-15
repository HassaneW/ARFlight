//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit
import MapKit

class SearchFlightViewController: UIViewController{
    weak var coordinator: MainCoordinator?
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
//    private lazy var countries: [Countries] = {
//        let airportName = Bundle.main.decode(AirportName.self, from: "code-airport.json")
//        return airportName.countries
//    }()
    
    private let searchButton = ActionButton()
    private let startDatePicker = SearchDatePicker(title: "Date Depart") // departur RENAME START TO DEPARTURe
    private let arrivalDatePicker = SearchDatePicker(title: "Date Arrive")
    private let departureCityTextField = SearchTextField()
    private let arrivalCityTextField = SearchTextField()
    
    private var flights : [Flight]?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        setUp()
    }
    
    // MARK: - Action methods
    
    @objc
    func submitSearch() {
        fetchFlights()
    }
    
    //MARK: - Private methods
    
    private func fetchFlights() {
        let pickupDate = startDatePicker.selectedDate
        let arrivalDate = arrivalDatePicker.selectedDate
        // Validation:
        // arrival date > pickup date (pas le meme jour)
        guard true else {
            // Title = "error validating form"
            // body -
           // presentError("The arrival date should be after the pickup date")
            return
        }
        let pickupDateString = "\(dateFormatter.string(from: pickupDate))Z"
        let arrivalDateString = "\(dateFormatter.string(from: arrivalDate))Z"
        
        
        // 2nd verification
        // nom de city pas vide
        
        //        guard let departureCity = departureCityTextField.text else { return <#default value#> } ?? <#default value#>!
//        let arrivalCity = arrivalCityTextField.text
        
        
        guard let departureCity = departureCityTextField.text  else  { return }
        guard departureCity.isEmpty else { return }
        
        guard let arrivalCity = arrivalCityTextField.text else  { return }
        
        // Decoder
        let airportDecode = Bundle.main.decode(AirportName.self, from: "aircraft-details.json")
        
        guard let codeAirportDepart = airportDecode.airportsCityCode[departureCity] else  { return }
        guard let codeAirportArrival = airportDecode.airportsCityCode[arrivalCity] else  { return }
        
//            let airportDecode = Bundle.main.decode(AirportName.self, from: "aircraft-details.json")
//            print(airportDecode)
//            let bordCode = airportDecode.airportsCityCode[departureCity ?? "Error"]
//            print(bordCode ?? "introuvable")
//
        
//        guard let pickupDate = startDatePicker.selectedDate else {
//            // Afficher une alerte qui dit que les donnes sont incompletes
//            return
//        }
//        let mapped = countries.map { (country) -> [Cities] in
//            return country.ma
//        }
//        let result = countries.first { country -> Bool in
//            return country.cities.first { (city) -> Bool in
//                return city.stopovers.first { $0.name == arrivalCity } != nil
//            } != nil
//        }
       // print(dateConvert(input: pickupDate)) // "2021-01-14T10:00:00Z" ISO8601
        //"2021-01-20T23:59:00Z"
        //2021-05-11T11:45:14Z
        //"2021-05-23T11:30:00+0000"
        NetworkServiceFlight.shared.searchForFlight(startRange: pickupDateString, endRange: arrivalDateString, origin: codeAirportDepart, destination: codeAirportArrival) { [weak self] result in
            switch result {
            case .success(let flights):
                print("Flights found: \(flights.count)")
                self?.flights = flights
                self?.coordinator?.showListResultController(with: flights)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func setUp() {
        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
        print(planes.first)
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        print(codeAirport)
    }
    
    private func airportName(nameAiport: String) -> String {
        
        // 1) Récupérer le fichier Airport
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        // 2) Récupérer les informations rentrer dans la vue
        let searchTextField = SearchTextField()
        // 3) Transformer le nom de la ville présent le fichier en code Airport pour le Network
        // StopOversLabel -> StopoversCode
        // 4) Retourner la valuer est l'inscrire dans origin et destination

        return ""
    }
    
    // MARK: - Actions
    
    @objc
    func searchForCurrentLocation(_ sender: UIButton) {
        print("search for current location tapped")
    }
    
    
}

// MARK: - Set up View

extension SearchFlightViewController {
    private func setupView() {
        title = "RECHERCHER UN VOL"
        view.backgroundColor = UIColor.systemBackground
        
        let startSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "airplane"), title: "Depart")
        let arriveSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "airplane"), title: "Arrive")
       
        let calendarSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "calendar.circle"), title: "Calendar")
       
        departureCityTextField.delegate = self
        departureCityTextField.placeholder = "Depart"

        arrivalCityTextField.delegate = self
        arrivalCityTextField.placeholder = "Arrive"

        let searchCurrentLocationButton = SearchCurrentLocationButton()
        searchCurrentLocationButton.addTarget(self, action: #selector(searchForCurrentLocation), for: .touchUpInside)

        let orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.font = .preferredFont(forTextStyle: .title3)
        orLabel.textColor = .label
        orLabel.textAlignment = .center
        orLabel.adjustsFontForContentSizeCategory = true
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton.title = "Search"
        searchButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [startSectionHeader,
                               departureCityTextField,
                               orLabel,
                               searchCurrentLocationButton,
                               arriveSectionHeader,
                               arrivalCityTextField,
                               calendarSectionHeader,
                               startDatePicker,
                               arrivalDatePicker,
                               searchButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setCustomSpacing(20, after: orLabel)
        contentStackView.setCustomSpacing(20, after: searchCurrentLocationButton)
        contentStackView.setCustomSpacing(30, after: arrivalDatePicker)
        
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5)
        ])
        // Debug colors
//        orLabel.backgroundColor = .red
    }
}

// MARK: - UITextField delegate

extension SearchFlightViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

/*
 Code dateformatter :
 
 let formatter = DateFormatter()
 formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
 guard let date = formatter.date(from: pickupDate) else { return  }
 let dateDepart = formatter.string(from: date)
 print(dateDepart) // "2021-01-14T10:00:00Z" ISO8601
 */




/*
 //        NetworkServiceFlight.shared.getFlightDetailsFor(flightId: "20210115+AF+1496") { (result) in
 //            switch result {
 //            case .success(let flight):
 //                print("Flight detail: \(flight)")
 //                DispatchQueue.main.async {
 //                    self.flight = flight
 //                }
 //            case .failure(let error):
 //                print("Error getting flight details: \(error.localizedDescription)")
 //            }
 //        }
 
 */
