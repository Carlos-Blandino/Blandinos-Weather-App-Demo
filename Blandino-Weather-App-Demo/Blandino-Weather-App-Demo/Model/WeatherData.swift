//
//  WeatherData.swift
//  Blandino-Weather-App-Demo
//
//  Created by Carlos Blandino on 6/7/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let humidity: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
    let icon: String
}
