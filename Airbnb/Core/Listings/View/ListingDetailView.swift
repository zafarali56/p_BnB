//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
	@Environment(\.dismiss) var dismiss
	let listing: Listing
	@State private var cameraPosition: MapCameraPosition

	init(listing: Listing) {
		self.listing = listing

		let region = MKCoordinateRegion(
			center: listing.city == "Karachi" ? CLLocationCoordinate2D.karachi : CLLocationCoordinate2D.nawabshah,
			span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
		)
		self._cameraPosition = State(initialValue: .region(region))
	}

	var body: some View {
		ScrollView {
			ZStack (alignment: .topLeading) {
				ListingImageCarouselView(listing: listing)
					.frame(height: 320)

				Button {
					dismiss()
				}label: {
					Image(systemName: "chevron.left")
						.foregroundStyle(.black)
						.background{
							Circle()
								.fill(.white)
								.frame(width: 32, height: 32)
						}
						.padding(32)
				}

			}

			VStack (alignment: .leading, spacing: 8){
				Text ("\(listing.title)")
					.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
					.fontWeight(.semibold)

				VStack (alignment: .leading)
				{
					HStack {
						HStack (spacing: 1){
							Text("\(listing.state)")
							Text("-")
							Text("\(listing.city)")
						}
						.fontWeight(.semibold)
						Spacer()
						Ratings(listing: listing)
							.foregroundColor(.black)
							.padding(.horizontal)
					}
				}

			}
			.padding(.leading)
			.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
			
			Divider()

			//host info view
			HStack {
				VStack (alignment: .leading, spacing: 4){
					Text ("Entire \(listing.type.description) Hosted by \(listing.ownerName)")
						.font(.headline)
						.frame(width: 270, alignment: .leading)

					HStack (spacing: 2) {
						Text ("\(listing.numberOfGuests) Guests -")
						Text ("\(listing.numberOfBedrooms) Bedroom -")
						Text ("\(listing.numberOfBeds) Beds -")
						Text ("\(listing.numberOfBathrooms) Bath")
					}.font(.caption)
				}
				.frame(width: 300, alignment: .leading)
				Spacer()
				Image("\(listing.ownerImageUrl)")
					.resizable()
					.scaledToFill()
					.frame(width: 64, height:64)
					.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)


			}
			.padding()

			Divider()

			//listing features
			VStack (alignment: .leading, spacing: 16)
			{
				ForEach (listing.features) { feature in
					HStack (spacing: 12) {
						Image(systemName: feature.imageName)

						VStack(alignment: .leading)
						{
							Text (feature.title)
								.font(.footnote)
								.fontWeight(.semibold)

							Text (feature.subtitle)
								.font(.caption)
								.foregroundStyle(.gray)
						}
						Spacer()
					}
				}
			}
			.padding()

			Divider()
			//Bedrooms view
			VStack (alignment: .leading, spacing: 16)
			{
				Text ("Where youll sleep")
					.font(.headline)

				ScrollView (.horizontal, showsIndicators: false) {
					HStack(spacing: 16) {
						ForEach (1 ... listing.numberOfBedrooms, id: \.self){bedroom in
							VStack {
								Image(systemName: "bed.double")
								Text ("Bedroom \(bedroom)")
							}
							.frame(width: 132, height: 100)
							.overlay{
								RoundedRectangle(cornerRadius: 12)
									.stroke(lineWidth: 0.5)
									.foregroundStyle(.gray)

							}
						}
					}

				}
				.scrollTargetBehavior(.paging)

			}
			.padding()

			Divider()
			//Listing amenities
			VStack (alignment: .leading, spacing: 16)
			{
				Text("What this place offers")
					.font(.headline)
				ForEach ( listing.amenities){ amenity in
					HStack {
						Image(systemName: amenity.imageName )
							.frame(width: 32)
						Text(amenity.title )
							.font(.footnote)

						Spacer()

					}
				}
			}
			.padding()

			Divider()

			VStack(alignment: .leading, spacing: 16)
			{
				Text("where you'll be")
					.font(.headline)

				Map(position: $cameraPosition)
					.frame(height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 15))

			}
			.padding()
		}
		.toolbar(.hidden, for: .tabBar)
		.ignoresSafeArea()
		.padding(.bottom, 90)
		.overlay(alignment: .bottom)
		{
			VStack
			{
				Divider()
					.padding(.bottom)

				HStack
				{
					VStack (alignment: .leading){
						Text("Total before taxes")
							.font(.footnote)
							.foregroundStyle(.gray)
						Text("\(listing.pricePerNight)-Rupees")
						Text("Per night")
							.font(.subheadline)
							.fontWeight(.semibold)

					}
					Spacer()

					Button {

					} label: {
						Text ("Book Now")
							.foregroundStyle(.white)
							.font(.subheadline)
							.fontWeight(.semibold)
							.frame(width: 140, height: 40)
							.background(.pink)
							.clipShape(RoundedRectangle(cornerRadius: 8))
					}
				}
				.padding(.horizontal, 32)
			}
			.background(.white)
		}
	}
}

#Preview {
	ListingDetailView(listing: DeveloperPreview.shared.listings[1])
}
