import Foundation

class RecipesViewModel {
    
    var onSnapshotUpdate: (() -> Void)?
    
    private let state: RecipeStateProtocol
    init(_ state: RecipeStateProtocol) {
        self.state = state
    }
    
    func viewDidLoad() {
        state.fetchRecipes { [weak self] result in
            self?.onSnapshotUpdate?()
        }
    }
}
