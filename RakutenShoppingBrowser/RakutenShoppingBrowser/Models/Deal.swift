//
//  Deal.swift
//  RakutenShoppingBrowser
//

import Foundation

struct Deal: Identifiable, Codable {
    let id: Int?
    let retailer: String?
    let title: String?
    let details: String?
    let imageName: String?
    let imageURL: String?
    let dealURL: String?
}
