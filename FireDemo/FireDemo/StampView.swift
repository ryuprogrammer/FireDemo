import SwiftUI

struct StampView: View {
    
    @State private var stampCount: Int = 0
    @State private var isMaxStamp: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("メモ: ショップ→メニューで、下にショップ")
                        Text("ご来店回数100000回")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    HStack {
                        Text("スタンプカード")
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    Image("stamp\(stampCount)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .rotation3DEffect(
                            // 回転の角度を isMaxStamp によって変更
                            Angle(degrees: isMaxStamp ? 360 : 0),
                            // 回転の軸を指定
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                        .onTapGesture {
                            withAnimation {
                                isMaxStamp.toggle()
                                stampCount = 0
                            }
                        }
                    
                    HStack {
                        Text("クーポン")
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    Text("トッピング引換券")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    Text("100円引きクーポン")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        if stampCount < 10 {
                            stampCount += 1
                        } else {
                            stampCount = 0
                        }
                    } label: {
                        Text("スタンプをGETする")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.main)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding()
                    }
                }
            }
            .navigationBarTitle("スタンプ", displayMode: .inline)
        }
    }
}

#Preview {
    StampView()
}
