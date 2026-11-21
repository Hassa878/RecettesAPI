//
//  RecetteViewModel.swift
//  RecettesAPI
//
//  Created by konate on 06/11/2026.
//

import Foundation
import Combine

class RecetteViewModel: ObservableObject {
    @Published var recettes: [Recette] = []
    @Published var messageErreur: String? = nil
    
    func chargerRecettes(){
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata"
        
        guard let url = URL(string: urlString)
        else{
            return
        }
        
        Task /*operation asynchrone */{
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
               
                let recette = try
                JSONDecoder().decode(RecetteReponse.self, from: data)
                await MainActor.run /*Sécurité(pour l'affichage et run=éxecuter)*/{
                    self.recettes = recette.meals
                    
                }
                
            } catch {
                await MainActor.run {
                    messageErreur = "Impossible de récupérer la recette."
                }
            }
            
            }
        }
       
    }
    


