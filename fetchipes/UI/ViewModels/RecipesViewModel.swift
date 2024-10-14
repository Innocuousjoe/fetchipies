import Foundation

class RecipesViewModel {
    
    private let state: RecipeStateProtocol
    init(_ state: RecipeStateProtocol) {
        self.state = state
    }
    
    func viewDidLoad() {
        state.fetchRecipes { result in
        }
    }
}
