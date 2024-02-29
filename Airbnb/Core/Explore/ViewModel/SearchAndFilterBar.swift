//
//  SearchAndFilterBar.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")

			VStack (alignment: .leading) {
				Text ("Where to?")
					.font(.footnote)
					.fontWeight(.semibold)


				Text ("Anywhere - Any week - Any guests")
					.font(.caption2).foregroundStyle(.gray)


			}
			Spacer()

			Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
				Image(systemName: "line.3.horizontal.decrease.circle")
					.foregroundStyle(.black)
			})
		}
		.padding(.horizontal)
		.padding(.vertical, 10)
		.overlay {
			Capsule()
			.stroke(lineWidth: 0.5)
			.foregroundStyle(Color(.systemGray4))
			.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.4), radius: 2)
		}
		.padding()

    }
}

#Preview {
    SearchAndFilterBar()
}
