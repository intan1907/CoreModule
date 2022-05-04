//
//  Mapper.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Foundation

public protocol Mapper {
    associatedtype DomainParam
    associatedtype RequestParam
    
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformDomainParamToRequest(param: DomainParam) -> RequestParam
    func transformResponseToDomain(response: Response) -> Domain
    func transformDomainToEntity(domain: Domain) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
}
