import Foundation

protocol RecipeStateProtocol {
    func fetchRecipes(_ completion: @escaping ((Swift.Result<[RemoteRecipe], Error>) -> Void))
}

