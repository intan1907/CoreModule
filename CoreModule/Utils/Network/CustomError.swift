//
//  CustomError.swift
//  CoreModule
//
//  Created by Intan Nurjanah on 18/04/22.
//

import Foundation

public enum CustomHttpError: LocalizedError {
    case noRequest
    case noInternetConnection
    case serviceNotAvailable
    case serverError
    
    public var errorDescription: String? {
        switch self {
        case .noRequest:
            return "No request!"
        case .noInternetConnection:
            return "No internet connection"
        case .serviceNotAvailable:
            return "Service not available"
        case .serverError:
            return "An error occurred on the server"
        }
    }
}

public enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    public var errorDescription: String? {
        switch self {
        case .invalidInstance:
            return "Database can't instance."
        case .requestFailed:
            return "Your request failed."
        }
    }
}
