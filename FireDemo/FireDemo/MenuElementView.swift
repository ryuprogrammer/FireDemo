import SwiftUI

struct MenuElementView: View {
    let imageWidth = UIScreen.main.bounds.width / 2 - 30
    let menu: MenuElement
    let flavors: [String] = ["甘口", "中辛", "辛口"]
    var body: some View {
        HStack {
            Image(menu.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(menu.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                if menu.isContainFlavor {
                    HStack {
                        ForEach(flavors, id: \.self) { flavor in
                            Text(flavor)
                                .padding(5)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                
                ForEach(menu.sizePrice, id: \.self) { sizePrice in
                    HStack {
                        Text(sizePrice.size)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(sizePrice.price)円")
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    MenuElementView(menu: MenuElement(
        name: "チキンカレー",
        image: "menu0",
        isContainFlavor: true,
        sizePrice: [
            SizePrice(size: "スタンダード", price: 880),
            SizePrice(size: "スモール", price: 830),
            SizePrice(size: "ラージ", price: 980),
            SizePrice(size: "1キロカレー", price: 1460)
        ],
        info: "さらさらカレー")
    )
}
