//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

enum DestinationSearchOptions {
	case location
	case dates
	case guests
}

struct DestinationSearchView: View {
	@Binding var show : Bool
	@State private var destination = ""
	@State private var selectedOption: DestinationSearchOptions = .location

	var body: some View {
		VStack{
			Button {
				withAnimation(.smooth){
					show.toggle()
				}
			} label: {
				Image(systemName: "xmark.circle")
					.imageScale(.large)
					.foregroundStyle(.black)
			}
			VStack(alignment: .leading)
			{
				if selectedOption == .location
				{
					Text("where to?")
						.font(.title2)
						.fontWeight(.semibold)

					HStack {
						Image (systemName: "magnifyingglass")
							.imageScale(.small)

						TextField("Search destinations", text: $destination)
							.font(.subheadline)
					}
					.frame(height: 44)
					.padding(.horizontal)
					.overlay{
						(RoundedRectangle(cornerRadius: 8))
							.stroke(lineWidth: 1.0)
							.foregroundStyle(Color(.systemGray4))
					}
				}else {
					CollapsedPickerView(title: "Where", description: "Add Destination")
				}

			}
			.padding()
			.frame(height: selectedOption == .location ? 120: 64)
			.background(.white)
			.clipShape(RoundedRectangle(cornerRadius: 12))
			.padding()
			.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
			.onTapGesture {
				withAnimation(.smooth) {
					selectedOption = .location
				}
			}

			//Date selection view
			VStack {
				if selectedOption == .dates {
					HStack {
						Text ("Show expanded view")
						Spacer()
					}
				}else {
					CollapsedPickerView(title: "When", description: "Add Dates")
				}
			}
			.padding()
			.frame(height: selectedOption == .dates ? 120: 64)
			.background(.white)
			.clipShape(RoundedRectangle(cornerRadius: 12))
			.padding()
			.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
			.onTapGesture {
				withAnimation(.smooth) {
					selectedOption = .dates
				}
			}

			//Num guests view
			VStack {
				if selectedOption == .guests {
					HStack {
						Text ("Show expanded view")
						Spacer()
					}
				}else {
					CollapsedPickerView(title: "Who", description: "Add Guests")
				}
			}
			.padding()
			.frame(height: selectedOption == .guests ? 120: 64)
			.background(.white)
			.clipShape(RoundedRectangle(cornerRadius: 12))
			.padding()
			.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
			.onTapGesture {
				withAnimation(.smooth) {
					selectedOption = .guests
				}
			}

		}
	}
}

#Preview {
	DestinationSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
	let title: String
	let description: String

	var body: some View {
		VStack {
			HStack{
				Text (title)
					.foregroundStyle(.gray)
				Spacer()

				Text(description)
			}
			.fontWeight(.semibold)
			.font(.subheadline)
		}
	}
}
