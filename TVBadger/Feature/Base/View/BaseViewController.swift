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

    func setupNavBarUI(
        title: String,
        isLargeText: Bool,
        titleTextColor: UIColor,
        backgroundColor: UIColor?,
        isBarHidden: Bool
    ) {
        self.navigationController?.setupNavBarUI(
            title: "Search & Connect",
            isLargeText: true,
            titleTextColor: .tintColor,
            backgroundColor: .mainBackgroundColor,
            isBarHidden: false
        )
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
