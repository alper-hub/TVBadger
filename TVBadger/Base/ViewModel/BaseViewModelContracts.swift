//
//  BaseViewModelContracts.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    
}

protocol BaseViewModelProtocol: AnyObject {
    func openWSConnection(url: String)
    func closeWSConnection()
    func sendMessage(message: String)
}
