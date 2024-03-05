//
//  AuthViewModel.swift
//  Airbnb
//
//  Created by Zafar Ali on 04/03/2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
	@Published var userSession: FirebaseAuth.User?
	@Published var currentUser: User?
	init() {
		self.userSession = Auth.auth().currentUser
	}

	func signIn(withEmail email: String, password: String) async throws
	{

	}

	func createUser (withEmail email: String, password: String, fullName:String) async throws
	{
		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			self.userSession = result.user 
			let user = User (id: result.user.uid, fullName: fullName, email: email)
			let encodedUser = try Firestore.Encoder().encode(user)
			try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
		} catch{
			print("DBUG: failed \(error.localizedDescription)")
		}
	}
	func signOut ()
	{

	}

	func deleteAccount ()
	{

	}

	func fetchUser() async {

	}
}
