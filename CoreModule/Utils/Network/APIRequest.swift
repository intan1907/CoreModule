//
//  APIRequest.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 30/05/22.
//

import Alamofire
import Combine

struct APIRequest {
    static func request<T: Codable>(url: URLRequestConvertible) -> AnyPublisher<T, Error> {
        return Future<T, Error> { completion in
            let dataRequest: DataRequest? = AF.request(url)
            
            guard let request = dataRequest else {
                completion(.failure(CustomHttpError.noRequest))
                return
            }
            
            request.responseDecodable(of: T.self) { (response) in
                let errorMessage = response.error?.errorDescription ?? ""
                let code = response.error?.responseCode ?? response.response?.statusCode
                if errorMessage.contains("offline") {
                    completion(.failure(CustomHttpError.noInternetConnection))
                } else {
                    switch code {
                    case 401:
                        completion(.failure(CustomHttpError.unauthorized))
                    case 404:
                        completion(.failure(CustomHttpError.serviceNotAvailable))
                    case 503:
                        completion(.failure(CustomHttpError.serverError))
                    default:
                        if let data = response.value {
                            completion(.success(data))
                        } else {
                            completion(.failure(response.error ?? CustomHttpError.serverError))
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
