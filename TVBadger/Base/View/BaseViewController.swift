//
//  BaseViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import UIKit

class BaseViewController: UIViewController {

    let deviceDiscoverer = DeviceDiscovery()
    weak var deviceDiscoveryProtocol: DeviceDiscoveryProtocol?
    var viewModel = BaseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceDiscoverer.delegate = self
        deviceDiscoveryProtocol = deviceDiscoverer
        deviceDiscoveryProtocol?.startSearch()
        viewModel.webSocketDelegate = viewModel
    }
}

extension BaseViewController: DeviceDiscoveryDelegate {

    func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {
        //response.
    }
    
    func discoveredService(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {}
    
    func closedSearch() {}
}


