class RecipeState: RecipeStateProtocol {
    func fetchRecipes(_ completion: @escaping ((Result<[RemoteRecipe], Error>) -> Void)) {
    }
}
