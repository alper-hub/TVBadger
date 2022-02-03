//
//  BaseViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: Properties

    var viewModel = BaseViewModel()
    weak var viewModelProtocol: BaseViewModelProtocol?
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        self.viewModelProtocol = viewModel
        viewModel.viewModelDelegate = self
    }

    // MARK: Device Discovery

    func startSearch() {
        viewModelProtocol?.searchForDevices()
    }

    // MARK: Setup NavBar UI

    func setupNavBarUI(
        title: String,
        isLargeText: Bool,
        titleTextColor: UIColor,
        backgroundColor: UIColor?,
        isBarHidden: Bool
    ) {
        navigationController?.navigationBar.prefersLargeTitles = isLargeText
        navigationItem.title = title
        navigationController?.navigationBar.isHidden = isBarHidden
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: titleTextColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: titleTextColor]
        
            navigationController?.navigationBar.tintColor = backgroundColor
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.tintColor = backgroundColor
            navigationController?.navigationBar.barTintColor = backgroundColor
            navigationController?.navigationBar.isTranslucent = false
        }
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
