//
//  Restaurant.swift
//  RX
//
//  Created by Peter Delgado on 1/7/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
	let greeting: String
	let instructions: [String]
}


struct Restaurant: Decodable {

	let API: String
	let de: String

}

enum Cuisine {
	case european
	case indian


}
