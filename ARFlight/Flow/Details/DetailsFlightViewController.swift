//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit
import EventKit
import EventKitUI

class DetailsFlightViewController: UIViewController, EKEventViewDelegate {
        
    // MARK: - coordinator
    weak var coordinator: MainCoordinator?
    
    // MARK: - property View
    let companyFlightInfoView = CompanyFlightInfoView()
    let departView = AirportDetailView(flightLeg: "Depart")
    let arrivalView = AirportDetailView(flightLeg: "Arrived")
    let planeInformationView = PlaneInformationView()
    
    private let eventStore = EKEventStore()
    private let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
    private let flight: Flight
    
    // MARK: - SetUp
    
    init(flight: Flight) {
        self.flight = flight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - View Configuration

extension DetailsFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"
        view.backgroundColor = UIColor.systemBackground
        
        companyFlightInfoView.flight = flight
        
        departView.airportDetailInfo = (flight.departureCodeAirport, flight.departureDateTime?.timeString(), flight.departureTerminalAirport )
        arrivalView.airportDetailInfo = (flight.arrivalCodeAirport, flight.arrivalDateTime?.timeString(), flight.arrivalTerminalAirport)
        
        print("Plane Id \(flight.planeId ?? "Missing")")
        if let flightPlane = planes.first(where: { $0.id == flight.planeId }) {
            planeInformationView.plane = flightPlane
        }
        
        
        let labelNotification = UILabel(text: "Notification")
        configureTitleLabel(labelNotification)
        
        let buttonAddNotification = UIButton()
        buttonAddNotification.setImage(UIImage(systemName: "bell.circle.fill"), for: .normal);
        buttonAddNotification.clipsToBounds = true
        buttonAddNotification.layer.cornerRadius = 12
        buttonAddNotification.layer.borderWidth = 1.0
        buttonAddNotification.addTarget(self, action: #selector(addNotificationReminderTapped), for: .touchUpInside)
        buttonAddNotification.layer.borderColor = UIColor.systemBlue.cgColor
        
        let notificationStackView = UIStackView(arrangedSubviews: [labelNotification, buttonAddNotification],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        let labelCalendar = UILabel(text: "Add Calendar")
        configureTitleLabel(labelCalendar)
        
        let buttonAddCalendar = UIButton()
        buttonAddCalendar.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal);
        buttonAddCalendar.clipsToBounds = true
        buttonAddCalendar.layer.cornerRadius = 12
        buttonAddCalendar.layer.borderWidth = 1.0
        buttonAddCalendar.addTarget(self, action: #selector(addCalendarTapped), for: .touchUpInside)
        buttonAddCalendar.layer.borderColor = UIColor.systemBlue.cgColor
        
        let calendarStackView = UIStackView(arrangedSubviews: [labelCalendar, buttonAddCalendar],
                                            axis: .vertical,
                                            spacing: UIStackView.spacingUseSystem,
                                            alignment: .center,
                                            distribution: .equalSpacing)
        
        let notificationCalendarStackView = UIStackView(arrangedSubviews: [notificationStackView, calendarStackView],
                                                        axis: .horizontal,
                                                        spacing: UIStackView.spacingUseSystem,
                                                        alignment: .firstBaseline,
                                                        distribution: .fillProportionally)
        
        let contentStackView = UIStackView(arrangedSubviews: [companyFlightInfoView, departView,arrivalView, planeInformationView, notificationCalendarStackView])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            buttonAddNotification.widthAnchor.constraint(equalToConstant: 50),
            buttonAddNotification.heightAnchor.constraint(equalToConstant: 50),
            
            buttonAddCalendar.widthAnchor.constraint(equalToConstant: 50),
            buttonAddCalendar.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
        ])
    }
    
    func configureTitleLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .headline)
    }
    // MARK: - Calendar
    
    @objc
    func addCalendarTapped() {
        shouldRequestCalendarPermission()
       // eventStore.save(event, span: EKSpan.thisEvent)
     
//        let vc = EKEventViewController()
//        vc.delegate = self
//        present(vc, animated: true)
    }
    
    private func addEvent() {
        let calendards = eventStore.calendars(for: .event)
        let favoriteCalendar = calendards.first!
        print(favoriteCalendar.calendarIdentifier)
        let event = EKEvent(eventStore: eventStore)
        event.title = "Flight from X to y"
        event.isAllDay = true
        event.calendar = favoriteCalendar
        event.startDate = flight.departureDate ?? Date()
        event.endDate = flight.arrivalDateTime ?? Date()
        
        do {
            try eventStore.save(event, span: .thisEvent, commit: true)
        } catch {
            print("cant save event \(error.localizedDescription)")
        }
    }
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        print(#function)
    }
    
    private func shouldRequestCalendarPermission() {
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .authorized:
            addEvent()
        case .notDetermined:
            requestCalendarPermission()
        case .restricted, .denied:
            print("please change settings")
            let settingsURL = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(settingsURL, options: [:])
        @unknown default:
            print("unkown status")
            break
        }
    }
    
    private func requestCalendarPermission() {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if let error = error {
                debugPrint("Error requesting calendar permission \(error.localizedDescription)")
            }
            debugPrint("Calendar permissions status \(granted)")
            
            if granted {
                self.addEvent()
            }
        }
    }
    
    // MARK: - Notfification

    @objc
    func addNotificationReminderTapped() {
        shouldRequestNotificationPermission { (shouldRequestAuthorization) in
            if shouldRequestAuthorization {
                self.requestNotificationPermission()
            } else {
                self.addNotificationReminder()
            }
        }
    }
    private func shouldRequestNotificationPermission(_ completion: @escaping ((Bool)-> Void)) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            let isNotificationNotDetermined = settings.authorizationStatus == .notDetermined
            completion(isNotificationNotDetermined)
        }
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if let error = error {
                debugPrint("Error requesting user notification permission \(error.localizedDescription)")
            }
            debugPrint("User notification permissions status \(granted)")
            if granted {
                self.addNotificationReminder()
            }
        }
    }
    
    private func addNotificationReminder() {
        guard let flightId = flight.identifiantPlane,
              let departureAirport = flight.departureAirport?.name else {
            print("show alert cant add notification reminder")
            return
        }
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Your upcoming flight"
        notificationContent.body = "Flight from \(departureAirport) to Y is coming soon"
        notificationContent.sound = UNNotificationSound.default

        #if DEBUG
            let notificationInterval: TimeInterval = 5
        #else
        // prendre la date depart enlever X heure et ont convertis en time interval
        //let notificationInterval: TimeInterval = flight.departureDate
        #endif
        //let trigger = UNCalendarNotificationTrigger(dateMatching: T##DateComponents, repeats: T##Bool)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationInterval, repeats: false)
        let request = UNNotificationRequest(identifier: flightId, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                // afficher l alerte que ca n'a pas marcher
                debugPrint("Error adding notification \(error.localizedDescription)")
                return
            }
            // afficher une alerte qui dit vous serez rappeler x heures avant votre vol
            debugPrint("New notification request successfully added")
        }
    }
}

