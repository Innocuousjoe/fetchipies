import Foundation

struct RemoteRecipeList: Codable {
    let recipes: [RemoteRecipe]
}

struct RemoteRecipe: Codable, Hashable {
    let cuisine: String
    let name: String
    let urlLarge: String
    let urlSmall: String
    let urlYouTube: String?
    
    private enum CodingKeys: String, CodingKey {
        case cuisine,
             name,
             urlLarge = "photo_url_large",
             urlSmall = "photo_url_small",
             urlYouTube = "youtube_url"
    }
}
