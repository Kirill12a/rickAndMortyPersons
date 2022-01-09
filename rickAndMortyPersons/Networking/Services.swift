//
//  Services.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit

class Services{
    
    enum NetworkError: Error {
        case badUrl
        case badTadaTask
    }
    
    func fetch<T: Decodable>(url: String, type: T.Type, comletion : @escaping (Result<T, NetworkError>)->Void){
        guard let url = URL(string: url) else {
            comletion(.failure(.badUrl))
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                comletion(.failure(.badTadaTask))
                return
            }
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                comletion(.success(json))
            }catch{
                comletion(.failure(.badTadaTask))
            }
        }.resume()
        
    }
    
    func fetch(url: String, comletion: @escaping (Result<UIImage, Error>)->Void){
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                comletion(.failure(error))
            }
            guard let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {return}
            
            comletion(.success(image))
        }.resume()
    }
}
