//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Zafar Ali on 29/02/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var listing = [Listing] ()
	private let service:  ExploreService
	init (service: ExploreService)
	{
		self.service = service
		Task{ await fetchListing ()}
	}
		func fetchListing () async {
			do {
				self.listing = try await service.fetchListing()
			}catch {
				print("Debug: Failed to fetch listing with error: \(error.localizedDescription)")
			}
		}
	}

