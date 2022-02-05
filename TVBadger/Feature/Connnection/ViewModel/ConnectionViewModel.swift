//
//  ConnectionViewModel.swift
//  TVBadger
//
//  Created by Alper Tufan on 9.01.2022.
//

import Foundation

class ConnectionViewModel: ConnectionViewModelProtocol {
    
    weak var delegate: ConnectionViewModelDelegate?
    
    init(delegate: ConnectionViewModelDelegate) {
        self.delegate = delegate
    }
}
