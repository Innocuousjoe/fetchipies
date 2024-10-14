class RecipeState: RecipeStateProtocol {
    let api: APIProvider
    init(_ api: APIProvider) {
        self.api = api
    }
    
    func fetchRecipes(_ completion: @escaping ((Result<[RemoteRecipe], Error>) -> Void)) {
        api.request(.getRecipes) { result in
            switch result {
            case .success(let response):
                do {
                    let recipeList = try response.map(RemoteRecipeList.self)
                    completion(.success(recipeList.recipes))
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
