//
//  Base.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 08/01/22.
//

import Foundation
import UIKit


extension URLSession{
    enum customError: Error{
        case invalidURL
        case invalidData
    }
    
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        //unwrap url
        guard let url = url else {
            completion(.failure(customError.invalidURL))
            return
        }
        
        //create task
        let task = dataTask(with: url) { data, _, error in
            //unwrap data
            guard let data = data else {
                if let error = error {
                    //error in sysytem
                    completion(.failure(error))
                }else{
                    //error in data
                    completion(.failure(customError.invalidData))
                }
                return
            }
            
            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
