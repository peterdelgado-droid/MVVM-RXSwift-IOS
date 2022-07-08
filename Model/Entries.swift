/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Entries : Codable {
	let aPI : String
	let description : String?
	let auth : String?
	let hTTPS : Bool?
	let cors : String?
	let link : String
	let category : String?

	enum CodingKeys: String, CodingKey {

		case aPI = "API"
		case description = "Description"
		case auth = "Auth"
		case hTTPS = "HTTPS"
		case cors = "Cors"
		case link = "Link"
		case category = "Category"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aPI = try values.decodeIfPresent(String.self, forKey: .aPI)!
		description = try values.decodeIfPresent(String.self, forKey: .description)
		auth = try values.decodeIfPresent(String.self, forKey: .auth)
		hTTPS = try values.decodeIfPresent(Bool.self, forKey: .hTTPS)
		cors = try values.decodeIfPresent(String.self, forKey: .cors)
		link = try values.decodeIfPresent(String.self, forKey: .link)!
		category = try values.decodeIfPresent(String.self, forKey: .category)
	}

}
