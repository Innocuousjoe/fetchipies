import Foundation
import Moya

typealias APIProvider = MoyaProvider<API>

enum API {
    case getRecipes
}

extension API: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        switch self {
        case .getRecipes:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net")!
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes:
            return "recipes.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRecipes:
            return .requestPlain
        }
    }
}
