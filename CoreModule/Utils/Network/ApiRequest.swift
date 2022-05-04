//
//  ApiRequest.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Alamofire
import RxSwift

public struct ApiRequest {
    
    public static func request<T: Codable>(url: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let dataRequest: DataRequest? = AF.request(url)
            
            guard let request = dataRequest else {
                observer.onError(CustomHttpError.noRequest)
                return Disposables.create()
            }
            
            request.responseDecodable(of: T.self) { (response) in
                let errorMessage = response.error?.errorDescription ?? ""
                let code = response.error?.responseCode ?? response.response?.statusCode
                if let data = response.value {
                    if errorMessage.contains("offline") {
                        observer.onError(CustomHttpError.noInternetConnection)
                    } else {
                        if code == 404 {
                            observer.onError(CustomHttpError.serviceNotAvailable)
                        } else if code == 503 {
                            observer.onError(CustomHttpError.serverError)
                        } else {
                            observer.onNext(data)
                            observer.onCompleted()
                        }
                    }
                } else {
                    if code == 404 {
                        observer.onError(CustomHttpError.serviceNotAvailable)
                    } else if code == 503 {
                        observer.onError(CustomHttpError.serverError)
                    } else {
                        observer.onError(response.error ?? CustomHttpError.serverError)
                    }
                }
            }
            
            return Disposables.create()
        }
    }
    
}
