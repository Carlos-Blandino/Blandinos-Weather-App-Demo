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
        
//        switch idOfCondition {
//        case 200...232:
//            return "https://openweathermap.org/img/wn/11d.png"
//        case 300...321:
//            return "https://openweathermap.org/img/wn/09d.png"
//        case 500...504:
//             return "https://openweathermap.org/img/wn/10d.png"
//        case 511:
//            return "https://openweathermap.org/img/wn/13d.png"
//        case 520...531:
//            return "https://openweathermap.org/img/wn/09d.png"
//        case 600...622:
//             return "https://openweathermap.org/img/wn/13d.png"
//        case 701...781:
//             return "https://openweathermap.org/img/wn/50d.png"
//        case 800:
//             return "https://openweathermap.org/img/wn/01d.png"
//        case 801:
//             return "https://openweathermap.org/img/wn/02d.png"
//        case 802:
//            return "https://openweathermap.org/img/wn/03d.png"
//        case 803:
//            return "https://openweathermap.org/img/wn/04d.png"
//        case 804:
//            return "https://openweathermap.org/img/wn/04d.png"
//        default:
//            return "cloud"
//        }
//
        switch idOfCondition {
        case 200...232:
            return "https://openweathermap.org/img/wn/11d@2x.png"
        case 300...321:
            return "https://openweathermap.org/img/wn/09d@2x.png"
        case 500...504:
             return "https://openweathermap.org/img/wn/10d@2x.png"
        case 511:
            return "https://openweathermap.org/img/wn/13d@2x.png"
        case 520...531:
            return "https://openweathermap.org/img/wn/09d@2x.png"
        case 600...622:
             return "https://openweathermap.org/img/wn/13d@2x.png"
        case 701...781:
             return "https://openweathermap.org/img/wn/50d@2x.png"
        case 800:
             return "https://openweathermap.org/img/wn/01d@2x.png"
        case 801:
             return "https://openweathermap.org/img/wn/02d@2x.png"
        case 802:
            return "https://openweathermap.org/img/wn/03d@2x.png"
        case 803:
            return "https://openweathermap.org/img/wn/04d@2x.png"
        case 804:
            return "https://openweathermap.org/img/wn/04d@2x.png"
        default:
            return "cloud"
        }
    }
}
