//
//  SettingsRowView.swift
//  Airbnb
//
//  Created by Zafar Ali on 04/03/2024.
//

import SwiftUI

struct SettingsRowView: View {
	let imageName: String
	let title: String
	let tintColor: Color
    
	var body: some View {
		HStack (spacing: 12)
		{
			Image(systemName: imageName)
				.imageScale(.small)
				.font(.title)
				.foregroundColor(tintColor)
			Text (title)
				.font(.subheadline)
				.foregroundStyle(.black)
		}

    }
}

#Preview {
	SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
