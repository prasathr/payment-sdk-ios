//
//  EmbeddedData.swift
//  NISdk
//
//  Created by Johnny Peter on 20/08/19.
//  Copyright © 2019 Network International. All rights reserved.
//

import Foundation

public struct EmbeddedData {
    public let order: [OrderResponse]?
    public let payment: [PaymentResponse]?
    
    func getSavedCardLink() -> String? {
        return payment?.first?.paymentLinks?.savedCardPaymentLink
    }
    
    func getSelfLink() -> String? {
        return payment?.first?.paymentLinks?.paymentLink
    }
    
    func getAaniPayLink() -> String? {
        return payment?.first?.paymentLinks?.aaniPaymentLink
    }
}

extension EmbeddedData: Codable {
    
    private enum EmbeddedDataCodingKeys: String, CodingKey {
        case order
        case payment
    }
    
    public init(from decoder: Decoder) throws {
        let embeddedDataContainer = try decoder.container(keyedBy: EmbeddedDataCodingKeys.self)
        order = try embeddedDataContainer.decodeIfPresent([OrderResponse].self, forKey: .order)
        payment = try embeddedDataContainer.decodeIfPresent([PaymentResponse].self, forKey: .payment)
    }
}
