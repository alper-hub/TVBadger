//
//  BaseViewModelContracts.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func connectionOpened()
    func connectionClosed()
    func messageReceived(message: String?)
    func dataReceived(data: Data?)
    func webSocketError(error: Error?, area: String)
    func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession)
    func closedSearch()
}

protocol BaseViewModelProtocol: AnyObject {
    func openWSConnection(url: String)
    func closeWSConnection()
    func sendMessage(message: String)
    func searchForDevices()
}
