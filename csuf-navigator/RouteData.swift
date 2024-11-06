//
//  RouteData.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/3/24.
//

import Foundation


struct RouteData: Encodable{
    let source: String
    let destination: String
}


struct ApiResponse: Decodable{
    let message: [String]
}
