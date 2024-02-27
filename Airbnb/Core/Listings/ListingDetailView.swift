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
	var body: some View {
		ScrollView {
			ZStack (alignment: .topLeading) {
				ListingImageCarouselView()
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
			VStack (alignment: .leading, spacing: 16)
			{
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

			Divider()
			//Bedrooms view
			VStack (alignment: .leading, spacing: 16)
			{
				Text ("Where youll sleep")
					.font(.headline)

				ScrollView (.horizontal, showsIndicators: false) {
					HStack(spacing: 16) {
						ForEach (1 ..< 5 ){bedroom in
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
				ForEach ( 0 ..< 5){ feature in
					HStack {
						Image(systemName: "wifi")
							.frame(width: 32)
						Text("wifi")
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

				Map()
					.frame(height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 15))

			}
			.padding()
		}
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
						Text("3000 Rupee")
							.font(.subheadline)
							.fontWeight(.semibold)

						Text("Total before taxes")
							.font(.footnote)

						Text("27-Feb-2024")


					}
					Spacer()

					Button {

					} label: {
						Text ("Reserve")
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
	ListingDetailView()
}
