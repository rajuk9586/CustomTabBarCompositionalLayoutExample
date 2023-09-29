/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Store_list : Codable {
	let store_code : String?
	let name : String?
	let title : String?
	let highlights : String?
	let is_missing_cashback : String?
	let track_time : String?
	let paid_time : String?
	let cashaly_cashback : String?
	let cashback_rate : String?
	let cashback_term_tips : String?
	let logo : String?
	let banner : String?
	let rewards : Int?
	let max_rewards : Int?
	let rewarde_unit : String?
	let is_best_offer : String?
	let is_cashback_app : String?

	enum CodingKeys: String, CodingKey {

		case store_code = "store_code"
		case name = "name"
		case title = "title"
		case highlights = "highlights"
		case is_missing_cashback = "is_missing_cashback"
		case track_time = "track_time"
		case paid_time = "paid_time"
		case cashaly_cashback = "cashaly_cashback"
		case cashback_rate = "cashback_rate"
		case cashback_term_tips = "cashback_term_tips"
		case logo = "logo"
		case banner = "banner"
		case rewards = "rewards"
		case max_rewards = "max_rewards"
		case rewarde_unit = "rewarde_unit"
		case is_best_offer = "is_best_offer"
		case is_cashback_app = "is_cashback_app"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		store_code = try values.decodeIfPresent(String.self, forKey: .store_code)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		highlights = try values.decodeIfPresent(String.self, forKey: .highlights)
		is_missing_cashback = try values.decodeIfPresent(String.self, forKey: .is_missing_cashback)
		track_time = try values.decodeIfPresent(String.self, forKey: .track_time)
		paid_time = try values.decodeIfPresent(String.self, forKey: .paid_time)
		cashaly_cashback = try values.decodeIfPresent(String.self, forKey: .cashaly_cashback)
		cashback_rate = try values.decodeIfPresent(String.self, forKey: .cashback_rate)
		cashback_term_tips = try values.decodeIfPresent(String.self, forKey: .cashback_term_tips)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
		banner = try values.decodeIfPresent(String.self, forKey: .banner)
		rewards = try values.decodeIfPresent(Int.self, forKey: .rewards)
		max_rewards = try values.decodeIfPresent(Int.self, forKey: .max_rewards)
		rewarde_unit = try values.decodeIfPresent(String.self, forKey: .rewarde_unit)
		is_best_offer = try values.decodeIfPresent(String.self, forKey: .is_best_offer)
		is_cashback_app = try values.decodeIfPresent(String.self, forKey: .is_cashback_app)
	}

}