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
	@EnvironmentObject var viewModel: AuthViewModel
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
					Task{
						try await viewModel.signIn(withEmail: email, password: password)
					}

				} label: {
					HStack {
						Text ("Log in")
							.fontWeight(.semibold)
						Image(systemName: "arrow.right")
					}
					.frame(width: UIScreen.main.bounds.width - 160, height: 55 )
				}
				.foregroundColor(.white)
				.background(Color(.pink))
				.disabled(!formIsValid)
				.opacity(formIsValid ? 1.0 : 0.5)
				.clipShape(RoundedRectangle(cornerRadius: 50))
				.padding(.vertical, 10)

				Spacer()

				NavigationLink {
					SignUp()
				} label: {
					HStack (spacing:2) {
						Text("Don't have an account?")
						Text("Sign up")
							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
					}
					.font(.system(size:14))

				}
			}
		}
	}
}
//Mark _Form validations
extension LoginView: AuthenticationFormProtocol {
	var formIsValid: Bool {
		return !email.isEmpty
		&& email.contains("@")
		&& password.count > 5
	}
}
#Preview {
	LoginView()
}
