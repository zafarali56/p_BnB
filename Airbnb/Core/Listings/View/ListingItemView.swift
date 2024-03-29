//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Zafar Ali on 26/02/2024.
//

import SwiftUI

struct ListingItemView: View {
	let listing: Listing
	var body: some View {
		VStack (spacing: 7){
			//Images
			ListingImageCarouselView(listing: listing)
				.frame(height: 280)
				.clipShape(RoundedRectangle(cornerRadius: 15))
			//listing details

			HStack(alignment: .top){
				//Details
				VStack(alignment: .leading) {
					Text("\(listing.city), \(listing.state)")
						.fontWeight(.semibold)
						.foregroundStyle(.black)
					Text("9 Miles away")
						.foregroundStyle(.gray)
					Text("Dec-Oct")
						.foregroundStyle(.gray)
					HStack (spacing: 4){
						Text ("\(listing.pricePerNight)-Rupee")
							.fontWeight(.semibold)
						Text ("Per Night")
							.font(.callout)
					}
					.foregroundStyle(.black)
				}
				Spacer()
				//Ratings
				Ratings(listing: listing)
					.font(.footnote)


			}

		}
	}
}

#Preview {
	ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
