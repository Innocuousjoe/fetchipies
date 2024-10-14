@testable import fetchipes
import XCTest

final class recipesViewModelTests: XCTestCase {

    func testViewDidLoad() throws {
        let viewModel = RecipesViewModel(MockRecipeState())
        
        var didCallAPI: Bool = false
        viewModel.onSnapshotUpdate = { snapshot in
            XCTAssert(snapshot.sectionIdentifiers.count == 1)
            didCallAPI = true
        }
        
        viewModel.viewDidLoad()
        
        XCTAssert(didCallAPI)
    }
}
