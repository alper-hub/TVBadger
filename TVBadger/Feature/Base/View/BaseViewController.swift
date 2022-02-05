//
//  BaseViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: Properties

    private var viewModel: BaseViewModelProtocol?
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
       viewModel = BaseViewModel(delegate: self)
    }

    // MARK: Device Discovery

    func startSearch() {
        viewModel?.searchForDevices()
    }
}

extension BaseViewController: BaseViewModelDelegate {

    func connectionOpened() {}
    
    func connectionClosed() {}
    
    func messageReceived(message: String?) {}
    
    func dataReceived(data: Data?) {}
    
    func webSocketError(error: Error?, area: String) {}
    
    func discoveredDevice(response: SSDPMSearchResponse, session: SSDPDiscoverySession) {}
    
    func closedSearch() {}
}
