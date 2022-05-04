//
//  UseCase.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import RxSwift

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> Observable<Response>
}
