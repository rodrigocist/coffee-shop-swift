//
//  CoffeeTipsDetailView.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 25-10-22.
//

import SwiftUI


struct CoffeeTipsDetailView: View {
    
    var coffes : Coffee
    
    let uri: URL! = URL(string: "https://www.sedovin.com/blog-sedovin/alimentacion-nutricion/todo-sobre-cafe/")
   

    var body: some View {
        VStack(spacing : 15){
        
            Image(coffes.image)
                .resizable()
                .scaledToFit()
                .frame(height:250)
                .cornerRadius(5)
            
            Text(coffes.name)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing : 60){
                Label("3.254.201", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
            }
            Text(coffes.description)
                .font(.body)
                .padding()
            
            Spacer()
            Link(destination : uri, label: {
                Text("More about")
                    .bold()
                    .font(.title2)
                    .frame(width: 200, height: 50)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
        }
    }
}
