//
//  vertex-location.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/6/24.
//

import Foundation
import MapKit
import SwiftUI

struct locations: Identifiable{
    var id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}



 struct loc{
    let csuf = CLLocationCoordinate2D(latitude: 33.8823, longitude: -117.8851)
    
    let cpParkingN = CLLocationCoordinate2D(latitude: 33.87721, longitude: -117.88320)
    let cpParkingS = CLLocationCoordinate2D(latitude: 33.87620, longitude: -117.88337)
    
} 

