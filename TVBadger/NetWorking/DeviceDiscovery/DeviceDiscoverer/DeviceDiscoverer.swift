//
//  DeviceDiscoverer.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation
import Alamofire

public class DeviceDiscovery {

    private let discovery: SSDPDiscovery = SSDPDiscovery.defaultDiscovery
    fileprivate var session: SSDPDiscoverySession?
    weak var delegate: DeviceDiscoveryDelegate?
    
    private func searchForDevices() {
        // Create the request for MediaRenderer devices
        let mediaRendererTarget = SSDPSearchTarget.deviceMediaRenderer
        let request = SSDPMSearchRequest(delegate: self, searchTarget: mediaRendererTarget)
    
        // Start a discovery session for the request and timeout after 10 seconds of searching.
        self.session = try! discovery.startDiscovery(request: request, timeout: 10.0)
    }
    
    private func stopSearching() {
        self.session?.close()
        self.session = nil
    }
}

extension DeviceDiscovery: SSDPDiscoveryDelegate {
    
    public func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {
        print("Found device \(response)\n")
        self.delegate?.discoveredDevice(response: response, session: session)
   }
    
   public func discoveredService(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {
       self.delegate?.discoveredService(response: response, session: session)
   }
    
   public func closedSession(_ session: SSDPDiscoverySession) {
       print("Session closed\n")
       print(self.delegate?.closedSearch())
   }
}

extension DeviceDiscovery: DeviceDiscoveryProtocol {

    func startSearch() {
        searchForDevices()
    }
    
    func stopSearch() {
        stopSearch()
    }
}

