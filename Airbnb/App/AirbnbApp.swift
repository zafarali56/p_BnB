import SwiftUI
import Firebase

@main
struct AirbnbApp: App {
	@StateObject var viewModel = AuthViewModel()

	init() {
		FirebaseApp.configure()

		// Only enable the App Check debug provider in debug builds
		#if DEBUG
		let providerFactory = AppCheckDebugProviderFactory()
		AppCheck.setAppCheckProviderFactory(providerFactory)
		#endif
	}

	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(viewModel)
		}
	}
}
