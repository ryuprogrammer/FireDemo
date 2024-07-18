import Foundation

let menuData: [MenuElement] = [
    MenuElement(
        menuType: .curry,
        name: "チキンカレー",
        image: "menu0",
        isContainFlavor: true,
        sizePrice: [
            SizePrice(size: "スタンダード", price: 880),
            SizePrice(size: "スモール", price: 830),
            SizePrice(size: "ラージ", price: 980),
            SizePrice(size: "1キロカレー", price: 1460)
        ],
        info: "さらさらカレー"
    ),
    MenuElement(
        menuType: .curry,
        name: "ビーフカレー",
        image: "menu1",
        isContainFlavor: true,
        sizePrice: [
            SizePrice(size: "スタンダード", price: 1150),
            SizePrice(size: "スモール", price: 1100),
            SizePrice(size: "ラージ", price: 1250),
            SizePrice(size: "1キロカレー", price: 1900)
        ],
        info: "さらさらカレー"
    ),
    MenuElement(
        menuType: .lunchBox,
        name: "ハンバーグ弁当",
        image: "menu2",
        isContainFlavor: false,
        sizePrice: [
            SizePrice(size: "ハンバーグ2個", price: 1030),
            SizePrice(size: "ラージ", price: 1380)
        ],
        info: "ラージは、ハンバーグ3個・ご飯大盛、またはハンバーグ2個・ミニカレースープ・ご飯大盛"
    ),
    MenuElement(
        menuType: .sideDish,
        name: "ファイヤーチキンスティック",
        image: "menu2",
        isContainFlavor: false,
        sizePrice: [
            SizePrice(size: "1本", price: 180),
            SizePrice(size: "5本", price: 900),
            SizePrice(size: "10本", price: 1700)
        ],
        info: "オリジナルペーストに漬け込み、低温熟成させたピリッとスパイシーな当店オリジナル料理"
    ),
    MenuElement(
        menuType: .topping,
        name: "煮卵",
        image: "menu2",
        isContainFlavor: false,
        sizePrice: [
            SizePrice(size: "1本", price: 180),
            SizePrice(size: "5本", price: 900),
            SizePrice(size: "10本", price: 1700)
        ],
        info: "オリジナルペーストに漬け込み、低温熟成させたピリッとスパイシーな当店オリジナル料理"
    ),
]
