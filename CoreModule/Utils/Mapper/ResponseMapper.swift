//
//  ResponseMapper.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 01/06/22.
//

import Foundation

public protocol ResponseMapper: Mapper {
    associatedtype Response
    
    func transformResponseToDomain(response: Response) -> Domain
}
