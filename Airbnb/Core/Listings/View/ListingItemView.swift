//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Zafar Ali on 26/02/2024.
//

import SwiftUI

struct ListingItemView: View {
	var body: some View {
		VStack (spacing: 7){
			//Images
			ListingImageCarouselView()
				.frame(height: 280)
				.clipShape(RoundedRectangle(cornerRadius: 15))
			//listing details
			
			HStack(alignment: .top){
				//Details
				VStack(alignment: .leading) {
					Text("Karachi, Pakistan")
						.fontWeight(.semibold)
						.foregroundStyle(.black)
					Text("12 Miles away")
						.foregroundStyle(.gray)
					Text("Nov 3 - 10")
						.foregroundStyle(.gray)
					HStack (spacing: 4){
						Text ("567")
							.fontWeight(.semibold)
						Text ("Per Night")
					}
					.foregroundStyle(.black)
				}
				Spacer()
				//Ratings
				
				Ratings()
					.font(.footnote)
				
				
			}
			
		}
	}
}

#Preview {
    ListingItemView()
}
