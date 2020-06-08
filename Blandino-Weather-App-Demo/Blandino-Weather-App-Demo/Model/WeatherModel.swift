//
//  WeatherModel.swift
//  Blandino-Weather-App-Demo
//
//  Created by Carlos Blandino on 6/7/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import Foundation
struct WeatherModel {
    let idOfCondition: Int
    let nameOfCity: String
    let description: String
    let temp: Double
    var tempStr : String {
        return String(format: "%.1f", temp)
    }
    
    var imageOfCondition: String {
        switch idOfCondition {
        case 200...232:
            return "http://openweathermap.org/img/wn/11d@3x.png"
        case 300...321:
            return "http://openweathermap.org/img/wn/09d@3x.png"
        case 500...504:
             return "http://openweathermap.org/img/wn/10d@3x.png"
        case 511:
            return "http://openweathermap.org/img/wn/13d@3x.png"
        case 520...531:
            return "http://openweathermap.org/img/wn/09d@3x.png"
        case 600...622:
             return "http://openweathermap.org/img/wn/13d@3x.png"
        case 701...781:
             return "http://openweathermap.org/img/wn/50d@3x.png"
        case 800:
             return "http://openweathermap.org/img/wn/01d@3x.png"
        case 801:
             return "http://openweathermap.org/img/wn/02d@3x.png"
        case 802:
            return "http://openweathermap.org/img/wn/03d@3x.png"
        case 803:
            return "http://openweathermap.org/img/wn/04d@3x.png"
        case 804:
            return "http://openweathermap.org/img/wn/04d@3x.png"
        default:
            return "cloud"
        }
    }
}
