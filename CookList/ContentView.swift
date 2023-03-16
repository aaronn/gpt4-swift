import SwiftUI

struct ContentView: View {
    let cookingDate = Date()
    @State private var completionStatus: [UUID: Bool] = [:]
    
    var body: some View {
        TabView {
            ForEach(sampleRecipes.indices) { index in
                let recipeCookingDate = Calendar.current.date(byAdding: .day, value: index, to: cookingDate)!
                RecipeView(recipe: sampleRecipes[index], cookingDate: recipeCookingDate, isCompleted: completionStatusBinding(for: sampleRecipes[index].id))
                    .tabItem {
                        Label(
                            shortTitle(recipeName: sampleRecipes[index].name),
                            systemImage: completionStatus[sampleRecipes[index].id] == true ? "checkmark.circle.fill" : "book"
                        )
                    }
            }
        }
    }
    
    func completionStatusBinding(for id: UUID) -> Binding<Bool> {
        return .init(
            get: { completionStatus[id] ?? false },
            set: { completionStatus[id] = $0 }
        )
    }
    
    func shortTitle(recipeName: String) -> String {
        return recipeName
            .replacingOccurrences(of: "all'", with: "")
            .replacingOccurrences(of: "Spaghetti ", with: "")
            .replacingOccurrences(of: "Penne ", with: "")
    }
}


