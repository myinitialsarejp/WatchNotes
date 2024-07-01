//
//  Note.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 6/2/24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
