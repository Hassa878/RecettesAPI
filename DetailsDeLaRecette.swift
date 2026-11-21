//
//  DetailsDeLaRecette.swift
//  RecettesAPI
//
//  Created by konate on 09/11/2026.
//

import SwiftUI
import SwiftData

struct DetailsDeLaRecette: View{
    let recette: Recette
    
    
    @Environment(\.modelContext) private var modelContext
    @State private var estFavori = false
    @Query private var doublons : [RecetteFavorite]
    
    var body: some View{
        
        ScrollView{
            VStack(spacing: 20){
                
                HStack{
                    Text(recette.strMeal)
                        .font(.title3)
                        .bold()
                    
                    Button{
                        estFavori.toggle()
                        
                        
                        if estFavori{
                            let favori = RecetteFavorite(idMeal: recette.idMeal,
                                                         strMeal: recette.strMeal,
                                                         strMealThumb: recette.strMealThumb,
                                                         strInstructions: recette.strInstructions)
                            
                            let dejaEnregistre = doublons.contains {
                                element in
                                element.idMeal == recette.idMeal
                                
                            }
                            print("deja cliquer")
                            
                            if !dejaEnregistre {
                                modelContext.insert(favori)
                                try? modelContext.save()
                            }
                            
                        }
                        
                        
                    }
                    
                    label: {
                        Image(systemName: estFavori ? "heart.fill" : "heart")
                    }
                    .foregroundStyle(estFavori ? Color.red : Color.gray)
                }
                
                
                AsyncImage(url: URL(string : recette.strMealThumb)) {
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Text(recette.strInstructions)
                    .font(.body)
                    .italic()
                
                
            }
        }
        .onAppear /*execute du code lorsqu'un ecran apparait*/{
            estFavori = doublons.contains {
                element in
                element.idMeal == recette.idMeal
            }
        }
        .padding()
        .navigationTitle("Détails de la recette")
    }
    }
    

 

#Preview {
    ContentView()
}
