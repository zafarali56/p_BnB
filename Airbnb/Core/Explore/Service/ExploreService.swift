//
//  ExploreService.swift
//  Airbnb
//
//  Created by Zafar Ali on 29/02/2024.
//

import Foundation
class ExploreService {
	func fetchListing () async throws -> [Listing] {
		return DeveloperPreview.shared.listings
	}
}
