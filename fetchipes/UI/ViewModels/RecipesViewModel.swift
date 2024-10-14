import UIKit
import Foundation

class RecipesViewModel {
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    enum Section: Hashable {
        case region
    }
    
    enum Item: Hashable {
        case recipe(RecipeCell.ViewModel)
    }
    
    var onSnapshotUpdate: ((_ snapshot: Snapshot) -> Void)?
    private var recipes: [RemoteRecipe] = [] {
        didSet {
            updateSnapshot()
        }
    }
    private let state: RecipeStateProtocol
    init(_ state: RecipeStateProtocol) {
        self.state = state
    }
    
    func viewDidLoad() {
        state.fetchRecipes { [weak self] result in
            switch result {
            case let .success(recipes):
                self?.recipes = recipes
            case let .failure(error):
                print(error)
            }
        }
    }
    
    //MARK: Private
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.region])
        snapshot.appendItems(recipes.map { .recipe(.init($0)) })
        
        onSnapshotUpdate?(snapshot)
    }
}
