//
//  WeatherManager.swift
//  Blandino-Weather-App-Demo
//
//  Created by Carlos Blandino on 6/6/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//
import UIKit

struct WeatherManager {
    //make to use https and not http, App Transport Security policy requires the use
    //of a secure connection
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=123fa8b368bed69d605b5d9bb748800e&units=imperial&q="
    
    func getWeather(cityName: String) {
        let weatherUrl = "\(url)\(cityName)"
        performRequest(urlString: weatherUrl)
    }
    
    func performRequest(urlString: String) {
     
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
            let task = session.dataTask(with: url, completionHandler: taskHandler(data:response:error:))
            // start task
            task.resume()
        } else {
            print("something is wrong with url")
        }
        
    }
    func taskHandler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }

        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
}
