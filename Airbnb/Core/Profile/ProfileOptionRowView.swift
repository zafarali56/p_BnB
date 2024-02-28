//
//  ProfileOptionRowView.swift
//  Airbnb
//
//  Created by Zafar Ali on 28/02/2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
	var imageName: String
	var title: String
    var body: some View {
		VStack{
			HStack{
				Image(systemName: imageName)
				Text(title)
					.font(.subheadline)

				Spacer()
				Image (systemName: "chevron.right")
			}
			Divider()
		}
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
