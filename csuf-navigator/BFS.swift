//
//  BFS.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/3/24.
//

import SwiftUI
import MapKit

struct BFS: View {
    
    @State var camera: MapCameraPosition = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.8823, longitude: -117.8851), span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)))
    
    @State private var bfsresponse = ""
    
    var vloc = loc()
    
    var body: some View {
        
        VStack{
            Map(position: $camera){
                Marker("College Park South Parking",coordinate: vloc.cpParkingS)}
            
            Text("BFS")
            
            Button("POST"){
                bfsPOST(src:"A",dest:"J")
                camera = .region(MKCoordinateRegion(center: vloc.csuf,latitudinalMeters: 1200,longitudinalMeters: 1200))
            }
            
            Text(bfsresponse)
            
        }.padding()
    }
    
    
    func bfsPOST(src: String,dest: String){
        guard let url = URL(string: "http://127.0.0.1:5000/bfs") else { return }
        
        let routeData = RouteData(source: src, destination: dest)
        
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do{
            request.httpBody = try JSONEncoder().encode(routeData)
        } catch {
            print("Error encoding data: \(error)")
            return
        }
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error sending request: \(error)")
                return
            }
            
            if let data = data{
                do{
                    let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.bfsresponse = apiResponse.message.joined(separator: ", ")
                    }
                } catch{
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
    
    
}

#Preview {
    BFS()
}
