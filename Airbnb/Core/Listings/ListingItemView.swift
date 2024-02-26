//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Zafar Ali on 26/02/2024.
//

import SwiftUI

struct ListingItemView: View {
	var images = [
		"listing-1",
		"listing-2",
		"listing-3",
		"listing-4",

	]
    var body: some View {
		VStack (spacing: 7){
			//Images
			TabView{
				ForEach (images , id: \.self){ image in
					Image(image)
						.resizable()
						.scaledToFill()


				}

			}
			.frame(height: 300)
			.clipShape(RoundedRectangle(cornerRadius: 15))
			.tabViewStyle(.page)
			//listing details

			HStack(alignment: .top){
				//Details
				VStack(alignment: .leading) {
				Text("Karachi, Pakistan")
						.fontWeight(.semibold)
				Text("12 Miles away")
						.foregroundStyle(.gray)
				Text("Nov 3 - 10")
						.foregroundStyle(.gray)
					HStack (spacing: 4){
						Text ("567")
							.fontWeight(.semibold)
						Text ("Per Night")
					}
				}
				Spacer()
				//Ratings
				HStack(spacing: 2) {
					Image(systemName: "star.fill")
					Text("4.86")
				}
			}
			.font(.footnote)


		}
		
	}
}

#Preview {
    ListingItemView()
}
