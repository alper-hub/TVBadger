//
//  SSDPMSearchResponse.swift
//  TVBadger
//
//  Created by Alper Tufan on 13.12.2021.
//

import Foundation

/// An M-SEARCH response for a device or service found during device/service discovery
public struct SSDPMSearchResponse {
    /// CACHE-CONTROL
    public let cacheControl: Date?
    /// DATE
    public let date: Date?
    /// EXT
    public let ext: Bool
    /// LOCATION
    public let location: URL
    /// SERVER
    public let server: String?
    /// ST
    public let searchTarget: SSDPSearchTarget
    /// USN
    public let usn: String
    
    /// All other headers in the discovery response
    public let otherHeaders: [String: String]
}

//
// MARK: -
//
extension SSDPMSearchResponse: Hashable {
    public var hashValue: Int {
        return (31 &* self.usn.hashValue) &+ self.location.hashValue
    }
}

public func ==(lhs: SSDPMSearchResponse, rhs: SSDPMSearchResponse) -> Bool {
    return lhs.usn == rhs.usn && lhs.location == rhs.location
}
