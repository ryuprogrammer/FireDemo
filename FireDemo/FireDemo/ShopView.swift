import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationStack {
            VStack {
                if let urlString = URL(string: "https://firesaurus.thebase.in/") {
                    WebView(url: urlString)
                }
            }
            .navigationBarTitle("ショップ", displayMode: .inline)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ShopView()
}
