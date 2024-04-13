import SwiftUI

struct StampView: View {
    
    @State private var stampCount: Int = 0
    @State private var isMaxStamp: Bool = false
    @State private var couponCount: Int = 3
    @State private var couponData: [String] = ["トッピング引換券", "トッピング引換券"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    Spacer()
                        .frame(height: 60)
                    Image("stamp\(stampCount)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: -5, y: -5)
                        .padding(.horizontal)
                        .padding(.top)
                        .rotation3DEffect(
                            // 回転の角度を isMaxStamp によって変更
                            Angle(degrees: isMaxStamp ? 360 : 0),
                            // 回転の軸を指定
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                        .onTapGesture {
                            withAnimation {
                                isMaxStamp.toggle()
                                if stampCount == 10 {
                                    stampCount = 0
                                    couponData.append("トッピング引換券")
                                }
                            }
                        }
                    
                    Text("1日1回、店頭で商品をご購入していただくと、1個スタンプが貯まります。スタンプが10個貯まるとクーポンを獲得できます！")
                        .font(.callout)
                        .foregroundStyle(Color.gray)
                        .padding()
                    
                    HStack {
                        Text("クーポン")
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ForEach(couponData, id: \.self) { data in
                        Text(data)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                    }
                }
                
                VStack {
                    AdvertisementView()
                    
                    Spacer()
                    
                    Button {
                        if stampCount < 10 {
                            stampCount += 1
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
