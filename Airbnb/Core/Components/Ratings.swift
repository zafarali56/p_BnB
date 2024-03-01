//
//  Ratings.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

struct Ratings: View {
	let listing: Listing
    var body: some View {
		HStack(spacing: 2) {
			Image(systemName: "star.fill")
			Text(String(format: "%.1f", listing.rating))

		}
		.foregroundStyle(.black)
		.font(.footnote)
	}

}

#Preview {
    Ratings(listing: DeveloperPreview.shared.listings[0])
}
