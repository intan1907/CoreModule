//
//  UseCase.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Combine

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
