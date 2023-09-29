/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct HomeBase : Codable {
	let wallet : String?
	let first_name : String?
	let last_name : String?
	let mobile : String?
	let email : String?
	let email_verified_status : String?
	let mobile_verified_status : String?
	let category_list : [Category_list]?
	let banner_list : [Banner_list]?
	let store_list : [Store_list]?
	let rating_popup : String?

	enum CodingKeys: String, CodingKey {

		case wallet = "wallet"
		case first_name = "first_name"
		case last_name = "last_name"
		case mobile = "mobile"
		case email = "email"
		case email_verified_status = "email_verified_status"
		case mobile_verified_status = "mobile_verified_status"
		case category_list = "category_list"
		case banner_list = "banner_list"
		case store_list = "store_list"
		case rating_popup = "rating_popup"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wallet = try values.decodeIfPresent(String.self, forKey: .wallet)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		email_verified_status = try values.decodeIfPresent(String.self, forKey: .email_verified_status)
		mobile_verified_status = try values.decodeIfPresent(String.self, forKey: .mobile_verified_status)
		category_list = try values.decodeIfPresent([Category_list].self, forKey: .category_list)
		banner_list = try values.decodeIfPresent([Banner_list].self, forKey: .banner_list)
		store_list = try values.decodeIfPresent([Store_list].self, forKey: .store_list)
		rating_popup = try values.decodeIfPresent(String.self, forKey: .rating_popup)
	}

}
