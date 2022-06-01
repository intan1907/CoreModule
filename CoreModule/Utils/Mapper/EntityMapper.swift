//
//  EntityMapper.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 01/06/22.
//

import Foundation

public protocol EntityMapper: BaseMapper {
    associatedtype Entity
    
    func transformDomainToEntity(domain: Domain) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
}
