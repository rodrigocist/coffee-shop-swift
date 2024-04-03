//
//  ConsumeApi.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 20-11-22.
//

import SwiftUI
import MapKit

struct Coffee : Hashable, Codable {//Identifiable
    let id : Int
    let name : String
    let description : String
    let image : String
    let active : Bool
}

struct Location : Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let address : String
    let latitude: String
    let longitude: String
    let active : Bool
}



class ConsumeViewModel: ObservableObject{
    
    @Published var coffees :[Coffee] = []
    @Published var locations :[Location] = []
    
    let username = "user_coffee"
    let password = "coffee4321"
    var api = "http://44.211.164.174/v1"
    
    func getTips(){
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        var request = URLRequest(url: URL(string: api + "/coffeetips")!)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

       let task = URLSession.shared.dataTask(with: request) {[weak self] data, response , error in
           guard let data = data, error == nil else { return}
           do{
               let coffee = try JSONDecoder().decode([Coffee].self, from: data)
               DispatchQueue.main.async {
                   self?.coffees = coffee
               }
           }catch{
               print(error)
           }
       }
       task.resume()
   }
    
    func getPlaces(){
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        var request = URLRequest(url: URL(string: api + "/coffeeplaces")!)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

       let task = URLSession.shared.dataTask(with: request) {[weak self] data, response , error in
           guard let data = data, error == nil else { return}
           do{
               let location = try JSONDecoder().decode([Location].self, from: data)
               DispatchQueue.main.async {
                   self?.locations = location
               }
           }catch{
               print(error)
           }
       }
       task.resume()
   }
    
}
