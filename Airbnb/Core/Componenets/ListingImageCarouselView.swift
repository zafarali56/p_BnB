//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

var images = [
		"listing-1",
		"listing-2",
		"listing-3",
		"listing-4",

	]

struct ListingImageCarouselView: View {
    var body: some View {
		TabView{
			ForEach (images , id: \.self){ image in
				Image(image)
					.resizable()
					.scaledToFill()


			}

		}

		.tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
