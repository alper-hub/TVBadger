//
//  BaseViewModel.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

class BaseViewModel {
    
    // MARK: Delegates

    weak var webSocketDelegate: WebSocketDelegate?
    weak var webSocketProtocol: WebSocketProtocol?
    weak var deviceDiscoveryProtocol: DeviceDiscoveryProtocol?
    weak var delegate: BaseViewModelDelegate?

    // MARK: Variables

    private let webSockets = WebSocket()
    private let deviceDiscoverer = DeviceDiscovery()
    
    // MARK: Init

    init(delegate: BaseViewModelDelegate?) {
        self.webSocketProtocol = webSockets
        webSocketDelegate = self
        deviceDiscoverer.delegate = self
        deviceDiscoveryProtocol = deviceDiscoverer
        self.delegate = delegate
    }
}

    // MARK: Base ViewModel Protocol Methods

extension BaseViewModel: BaseViewModelProtocol {

    func openWSConnection(url: String) {
        webSocketProtocol?.openWSConnection(url: url)
    }
    
    func closeWSConnection() {
        webSocketProtocol?.closeWSConnection()
    }
    
    func sendMessage(message: String) {
        webSocketProtocol?.sendMessage(message: message)
    }

    func searchForDevices() {
        deviceDiscoveryProtocol?.startSearch()
    }
}

    // MARK: Web Socket Delegate

extension BaseViewModel: WebSocketDelegate {
    
    func connectionOpened() {}
    
    func connectionClosed() {}
    
    func messageReceived(message: String?) {}
    
    func dataReceived(data: Data?) {}
    
    func webSocketError(error: Error?, area: String) {}
}

    // MARK: Device Discovery Delegate

extension BaseViewModel: DeviceDiscoveryDelegate {
    
    func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {
    }
    
    func discoveredService(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {}
    
    func closedSearch() {}
}
