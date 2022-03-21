
//  42Race
//
//  Created by Phuoc on 3/15/22.
//


import Foundation
import Moya
import Alamofire

enum RequestService {
    case getCallList
    case getBuyList
}

extension RequestService: TargetType {

    var baseURL: URL {
        switch self {
        default:
            return URL(string: APIConstant.BASE_URL)!
        }
    }
    
    var path: String {
        switch self {
        case .getCallList:
            return APIConstant.getCallList
        case .getBuyList:
            return APIConstant.getBuyList
        }
      
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }

    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
}



