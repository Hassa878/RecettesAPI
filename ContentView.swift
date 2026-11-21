//
//  ContentView.swift
//  RecettesAPI
//
//  Created by konate on 06/11/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RecetteViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 20) {
                
                Text("Mes recettes")
                    .font(.title)
                    .bold()
                
                Text("Découvre de nouvelles recettes")
                    .font(.title2)
                
                Button("Charger les recettes"){
                    viewModel.chargerRecettes()
                    
                }
                .buttonStyle(.borderedProminent)
                
                ForEach(viewModel.recettes, id: \.strMeal){
                    recette in
                    NavigationLink (destination: DetailsDeLaRecette( recette: recette)){
                        Text(recette.strMeal)
                    }
                    
                    AsyncImage(url: URL(string : recette.strMealThumb)) {
                        image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                
                NavigationLink(destination: FavorisView()){
                    Text("Mes favoris")
                }
            }
            
        }
        .padding()
        
        }
       
    }


#Preview {
    ContentView()
}
