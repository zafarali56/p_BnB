//
//  InputView.swift
//  Airbnb
//
//  Created by Zafar Ali on 01/03/2024.
//

import SwiftUI

struct InputView: View {
	@Binding var text: String
	let title: String
	let placeHolder: String
	var IsSecureField = false
    var body: some View {
		VStack (alignment: .leading, spacing: 12) {
			Text (title)
				.foregroundStyle(Color(.gray))
				.fontWeight(.semibold)
				.font(.footnote)
			if IsSecureField {
				SecureField(placeHolder, text: $text)
					.font(.system(size: 14))
			} else {
				TextField(placeHolder, text: $text)
					.font(.system(size: 14))
			}
			Divider()

		}
    }
}

#Preview {
	InputView(text: .constant(""), title: "", placeHolder: "Email", IsSecureField: true)
}
