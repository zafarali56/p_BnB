//
//  AuthViewModel.swift
//  Airbnb
//
//  Created by Zafar Ali on 04/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
	var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
	@Published var userSession: FirebaseAuth.User?
	@Published var currentUser: User?

	init() {
		self.userSession = Auth.auth().currentUser
		Task {
			await fetchUser()
		}

	}

	func signIn(withEmail email: String, password: String) async throws {
		// Implement sign in functionality
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
			await fetchUser()
		}catch {
			print("DEBUG: Failed to log in ERROR:\(error.localizedDescription)")
		}
	}

	func createUser(withEmail email: String, password: String, fullName: String) async throws {
		// Validate email format
		guard isValidEmail(email) else {
			throw AuthError.invalidEmail
		}

		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			self.userSession = result.user
			let user = User(id: result.user.uid, fullName: fullName, email: email)
			let encodedUser = try Firestore.Encoder().encode(user)
			try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
			await fetchUser()
		} catch {
			// Handle error
			throw error
		}
	}
	func signOut() {
		do {
			try Auth.auth().signOut() //signout user from backend.
			self.userSession = nil //wipes out user sessions.
			self.currentUser = nil //wipes out current user data model.
		} catch {
			print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
		}
	}

	func deleteAccount() {
		// Implement account deletion functionality
	}

	func fetchUser() async {
		guard let uid = Auth.auth().currentUser?.uid else { return }

		do {
			let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
			if let data = try? snapshot.data(as: User.self) {
				self.currentUser = data
				print("DEBUG: Current user \(String(describing: self.currentUser))")
			}
		} catch {
			print("Failed to fetch user: \(error)")
		}
	}

	// Function to validate email format
	func isValidEmail(_ email: String) -> Bool {
		let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailPredicate.evaluate(with: email)
	}

	// Define custom error types for better handling
	enum AuthError: Error {
		case invalidEmail
	}
}
