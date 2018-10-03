//
//  GetFromAPI.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 14/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import Foundation
import Alamofire

class GetFromAPI {
    
    static func getAllData(baseUrl: String, completedCallback: @escaping (_ data:[Songs]?)->Void ){
        
        Alamofire.request(baseUrl, method:.get)
            .responseArray {(response: DataResponse<[Songs]>) in
                
                
                if let status = response.response?.statusCode {
                    switch(status) {
                    case 200:
                        guard response.result.isSuccess else {
                            print("Error")
                            return
                        }
                        let dataSong = response.result.value! as [Songs]
                        completedCallback(dataSong)
                        
                        
                    default:
                        print("Error")
                        completedCallback(nil)
                    }
                }
                
        }
    }
    
    
    static func fethingDatabase(url: String) -> [SongsBackup] {
        
        var songList = [SongsBackup]()
        
        let urlString = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                
                songList = jsonArray.flatMap(SongsBackup.init)
                
                // self.songList = jsonArray.flatMap(Songs.init)
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
        return songList
        
    }

    
}
