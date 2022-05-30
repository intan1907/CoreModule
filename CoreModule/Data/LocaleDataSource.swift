//
//  LocaleDataSource.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Combine

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: [Response]) -> AnyPublisher<Bool, Error>
    func get(id: String) -> AnyPublisher<Response, Error>
    func update(id: String, entity: Response) -> AnyPublisher<Bool, Error>
    func delete(id: String) -> AnyPublisher<Bool, Error>
}
