//
//  DFS.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/3/24.
//

import SwiftUI

struct DFS: View {
    
    @State private var response = ""
    
    var body: some View {
        VStack{ 
            
            Text("DFS")
            
            Button("POST"){
                sendPOST()
            }
            
            Text(response)
                
        }.padding()
        
    }
}


func sendPOST(){
    guard let url = URL(string: "http://127.0.0.1:5000/DFS") else { return }
    
    let routeData = RouteData(source: "A", destination: "F")
            
            
}


#Preview {
    DFS()
}
