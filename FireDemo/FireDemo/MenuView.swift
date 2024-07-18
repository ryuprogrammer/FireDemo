import SwiftUI

struct MenuView: View {
    let imageWidth = UIScreen.main.bounds.width / 2
    @State private var showMenuType: MenuType = .all
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(MenuType.allCases, id: \.id) { menu in
                            if menu == showMenuType {
                                Text(menu.rawValue)
                                    .font(.title3)
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 6)
                                    .background(Color("mainColor"))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(5)
                                    .lineLimit(1)
                                    .fixedSize()
                            } else {
                                Text(menu.rawValue)
                                    .font(.title3)
                                    .foregroundStyle(Color("mainColor"))
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 6)
                                    .background {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color("mainColor"), lineWidth: 3)
                                    }
                                    .padding(5)
                                    .lineLimit(1)
                                    .fixedSize()
                                    .onTapGesture {
                                        withAnimation {
                                            showMenuType = menu
                                        }
                                    }
                            }
                        }
                    }
                    .padding([.top, .horizontal])
                }
                Divider()
                ForEach(menuData, id: \.self) { menu in
                    if showMenuType == .all {
                        MenuElementView(menu: menu)
                        Divider()
                    } else if menu.menuType == showMenuType {
                        MenuElementView(menu: menu)
                        Divider()
                    }
                }
            }
            .navigationBarTitle("メニュー", displayMode: .inline)
        }
    }
}

enum MenuType: String, CaseIterable {
    case all = "全て"
    case curry = "カレー"
    case lunchBox = "お弁当"
    case skewer = "串"
    case topping = "トッピング"
    case sideDish = "惣菜"
    
    var id: String { rawValue }
}

#Preview {
    MenuView()
}
