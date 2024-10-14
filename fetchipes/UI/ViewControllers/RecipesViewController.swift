import UIKit

class RecipesViewController: UIViewController {

    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
    private(set) lazy var layout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [unowned self] sectionIndex, _ in
            let sectionItem = self.dataSource.snapshot().sectionIdentifiers[sectionIndex]
            let layoutSection = self.layout(for: sectionItem)
            
            return layoutSection
        }
        
        return layout
    }()
    
    private(set) lazy var dataSource: UICollectionViewDiffableDataSource<RecipesViewModel.Section, RecipesViewModel.Item> = {
        let recipeReg = UICollectionView.CellRegistration<RecipeCell, RecipeCell.ViewModel> { [weak self] (cell, indexPath, viewModel) in
            cell.configure(viewModel)
        }
        
        let dataSource = UICollectionViewDiffableDataSource<RecipesViewModel.Section, RecipesViewModel.Item>(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case let .recipe(viewModel):
                return collectionView.dequeueConfiguredReusableCell(using: recipeReg, for: indexPath, item: viewModel)
            }
        }
        
        return dataSource
    }()
    
    private let viewModel: RecipesViewModel
    init() {
        self.viewModel = RecipesViewModel(RecipeState(APIProvider()))
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onSnapshotUpdate = { [weak self] snapshot in
            self?.dataSource.apply(snapshot)
        }
        
        viewModel.viewDidLoad()
    }


    //MARK: Private
    private func layout(for section: RecipesViewModel.Section) -> NSCollectionLayoutSection {
        switch section {
        case .region:
            let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

