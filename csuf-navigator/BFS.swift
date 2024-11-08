//
//  BFS.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/3/24.
//

import SwiftUI
import MapKit
import Collections


struct BFS: View {
    
    /*
     
     struct vertexInfo{
     
        vertices = {
     
            "McCarthy Hall": ["mc",coordinatelocation2d...] 
     }
     
     }
     
     */
    
    
    @State var camera: MapCameraPosition = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.8823, longitude: -117.8851), span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)))
    
    @StateObject private var choice = srcdest()
    @State private var bfsresponse = ""
    @State private var marks: [locations] = []
    @State private var coords: [CLLocationCoordinate2D] = []
 //   @State private var index: Int = 1
    let markers = [
        locations(name: "csuf", coordinates: CLLocationCoordinate2D(latitude: 33.8823, longitude: -117.8851)),
        locations(name: "cpParkingN", coordinates: CLLocationCoordinate2D(latitude: 33.87721, longitude: -117.88320)),
        locations(name:"cpParkingS", coordinates: CLLocationCoordinate2D(latitude: 33.87620, longitude: -117.88337)) ]

    var vloc = loc()
    var place = places()

    @State var route: [String] = []
    
    var body: some View {
        NavigationView{
            VStack{
                Map(position: $camera){
                    //    Marker("College Park South Parking",coordinate: vloc.cpParkingS)
                    
                    
                    // Generates markers for each node, adds number to the bubble to indicate order
                    ForEach(Array(marks.enumerated()), id: \.element.id){index, marker in
                        Marker(marker.name, systemImage: "\(String(index + 1)).circle.fill", coordinate: marker.coordinates)

                    }
                    if !coords.isEmpty{
                        MapPolyline(coordinates: coords)
                            .stroke(.blue, lineWidth: 6)
                    }

                    
                    // used to ensure accuracy and viability of displaying a marker when using name as key to dictionary
                    /*
                    Marker("College Park", coordinate: {
                        if let vals = place.dictvertices["College Park"], vals.count > 1 {
                            let second = vals[1]
                            return second as! CLLocationCoordinate2D
                        }
                        return vloc.csuf
                    }()) */
                     
                     
                    //  Marker("College Park North Parking", coordinate: vloc.cpParkingN)
                }
                .safeAreaInset(edge: .top){
                    HStack{
                        Spacer()
                        Button("BFS"){
                            
                            bfsPOST(src:choice.source?.code ?? "esps", dest:choice.destination?.code ?? "ec")
                            camera = .region(MKCoordinateRegion(center: vloc.csuf,latitudinalMeters: 1200,longitudinalMeters: 1200))
                          //  updateMarkers()
                        }
                        Spacer()
                        NavigationLink(destination: menu().environmentObject(choice)){  Text("Start: \(choice.source?.name ?? "None")") }
                        Spacer()
                        NavigationLink(destination: dest().environmentObject(choice)){ Text("End: \(choice.destination?.name ?? "None")") }
                        
                        
                        Spacer()
                    }.padding([.bottom])
                        .background(.thinMaterial)
                }
            }
        }
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
                        route = getnamebycode(code: bfsresponse)
                        print("route: \(route)")
                        marks = createMarkers(from: route,using: place.dictvertices)
                        print("marks: \(marks)")
                    }
                } catch{
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
        
    }
    
    func getnamebycode(code: String) -> [String]{
        let codearr = code.split(separator: ", ").map { String($0) }
        
        return codearr.compactMap { code in
            place.vertices.first(where:{ $0.code == code })?.name
        }
    }
    
    
    // Uses array of building names to access key/value pairs to get coordinates of the building
    func createMarkers(from route: [String], using dictvertices: OrderedDictionary<String, [Any]>) -> [locations] {
        
        coords.removeAll()
        var arr: [locations] = []
        route.forEach{ item in
            
            print(dictvertices[item]?[1] as Any)
            arr.append(locations(name:item,coordinates: dictvertices[item]?[1] as! CLLocationCoordinate2D))
            coords.append(dictvertices[item]?[1] as! CLLocationCoordinate2D)
        }
        print("arr: \(arr)")
        return arr
    }


    
}

#Preview {
    BFS()
}
