@testable import fetchipes
import XCTest

final class recipesViewModelTests: XCTestCase {

    func testViewDidLoad() throws {
        let viewModel = RecipesViewModel(MockRecipeState())
        
        var didCallAPI: Bool = false
        viewModel.onSnapshotUpdate = {
            didCallAPI = true
        }
        
        viewModel.viewDidLoad()
        
        XCTAssert(didCallAPI)
    }
}
