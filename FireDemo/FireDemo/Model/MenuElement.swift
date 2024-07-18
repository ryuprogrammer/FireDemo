import Foundation

struct MenuElement: Hashable {
    let menuType: MenuType
    let name: String
    let image: String
    let isContainFlavor: Bool
    let sizePrice: [SizePrice]
    let info: String
}

struct SizePrice: Hashable {
    let size: String
    let price: Int
}
