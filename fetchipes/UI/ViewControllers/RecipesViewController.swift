import UIKit

class RecipesViewController: UIViewController {

    private let viewModel: RecipesViewModel
    init() {
        self.viewModel = RecipesViewModel(RecipeState(APIProvider()))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        viewModel.viewDidLoad()
    }


}

