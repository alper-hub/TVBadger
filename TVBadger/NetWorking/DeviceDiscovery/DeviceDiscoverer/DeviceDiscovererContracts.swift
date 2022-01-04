//
//  DeviceDiscovererContracts.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

protocol DeviceDiscoveryDelegate: AnyObject {

    func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession)
    func discoveredService(response: SSDPMSearchResponse, session: SSDPDiscoverySession)
    func closedSearch()
}

protocol DeviceDiscoveryProtocol: AnyObject {

    func startSearch()
    func stopSearch()
}
