//
//  ParamMapper.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 01/06/22.
//

import Foundation

public protocol ParamMapper {
    associatedtype DomainParam
    associatedtype RequestParam
    
    func transformDomainParamToRequest(param: DomainParam) -> RequestParam
}
