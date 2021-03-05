////
////  testViewController.swift
////  ARFlight
////
////  Created by Wandianga hassane on 03/03/2021.
////
//
//import UIKit
//
//class testViewController: UIViewController {
//
//    var flightArray : [Flight]?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUp()
////        setupView()
////        getRecipes()
//    }
//    
////    func setUp() {
////        NetworkServiceFlight.shared.searchForFlight(startRange: "Date Depart", endRange: "Date Arrivée", origin: "Airport Depart", destination: "Airport Arrivée") { [weak self] (resultFight) in
////            switch resultFight  {
//// 
////            case .success(let flights) where
////                    flights.isEmpty:
////                print("No Flight")
////            case .success(let flights):
////                print(flights)
////                self?.flightArray = flights
////            case .failure(let error):
////                print(error.localizedDescription)
////            }
////        }
////    }
//}
//}
//
///*
// WeatherViewController:
// 
// func setUp() {
//     WeatherService.shared.getWeathers { [weak self] (resultWeather) in
//         switch resultWeather {
//         case .success(let weathers):
//             print(weathers)
//             self?.weatherArray = weathers
//             self?.setUpUiWeather(weather: weathers[0])
//         case .failure(let error):
//             print(error.localizedDescription)
//         }
//     }
// }
// */
//
///*
// RecipesListViewController
// 
// private func getRecipesFromApi() {
//     viewState = .loading
//     NetworkServiceRecipe.shared.getRecipes(ingredients: ingredients) { [weak self] result in
//         switch result {
//         case .success(let reciplease) where reciplease.recipes.isEmpty:
//             print("no recipes found")
//             self?.viewState = .empty
//         case .success(let reciplease):
//             self?.recipes = reciplease.recipes
//             self?.viewState = .showingData
//         case .failure(let error):
//             print("Error fetching recipes from api: \(error.localizedDescription)")
//             self?.viewState = .error
//         }
//     }
// }
//
// 
// */
//
