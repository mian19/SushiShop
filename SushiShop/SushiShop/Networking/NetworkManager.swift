//
//  NetworkManager.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import Foundation
import UIKit

class NetworkManager {
    
    func getCategoriesSushi(completion: @escaping (Result<Sushi, Error>) -> Void) {
        let url = URL(string: "https://vkus-sovet.ru/api/getMenu.php")!
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")        // the expected response is also JSON
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAnswer = try JSONDecoder().decode(Sushi.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonAnswer))
                }
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getSubCategorySushi(forBody: String, completion: @escaping (Result<Sushi, Error>) -> Void) {
        let url = URL(string: "https://vkus-sovet.ru/api/getSubMenu.php")!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!

        components.queryItems = [
            URLQueryItem(name: "menuID", value: forBody)
        ]

        let query = components.url!.query
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = Data(query!.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            print (data)
            do {
                let jsonAnswer = try JSONDecoder().decode(Sushi.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonAnswer))
                }
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getImageForCategorySushi(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }

        }.resume()
    }
    

}
