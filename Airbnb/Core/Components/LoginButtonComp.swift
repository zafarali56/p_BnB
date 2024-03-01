//
//  LoginButtonComp.swift
//  Airbnb
//
//  Created by Zafar Ali on 28/02/2024.
//

import SwiftUI

struct LoginButtonComp: View {
    var body: some View {
		Button{
			print("Log in")

		}label: {
			Text("Log in")
				.foregroundStyle(.white)
				.font(.subheadline)
				.fontWeight(.semibold)
				.frame(width: 360, height: 48)
				.background(.pink)
				.clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    LoginButtonComp()
}
