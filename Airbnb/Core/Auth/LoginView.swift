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
					.frame(width: 0, height: 75)
					.padding(.vertical, 50)
					.padding(.top, 100)



				//form field
				VStack (spacing: 20) {
					InputView(text: $email, title: "", placeHolder: "Email")
						.autocapitalization(.none)
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

				}
				.padding(.horizontal, 80)


				Button {
					print("log user in")
				} label: {
					HStack {
						Text ("SIGN IN")
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
				
			}
		}
	}
}

#Preview {
	LoginView()
}
