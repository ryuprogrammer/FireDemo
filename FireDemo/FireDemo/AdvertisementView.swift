import SwiftUI

struct AdvertisementView: View {
    @State private var colors: [Color] = [.red, .orange] // グラデーションの色
    @State private var startPoint: UnitPoint = .topLeading // グラデーションの開始ポイント
    @State private var endPoint: UnitPoint = .bottomTrailing // グラデーションの終了ポイント

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .animation(.easeInOut(duration: 2).repeatForever(), value: colors)

            Text("スタッフ募集中！")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white) // テキストの色を白に変更
        }
        .onAppear {
            // リアルタイムでグラデーションの色を変更する
            withAnimation {
                colors = [.orange, .orange, .red]
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    colors = [.red, .orange, .orange]
                }
            }
        }
    }
}

struct AdvertisementView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementView()
    }
}
