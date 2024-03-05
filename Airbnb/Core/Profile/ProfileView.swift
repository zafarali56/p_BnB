//
//  ProfileView.swift
//  Airbnb
//
//  Created by Zafar Ali on 28/02/2024.
//

import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = AuthViewModel()
	var body: some View {
		Group {
			NavigationStack {
				if viewModel.userSession != nil {
					VStack {
						//profile login View
						List {
							Section {
								HStack {
									Text(User.MOCK_USER.initials)
										.font(.title)
										.fontWeight(.semibold)
										.foregroundStyle(.white)
										.frame(width: 72, height: 72)
										.background(Color(.systemGray3))
										.clipShape(Circle())

									VStack (alignment: .leading, spacing: 4) {
										Text (User.MOCK_USER.fullName)
											.font(.subheadline)
											.fontWeight(.semibold)
											.padding(.top, 4)

										Text(User.MOCK_USER.email )
											.font(.footnote)
											.foregroundStyle(.gray)
									}
								}
							}
							.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
							Section ("general"){
								HStack {
									SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.pink))
									Spacer()
									Text("1.0.0")
										.font(.subheadline)
										.foregroundStyle(Color(.systemGray))
								}
							}

							Section ("Account")
							{
								Button {
									print("Log out")
								} label: {
									SettingsRowView(imageName: "arrow.left.circle.fill", title: "Log out", tintColor: .pink)
								}

								Button {
									print("Delete account")
								} label: {
									SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
								}
							}
						}
						.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
					}
					.padding()
				}
				else {
					LoginView()
				}
			}
		}
	}
}

#Preview {
	ProfileView()
}
