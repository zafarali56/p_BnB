//
//  WishlistView.swift
//  Airbnb
//
//  Created by Zafar Ali on 28/02/2024.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
		NavigationStack {
			VStack (alignment:.leading, spacing: 32){
				VStack (alignment: .leading, spacing: 4){
					Text("Log in to view your wishlist")
						.font(.headline)

					Text ("You can create and edit wishlist once you've logged in")
						.font(.footnote)

				}
				Button{
					print("Log in")

				}label: {
					Text("Log in")
						.foregroundStyle(.white)
						.font(.subheadline)
						.fontWeight(.semibold)
						.frame(width: 360, height: 48)
						.background(.pink)
						.clipShape(RoundedRectangle(cornerRadius: 50))
				}
				Spacer()
			}
			.padding()
			.navigationTitle("Wishlists")

		}

    }
}

#Preview {
    WishlistView()
}
