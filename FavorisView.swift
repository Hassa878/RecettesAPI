//
//  FavorisView.swift
//  RecettesAPI
//
//  Created by konate on 09/11/2026.
//

import SwiftUI
import SwiftData

struct FavorisView: View {
    
    @Query private var favoris: [RecetteFavorite]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        
               
        List {
            ForEach(favoris) { favori in
                HStack{
                    Text(favori.strMeal)
                
               
                
                    Button("Supprimer"){
                        
                        modelContext.delete(favori)
                        
                    }
                    
                }
       }
            
   

             }
        
    }
}



#Preview {
    FavorisView()
}
