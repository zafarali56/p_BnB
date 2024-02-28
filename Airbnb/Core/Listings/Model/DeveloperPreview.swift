import Foundation

class DeveloperPreview {
	var listings: [Listing] = [
		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Zafar Ali",
			ownerImageUrl: "hostFrame",
			numberOfBedrooms: 1,
			numberOfBathrooms: 1,
			numberOfBeds: 1,
			pricePerNight: 65,
			priePerNight: 65,
			latitude: 24.8607, // Sample Karachi coordinates
			longitude: 67.0011,
			imageURLs: ["listing-2", "listing-1", "listing-4", "listing-3"],
			address: "Apartment 201, ABC Building",
			city: "Karachi",
			state: "Sindh",
			title: "Cozy Studio in the Heart of Karachi",
			rating: 4.2,
			features: [.selfCheckIn],
			amenities: [.kitchen, .wifi, .tv],
			type: .apartment
		),

//		// Listing 2 - Beachfront Villa
//		Listing(
//			id: UUID().uuidString,
//			ownerId: UUID().uuidString,
//			ownerName: "Sarah Khan",
//			ownerImageUrl: "https://www.example.com/sarah_profile.jpg",
//			numberOfBedrooms: 3,
//			numberOfBathrooms: 3,
//			numberOfBeds: 5,
//			pricePerNight: 320,
//			priePerNight: 320,
//			latitude: 24.8127, // Sample Sea View, Karachi coordinates
//			longitude: 66.9922,
//			address: "123 Seaview Road",
//			city: "Karachi",
//			state: "Sindh",
//			title: "Beachfront Villa with Private Pool",
//			rating: 4.9,
//			features: [.superHost],
//			amenities: [.pool, .kitchen, .wifi, .laundary, .tv, .balcony],
//			type: .villa
//		),
//
//		// Listing 3 - Modern Townhouse
//		Listing(
//			id: UUID().uuidString,
//			ownerId: UUID().uuidString,
//			ownerName: "John Smith",
//			ownerImageUrl: "https://www.example.com/john_profile.jpg",
//			numberOfBedrooms: 2,
//			numberOfBathrooms: 2,
//			numberOfBeds: 3,
//			pricePerNight: 120,
//			priePerNight: 120,
//			latitude: 24.9200,
//			longitude: 67.1113,
//			address: "Block 13D, Gulshan-e-Iqbal",
//			city: "Karachi",
//			state: "Sindh",
//			title: "Modern Townhouse near City Centre",
//			rating: 4.5,
//			features: [.selfCheckIn, .superHost],
//			amenities: [.kitchen, .wifi, .laundary, .tv, .office],
//			type: .townHouse
//		)

	]
}

