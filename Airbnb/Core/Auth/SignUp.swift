//
//  SignUp.swift
//  Airbnb
//
//  Created by Zafar Ali on 02/03/2024.
//

import SwiftUI

struct SignUp: View {
	@State private var email = ""
	@State private var fullName = ""
	@State private var password = ""
	@State private var confirmPassword = ""
	@Environment (\.dismiss) var dismiss
	var body: some View {
		VStack {
			//image
			Image("LoginImage")
				.resizable()
				.scaledToFill()
				.frame(width: 0, height: 75)
				.padding(.vertical, 50)
				.padding(.top, 100)

			VStack (spacing: 20) {
				InputView(text: $fullName, title: "", placeHolder: "Email")
					.autocapitalization(.none)
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)

				InputView(text: $email, title: "", placeHolder: "Full lame")
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)

				InputView(text: $password, title: "", placeHolder: "Password")
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)
				InputView(text: $confirmPassword, title: "", placeHolder: "Confirm password")
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)
			}
			.padding(.horizontal, 80)

			Button {
				print("Sign user up")
			} label: {
				HStack {
					Text ("Sign up")
						.fontWeight(.semibold)
					Image(systemName: "arrow.right")
				}
				.frame(width: UIScreen.main.bounds.width - 160, height: 55 )
			}
			.foregroundColor(.white)
			.background(Color(.pink))
			.clipShape(RoundedRectangle(cornerRadius: 50))
			.padding(.vertical, 10)

			Spacer()

			Button {
				dismiss()
			} label: {
				HStack (spacing:3) {
					Text("Already a user?")
					Text("Log in")
						.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
				}
				.font(.system(size:14))

			}

		}
	}
}

#Preview {
	SignUp()
}
