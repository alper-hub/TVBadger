//
//  ConnectionViewModelContracts.swift
//  TVBadger
//
//  Created by Alper Tufan on 9.01.2022.
//

import Foundation

protocol ConnectionViewModelProtocol: AnyObject {
    
}

protocol ConnectionViewModelDelegate: AnyObject {
    func handleViewMdelOutput(_ output: Output)
}

enum Output {
    case searching
    case foundServices
    case noServiceFound
    case error
}
