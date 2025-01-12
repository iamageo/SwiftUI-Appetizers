//
//  NetworkManager.swift
//  SwiftUI-Appetizers
//
//  Created by Geovani Amaral on 23/11/24.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init () {}
    
    func getAppetizers (completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
            
        let cacheKey = urlString
            
        if let image = cache.object(forKey: cacheKey as NSString) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey as NSString)
            completed(image)
        }
        
        task.resume()
    }
    
}
