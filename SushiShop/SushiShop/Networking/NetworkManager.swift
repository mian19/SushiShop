//
//  NetworkManager.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import Foundation

class NetworkManager {
    
    
    func getCategoriesSushi(completion: @escaping (Result<Sushi, Error>) -> Void) {
        let url = URL(string: "https://vkus-sovet.ru/api/getMenu.php")!
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")        // the expected response is also JSON
        request.httpMethod = "POST"

       // guard let httpBody = try? JSONSerialization.data(withJSONObject: []) else { return }
        
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
}


//let menuListURL = "https://vkus-sovet.ru/api/getMenu.php"
//
//guard let url = URL(string: menuListURL) else { return }
//
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.addValue("application/json, charset=utf-8", forHTTPHeaderField: "Content-Type")
//request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
//guard let httpBody = try? JSONSerialization.data(withJSONObject: []) else { return }
//        request.httpBody = httpBody
//let session = URLSession.shared
//session.dataTask(with: request) { (data, _, error) in
//    if let error = error {
//        completion(.failure(error))
//        print(error.localizedDescription)
//        return
//    }
//
//    guard let data = data else { return }
//    print(data)
//
//    do {
//
//        let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
//        print(jsonData)
//        if let jsonData = jsonData as? [String: Any] {
//            jsonData.count
//            print(jsonData["menuList"])
//        } else {
//            print ("no")
//        }
////                DispatchQueue.main.async {
////                    completion(.success(jsonData as! [MenuList]))
////                }
//
//    } catch {
//        completion(.failure(error))
//    }
//}.resume()
//
//return
