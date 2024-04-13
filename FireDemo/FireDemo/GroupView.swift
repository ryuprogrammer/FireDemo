import SwiftUI

struct GroupView: View {
    // タブの選択項目を保持する
    @State var selection: ViewSection = .stampView
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "backColor")
        
        // タブ選択時のテキスト設定
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(.red), .font: UIFont.systemFont(ofSize: 10, weight: .bold)]
        // タブ選択時のアイコン設定
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .red
        
        // タブ非選択時のテキスト設定
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(.black.opacity(0.7)), .font: UIFont.systemFont(ofSize: 10, weight: .medium)]
        // タブ非選択時のアイコン設定
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(.black.opacity(0.7))
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
          UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        UITabBar.appearance().barTintColor = .green
    }
    
    enum ViewSection: String {
        case stampView = "スタンプ"
        case menuView = "メニュー"
        case informationView = "出店情報"
        case homeView = "ホーム"
    }
    
    var body: some View {
        TabView(selection: $selection) {
            StampView()
                .tabItem {
                    VStack {
                        Image(systemName: "flame")
                            .environment(\.symbolVariants, selection == .stampView ? .fill : .none)
                        Text(ViewSection.stampView.rawValue)
                    }
                }
                .tag(ViewSection.stampView)
            
            MenuView()
                .tabItem {
                    VStack {
                        Image(systemName: "fork.knife")
                            .environment(\.symbolVariants, selection == .menuView ? .fill : .none)
                        Text(ViewSection.menuView.rawValue)
                    }
                }
                .tag(ViewSection.menuView)
            
            InformationView()
                .tabItem {
                    VStack {
                        Image(systemName: "truck.box")
                            .environment(\.symbolVariants, selection == .informationView ? .fill : .none)
                        Text(ViewSection.informationView.rawValue)
                    }
                }
                .tag(ViewSection.informationView)
            
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selection == .homeView ? .fill : .none)
                        Text(ViewSection.homeView.rawValue)
                    }
                }
                .tag(ViewSection.homeView)
        }
    }
}

#Preview {
    GroupView()
}
