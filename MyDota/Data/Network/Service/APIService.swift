//
//  APIService.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//

import Foundation

//MARK: - Custom Detail Hero opened by DataTask
class APIService{
    private var dataTask: URLSessionDataTask?
    //Get Custom Detail Hero
    func getDetailDataHero(completion: @escaping (Result<ModelDetailHeroes2, Error>) -> Void){
        let heroStatsURL = "https://api.opendota.com/api/herostats"
        guard let url = URL(string: heroStatsURL) else { return }
        
        //Create URL Sesion work on the backgroound
        dataTask = URLSession.shared.dataTask(with: url){ data, response, error in
            //Handle error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                //Handle empty response
                print("empty response")
                return
            }
            
            guard let data = data else {
                //handle empty data
                print("Empty Data")
                return
            }
            
            do{
                //parse data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ModelDetailHeroes2.self, from: data)
                
                //Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }catch let error{
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
    //MARK: - get image Data
    func getImageDataFromURL(url: URL, completion: @escaping ((Data) -> Void)){
        URLSession.shared.dataTask(with: url){ (data, respponse, error) in
            //Handle Error
            if let error = error {
                print("Data task error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                //handle empty data
                print("Empty data")
                return
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
}
