//
//  BFS-menu.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/6/24.
//

import SwiftUI


struct BFS_menu: View {
    
    @EnvironmentObject var choice: srcdest

/*
    struct Ocean: Identifiable  {
        let name: String
        let id = UUID()
    } */ 
    /*
    let oceans = [
        selected(name: "Pacific"),
        selected(name: "Atlantic"),
        selected(name: "Indian"),
        selected(name: "Southern"),
        selected(name: "Arctic")
    ] */
    
    var place = places()
    var body: some View {
        
        NavigationView{
            NavigationStack(){
                Group{
                    List(place.vertices.sorted{ $0.name < $1.name}) { location in
                        Button(action: {
                            choice.source = location
                        }) {
                            HStack {
                                Text(location.name)
                                Spacer()
                                if choice.source?.id == location.id {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }.navigationTitle("Source")
                        
                     // .id(choice.source?.id) // Helps SwiftUI track the selected state
                }
            }
        }
    }
}


struct dest: View {
    
    @EnvironmentObject var choice: srcdest

    /*
    let oceans = [
        selected(name: "Pacific"),
        selected(name: "Atlantic"),
        selected(name: "Indian"),
        selected(name: "Southern"),
        selected(name: "Arctic")
    ] */
    var place = places()
    
    var body: some View {
        
        NavigationView{
            NavigationStack(){
                Group{
                    List(place.vertices.sorted{ $0.name < $1.name}) { location in
                        HStack {
                            Text(location.name)
                            Spacer()
                            if choice.destination?.id == location.id {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                            
                        } .contentShape(Rectangle())
                            .onTapGesture {
                                choice.destination = location
                            }
                    }.navigationTitle("Destination")
                }
            }
        }
    }
}


#Preview {
    BFS_menu().environmentObject(srcdest())
}
