//
//  APIService.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import Foundation

enum APIError:String, Error {
    case unknownError = "alert_error_unknown"
    case serverError = "alert_error_server"

}


extension APIError: LocalizedError {
    
    var errorDescription: String? {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class APIService {
    
    let sourceURL = URL(string:"https://api.themoviedb.org/3/trending/tv/week?api_key=" + APIkey.tmdbKEY)!
    
    func requestCast(completion: @escaping (TMDB?) -> Void) {
        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
//            print(data)
//            print(response) // Meta Data에 관한 정보!
//            print(error)
            
            if let error = error {
                self.showAlert(_msg: .unknownError)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                self.showAlert(_msg: .serverError)
                return
            }
            
            if let data = data, let TMDBData = try? JSONDecoder().decode(TMDB.self, from: data){
                print("SUCCEED",TMDBData)
                completion(TMDBData)
                return
            }
            
//            completion(nil)
        }.resume()
    }

    func showAlert(_msg: APIError){
        print(#function)
    }
    
}
