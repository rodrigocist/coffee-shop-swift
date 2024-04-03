//
//  ContentView.swift
//  coffeeApp
//
//  Created by Rodrigo Cisternas on 08-10-22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var presented = false
    let icnos = [
        "house",
        "cup.and.saucer",
        "plus",
        "mappin.and.ellipse",
        "message"
    ]
    
    var body: some View {
        VStack{
            
            ZStack{
                Spacer().fullScreenCover(isPresented: $presented, content:{
                    Button(action: {
                        presented.toggle()
                    },label: {
                            Text("Close")
                            .frame(width: 200, height: 50)
                            .background(Color(.systemRed))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    })
                })
                switch selectedIndex{
                case 0 :
                    HomeView()
                case 1 :
                    TipsView()
                    
                case 2 :
                    NavigationView{
                        VStack{
                            Text("Add page")
                            
                        }
                        .navigationTitle("Add")
                        
                    }
                    
                case 3 :

                    let _ = print("MapCoffeeShop")
                    MapCoffeeShop()
                default:
                    NavigationView{
                        VStack{
                            Text("Message page ")
                            
                        }
                        .navigationTitle("Message")
                        
                    }
                }
            }
        
        Spacer()
            
        Divider()
        
            HStack{
                ForEach(0..<5, id: \.self){ number in
                    Spacer()
                    Button(action:{
                        if(number == 2){
                            presented.toggle()
                        }else{
                            self.selectedIndex = number
                        }
                    }, label: {
                        if(number == 2){
                            Image(systemName: icnos[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.blue)
                                .cornerRadius(30)
                            
                        }else{
                            Image(systemName: icnos[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? .black:
                                                Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
