@testable import fetchipes
import Foundation

class MockRecipeState: RecipeStateProtocol {
    func fetchRecipes(_ completion: @escaping ((Result<[RemoteRecipe], Error>) -> Void)) {
        let recipes: [RemoteRecipe] = [
            .init(cuisine: "British", 
                  name: "Shepherd's Pie",
                  urlLarge: "https://some-large-url.org",
                  urlSmall: "https://some-small-url.org",
                  urlYouTube: "https://some-youtube-url.com"
                 ),
            .init(cuisine: "French",
                  name: "Croissants",
                  urlLarge: "https://some-large-url.org",
                  urlSmall: "https://some-small-url.org",
                  urlYouTube: "https://some-youtube-url.com"
                 ),
            .init(cuisine: "American (new)",
                  name: "Hamburger",
                  urlLarge: "https://some-large-url.org",
                  urlSmall: "https://some-small-url.org",
                  urlYouTube: "https://some-youtube-url.com"
                 )
        ]
        
        completion(.success(recipes))
    }
}
