import Foundation

let menuData: [MenuElement] = [
    MenuElement(
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
        name: "ハンバーグ弁当",
        image: "menu2",
        isContainFlavor: true,
        sizePrice: [
            SizePrice(size: "ハンバーグ2個", price: 1030),
            SizePrice(size: "ラージ", price: 1380)
        ],
        info: "ラージは、ハンバーグ3個・ご飯大盛\nまたはハンバーグ2個・ミニカレースープ・ご飯大盛"
    )
]
