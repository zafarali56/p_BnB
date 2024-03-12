import SwiftUI
struct SignUp: View {
	@State private var email = ""
	@State private var fullName = ""
	@State private var password = ""
	@State private var confirmPassword = ""
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var viewModel: AuthViewModel

	var body: some View {
		VStack {
			// Image
			Image("LoginImage")
				.resizable()
				.scaledToFill()
				.frame(width: 0, height: 75)
				.padding(.vertical, 50)
				.padding(.top, 100)

			VStack(spacing: 20) {
				InputView(text: $email, title: "Email address", placeHolder: "name@example.com")
					.autocapitalization(.none)
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)

				InputView(text: $fullName, title: "Full name", placeHolder: "Enter your name")
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)

				InputView(text: $password, title: "Password", placeHolder: "Enter your password")
					.padding(.horizontal, 20)
					.background(
						RoundedRectangle(cornerRadius: 50)
							.stroke(Color.gray, lineWidth: 1)
					)

				ZStack (alignment: .trailing){
					InputView(text: $confirmPassword, title: "Confirm password", placeHolder: "Confirm Your Password")
						.padding(.horizontal, 20)
						.background(
							RoundedRectangle(cornerRadius: 50)
								.stroke(Color.gray, lineWidth: 1)
						)
					if !password.isEmpty && !confirmPassword.isEmpty {
						if password == confirmPassword {
								Image(systemName: "checkmark.circle.fill")
								.imageScale(.large)
								.fontWeight(.bold)
								.foregroundStyle(Color(.systemGreen))
						} else {
							Image(systemName: "xmark.circle.fill")
							.imageScale(.large)
							.fontWeight(.bold)
							.foregroundStyle(Color(.systemRed))
						}
					}
				}
			}
			.padding(.horizontal, 80)

			Button {
				Task {
						do {
							try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
							await viewModel.fetchUser() // Fetch user data after creating user
						} catch {
							print("Failed to create user: \(error)")
						}
					}
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
			.disabled(!formIsValid)
			.opacity(formIsValid ? 1.0 : 0.5)
			.clipShape(RoundedRectangle(cornerRadius: 50))
			.padding(.vertical, 10)

			Spacer()

			Button {
				dismiss()
			} label: {
				HStack(spacing: 3) {
					Text("Already a user?")
					Text("Log in")
						.fontWeight(.bold)
				}
				.font(.system(size: 14))

			}
		}
	}
}

extension SignUp: AuthenticationFormProtocol {
	var formIsValid: Bool {
		return !email.isEmpty
		&& email.contains("@")
		&& password.count > 5
		&& confirmPassword == password
		&& !fullName.isEmpty

	}
}
#Preview {
	SignUp()
}
