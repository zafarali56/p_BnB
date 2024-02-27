//
//  Ratings.swift
//  Airbnb
//
//  Created by Zafar Ali on 27/02/2024.
//

import SwiftUI

struct Ratings: View {
    var body: some View {
		HStack(spacing: 2) {
			Image(systemName: "star.fill")
			Text("4.86")

		}
		.foregroundStyle(.black)
		.font(.footnote)
	}

}

#Preview {
    Ratings()
}
