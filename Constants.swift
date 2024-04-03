//
//  Constants.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 24-12-22.
//

import SwiftUI

class Constants : ObservableObject{
    @Published var username : String = .init()
    @Published var password : String = "coffee4321"
    @Published var api : String = "http://44.211.164.174/v1"
    
    public struct Paramstt {
        static let latitude = "user_coffee"
        static let longitude = "coffee4321"
    }
    
    init(){
        username = .init("aaa")
    }
    
}

