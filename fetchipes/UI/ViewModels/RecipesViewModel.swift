import Foundation

class RecipesViewModel {
    
    enum Section: Hashable {
        case region
    }
    
    enum Item: Hashable {
        case recipe(RecipeCell.ViewModel)
    }
    
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
