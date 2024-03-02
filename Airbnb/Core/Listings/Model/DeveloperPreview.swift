import Foundation
class DeveloperPreview {
	static let shared = DeveloperPreview ()
	var listings: [Listing] = [
		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Zafar Ali",
			ownerImageUrl: "hostFrame",
			numberOfGuests: 3,
			numberOfBedrooms: 1,
			numberOfBathrooms: 1,
			numberOfBeds: 1,
			pricePerNight: 12000,
			latitude: 24.8607, // Sample Karachi coordinates
			longitude: 67.0011,
			imageURLs: ["listing-2", "listing-1", "listing-4", "listing-3"],
			address: "Apartment 201, ABC Building",
			city: "Karachi",
			state: "Sindh",
			title: "Studio in the Heart of Karachi",
			rating: 4.2,
			features: [.superHost, .selfCheckIn],
			amenities: [.kitchen, .wifi, .tv, .pool, .wifi, .laundary, .balcony],
			type: .apartment
		),

		// Listing 2 - Beachfront Villa
		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Emily",
			ownerImageUrl: "hostFrame2",
			numberOfGuests: 3,
			numberOfBedrooms: 3,
			numberOfBathrooms: 3,
			numberOfBeds: 5,
			pricePerNight: 15000,
			latitude: 24.8127, // Sample Sea View, Karachi coordinates
			longitude: 66.9922,
			imageURLs: ["listing2-2", "listing2-1", "listing2-4", "listing2-3"],
			address: "123 Seaview Road",
			city: "Nawabshah",
			state: "Sindh",
			title: "Beachfront Villa with Private Pool",
			rating: 4.4,
			features: [.superHost],
			amenities: [.pool, .kitchen, .wifi, .laundary, .tv, .balcony],
			type: .villa
		),
		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Bella",
			ownerImageUrl: "hostFrame2",
			numberOfGuests: 5,
			numberOfBedrooms: 2,
			numberOfBathrooms: 2,
			numberOfBeds: 3,
			pricePerNight: 120,
			latitude: 24.9200,
			longitude: 67.1113,
			imageURLs: ["listing3-2", "listing3-1", "listing3-4", "listing3-3"],
			address: "Block 13D, Gulshan-e-Iqbal",
			city: "Karachi",
			state: "Sindh",
			title: "Modern Townhouse near City Centre",
			rating: 4.5,
			features: [.selfCheckIn, .superHost],
			amenities: [.kitchen, .wifi, .laundary, .tv, .office],
			type: .townHouse
		),

		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Zafar ali",
			ownerImageUrl: "hostFrame",
			numberOfGuests: 4,
			numberOfBedrooms: 2,
			numberOfBathrooms: 1,
			numberOfBeds: 2,
			pricePerNight: 8000,
			latitude: 24.8988, // Sample coordinates (adjust for desired location)
			longitude: 67.0519,
			imageURLs: ["listing4-4", "listing4-3", "listing4-2", "listing4-1", "listing4-5"],
			address: "234 Hillside Drive",
			city: "Hyderabad",
			state: "Sindh",
			title: "Cozy Cottage in Scenic Location",
			rating: 4.0,
			features: [.selfCheckIn, .superHost], // No special features
			amenities: [.kitchen, .wifi, .tv],
			type: .villa
		),

		// Listing 5 - Luxury Penthouse
		Listing(
			id: UUID().uuidString,
			ownerId: UUID().uuidString,
			ownerName: "Zafar Ali",
			ownerImageUrl: "hostFrame",
			numberOfGuests: 2,
			numberOfBedrooms: 1,
			numberOfBathrooms: 1,
			numberOfBeds: 1,
			pricePerNight: 25000,
			latitude: 24.8309, // Sample coordinates (adjust for desired location)
			longitude: 67.0329,
			imageURLs: ["listing5-1", "listing5-2", "listing5-3", "listing5-4", "listing5-5", "listing-5-6"],
			address: "567 Skyline Boulevard",
			city: "Karachi",
			state: "Sindh",
			title: "Luxury Penthouse with City Views",
			rating: 4.8,
			features: [.selfCheckIn, .superHost],
			amenities: [.kitchen, .wifi,],
			type: .townHouse
		)

	]
}

