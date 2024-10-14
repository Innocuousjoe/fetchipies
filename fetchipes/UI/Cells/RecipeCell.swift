import UIKit
import SnapKit

class RecipeCell: UICollectionViewCell {
    struct ViewModel: Hashable {
        var name: String {
            recipe.name
        }
        private let recipe: RemoteRecipe
        
        init(_ recipe: RemoteRecipe) {
            self.recipe = recipe
        }
    }
    
    private(set) lazy var nameLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ viewModel: ViewModel) {
        nameLabel.text = viewModel.name
    }
}
