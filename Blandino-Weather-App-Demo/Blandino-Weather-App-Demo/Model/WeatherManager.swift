//
//  WeatherManager.swift
//  Blandino-Weather-App-Demo
//
//  Created by Carlos Blandino on 6/6/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//
import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager , weather: WeatherModel)
    
}

struct WeatherManager {
    //make to use https and not http, App Transport Security policy requires the use
    //of a secure connection
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=123fa8b368bed69d605b5d9bb748800e&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func getWeather(cityName: String) {
        let weatherUrl = "\(url)&q=\(cityName)"
        performRequest(with: weatherUrl)
    }
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let weatherUrl = "\(url)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: weatherUrl)
    }
    
    func performRequest(with urlString: String) {
     
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        // Create URL
        /*
            This initializer returns nil if the string doesn’t represent a valid URL. For example, an empty string or one containing characters that are illegal in a URL produces nil.
              the % percent sign is an escape character and a space hex value is 20 so %20 would
            represent a space in a url
         
            adding percent encoding would clean up a dirty url
         
            Note: using the device keyboard corrupts the url and need to add percent encoding to clean it
        */
        if let url =  URL(string: urlString!) {
            // create urlsession
            let session = URLSession(configuration: .default)
            // give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let weather = self.parseJSON(safeData)
                    
                    if let theWeather = weather {
                        self.delegate?.didUpdateWeather(self, weather: theWeather)
                    } else {
                        return
                    }
                }
            }
            // start task
            task.resume()
        } else {
            print("something is wrong with url")
        }
    }
    
    func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
          let decodedData =  try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let image = decodedData.weather[0].icon
            let description = decodedData.weather.description
            let weather = WeatherModel(idOfCondition: id, nameOfCity: name, description: description, temp: temp)
            return weather
        } catch {
            print(error)
            return nil
        }
    }
}


