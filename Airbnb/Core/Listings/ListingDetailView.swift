//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

struct ListingDetailView: View {
	var body: some View {
		ScrollView {
			ListingImageCarouselView()
				.frame(height: 320)

			VStack (alignment: .leading, spacing: 8){
				Text ("Karachi Pakistan")
					.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
					.fontWeight(.semibold)

				VStack (alignment: .leading)
				{
					HStack (spacing: 2) {
						Ratings()
						Text (" - ")
						Text("28 reviews")
							.underline()
							.fontWeight(.semibold)

					}
					.foregroundColor(.black)

					Text("Karachi Pakistan")
				}
				.font(.caption)

			}
			.padding(.leading)
			.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
			
			Divider()

			//host info view
			HStack {
				VStack (alignment: .leading, spacing: 4){
					Text ("Hosted by Zafar ali")
						.font(.headline)
						.frame(width: 270, alignment: .leading)

					HStack (spacing: 2) {
						Text ("4 guests -")
						Text ("4 Bedroom -")
						Text ("4 Beds -")
						Text ("3 Bath")
					}.font(.caption)
				}
				.frame(width: 300, alignment: .leading)
				Spacer()
				Image("hostFrame")
					.resizable()
					.scaledToFill()
					.frame(width: 64, height:64)
					.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)


			}
			.padding()

			Divider()

			//listing features
			VStack (alignment: .leading, spacing: 16) {
				ForEach (0 ..< 2) { feature in
					HStack (spacing: 12) {
						Image(systemName: "medal")

						VStack(alignment: .leading)
						{
							Text ("superhost")
								.font(.footnote)
								.fontWeight(.semibold)

							Text ("Super host are experienced, higly rated host who are commited to providing great star for guests")
								.font(.caption)
								.foregroundStyle(.gray)
						}
						Spacer()
					}
				}
			}
			.padding()

		}
	}
}

#Preview {
	ListingDetailView()
}
