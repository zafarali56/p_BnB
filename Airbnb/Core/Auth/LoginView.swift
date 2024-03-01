//
//  LoginView.swift
//  Airbnb
//
//  Created by Zafar Ali on 01/03/2024.
//

import SwiftUI

struct LoginView: View {
	@State private var email = ""
	@State private var password = ""
	var body: some View {
		NavigationStack {
			VStack {
				//image
				Image("LoginImage")
					.resizable()
					.scaledToFill()
					.frame(width: 100, height: 60)
					.padding(.vertical, 32)
					.padding(.top, 200)


				//form field
				VStack (spacing: 24) {
					InputView(text: $email, title: "Email address", placeHolder: "name@expample.com")
						.autocapitalization(.none)

					InputView(text: $password, title: "Password", placeHolder: " Enter your password", IsSecureField: true)
				}
				.padding(.horizontal, 100)


				Button {
					print("log user in")
				} label: {
					HStack {
						Text ("SIGN IN")
							.fontWeight(.semibold)
						Image(systemName: "arrow.right")
					}
					.frame(width: UIScreen.main.bounds.width - 150, height: 50)
				}
				.foregroundColor(.white)
				.background(Color(.systemRed))
				.clipShape(RoundedRectangle(cornerRadius: 50))

				Spacer()
				
			}
		}
	}
}

#Preview {
	LoginView()
}
