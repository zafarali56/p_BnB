//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Zafar Ali on 29/02/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var listing = [Listing] ()
	@Published var searchLocation = ""
	private let service:  ExploreService
	private var listingsCopy = [Listing]()
	init (service: ExploreService)
	{
		self.service = service
		Task{ await fetchListing ()}
	}
	func fetchListing () async {
		do {
			self.listing = try await service.fetchListing()
			self.listingsCopy = listing
		}catch {
			print("Debug: Failed to fetch listing with error: \(error.localizedDescription)")
		}
	}
	func updateListingsForLocation ()
	{
		let filteredListings = listing.filter({
			$0.city.lowercased() == searchLocation.lowercased() ||
			$0.state.lowercased() == searchLocation.lowercased()
		})
		self.listing = filteredListings.isEmpty ? listingsCopy : filteredListings
	}

}

