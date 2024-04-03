//
//  MapCoffeeShop.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 09-10-22.
//

import MapKit
import SwiftUI

struct MapCoffeeShop: View {
    @StateObject var viewModel = ConsumeViewModel()
    @StateObject var locationModel = LocationViewModel()
    @State private var showingPopover = false
    
    @State var popover: PopoverModel?
    
  var body: some View {
      
    Map(
        coordinateRegion: $locationModel.userLocation,
      showsUserLocation: true,
        annotationItems: viewModel.locations
    ) { location in
      MapAnnotation(
        coordinate: CLLocationCoordinate2D(
            latitude: Double(location.latitude)!,
            longitude: Double(location.longitude)!
        )
      ) {
        VStack {
          
            Image(systemName: "cup.and.saucer.fill")
                .scaledToFit()
                .frame(width: 100, height: 25)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 25/10))
                .shadow(radius: 10)
                .onTapGesture {
                    print("on tap gest....\(location.name)")
                    showingPopover = true
                    
                    
                }
                .sheet(isPresented:$showingPopover){
                    //PopoverView()
                    
                    ModalView(showingPopover: self.$showingPopover, CofeName: location.name)
                    
                }

               // .alert(isPresented: $showingPopover) {
                 //   Alert(title: Text("Thank you!"), message: Text("confirmationMessage"), dismissButton: .default(Text("OK")))
                //}
                
                
        }
      }
    }.ignoresSafeArea()
     
          .onAppear(perform: viewModel.getPlaces)
  }
    
    
}

struct ModalView: View {
    @Binding var showingPopover: Bool
     var CofeName : String
    
    
    
    var body: some View {
        
        Text("Modal view \(CofeName)")
        
        
        Button(action: {
            self.showingPopover.toggle()
        },label: {
                Text("Close")
                .frame(width: 200, height: 50)
                .background(Color(.systemRed))
                .cornerRadius(10)
                .foregroundColor(.white)
            
        })
        
        
    }
}

struct JSONData: Decodable {
  let locations: [Location]
}

struct PopoverView: View {
    var body: some View {
        VStack {
            Text("Some text here ").padding()
            Button("Resume") {
            }
        }.padding()
        
        
    }
}


struct PopoverModel: Identifiable {
    var id: String { message }
    let message: String
}
