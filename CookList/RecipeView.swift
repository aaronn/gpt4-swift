import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var cookingDate: Date
    @Binding var isCompleted: Bool
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Cooking on \(dateFormatter.string(from: cookingDate))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Steps")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(recipe.steps.indices, id: \.self) { index in
                        StepView(stepNumber: index + 1, step: recipe.steps[index])
                    }
                }
                .padding(.bottom)

                Button(action: {
                    if !isCompleted {
                        print("Done with \(recipe.name)!")
                        isCompleted.toggle()
                    }
                }) {
                    Text(isCompleted ? "Completed" : "Done")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCompleted ? Color.secondary : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(isCompleted)
                .padding(.top)
                .padding(.bottom, 24)
            }
            .padding(.horizontal, 24)
        }
    }
}



struct StepView: View {
    let stepNumber: Int
    let step: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\(stepNumber).")
                .font(.headline)
                .fontWeight(.bold)

            Text(step)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}







