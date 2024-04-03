//
//  TipsView.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 24-10-22.
//

import SwiftUI

struct TipsView : View{
    
    @StateObject var viewModel = ConsumeViewModel()
        
    var body: some View{
        NavigationView {
            List{
                ForEach(viewModel.coffees, id: \.self){ coffe in
               
                NavigationLink(destination: CoffeeTipsDetailView(coffes: coffe), label: {
                   
                    Image(coffe.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(40)
                        .padding(.vertical, 5)
                        
                    
                    VStack (alignment: .leading, spacing: 15){
                        Text(coffe.name)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(coffe.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                })
                
            }//forEach
            }
            .navigationTitle("Coffee Tips")
        }
        .onAppear(perform: viewModel.getTips)
    }
    
    
}
