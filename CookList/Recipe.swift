import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let ingredients: [String]
    let steps: [String]
}
