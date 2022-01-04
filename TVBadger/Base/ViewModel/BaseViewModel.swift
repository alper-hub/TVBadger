//
//  BaseViewModel.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

class BaseViewModel: BaseViewModelProtocol {

    weak var webSocketDelegate: WebSocketDelegate?
    weak var webSocketProtocol: WebSocketProtocol?
    var webSockets = WebSocket()
    
    init() {
        self.webSocketProtocol = webSockets
    }

    func openWSConnection(url: String) {
        webSocketProtocol?.openWSConnection(url: url)
    }

    func closeWSConnection() {
        webSocketProtocol?.closeWSConnection()
    }

    func sendMessage(message: String) {
        webSocketProtocol?.sendMessage(message: message)
    }
}

extension BaseViewModel: WebSocketDelegate {

    func connectionOpened() {
        
    }
    
    func connectionClosed() {
        
    }
    
    func messageReceived(message: String?) {
        
    }
    
    func dataReceived(data: Data?) {
        
    }
    
    func webSocketError(error: Error?, area: String) {
    }
}

