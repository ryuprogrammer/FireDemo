import SwiftUI

struct MenuView: View {
    let imageWidth = UIScreen.main.bounds.width / 2
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(menuData, id: \.self) { memu in
                    MenuElementView(menu: memu)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("メニュー", displayMode: .inline)
        }
    }
}

#Preview {
    MenuView()
}
