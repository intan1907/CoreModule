//
//  LocaleDataSource.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import RxSwift

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> Observable<[Response]>
    func add(entities: [Response]) -> Observable<Bool>
    func get(id: String) -> Observable<Response>
    func update(id: String, entity: Response) -> Observable<Bool>
    func delete(id: String) -> Observable<Bool>
}
