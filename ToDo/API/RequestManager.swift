
//  42Race
//
//  Created by Phuoc on 3/15/22.
//


import Foundation
import Moya
import Alamofire
import ObjectMapper


let provider = MoyaProvider<RequestService>()

protocol RequestProtocol {
    func getCallList(completion: @escaping ([CallModel], Error?) -> Void)
    func getBuyList(completion: @escaping ([TradeModel], Error?) -> Void)
}

final class RequestManager: RequestProtocol {

    private init () {}
    // MARK: - Shared Instance
    static let shared: RequestManager = RequestManager()

    func getBuyList(completion: @escaping ([TradeModel], Error?) -> Void) {
        provider.request(.getBuyList) { result in
            do {
                switch result {
                case .success(let response):
                    let json = try response.mapJSON() 
                    print(String(describing: response.request))
                    print(String(describing: json))
                    guard let response = Mapper<TradeModel>().mapArray(JSONObject: json) else  {
                        completion([], nil)
                        return
                    }
                    completion(response, nil)
                case .failure(let error):
                    completion([], error)
                    print(error)
                }
            } catch let error {
                completion([], error)
                print(error)
            }
        }
    }

    func getCallList(completion: @escaping ([CallModel], Error?) -> Void) {
        provider.request(.getCallList) { result in
            do {
                switch result {
                case .success(let response):
                    let json = try response.mapJSON()
                    print(String(describing: response.request))
                    print(String(describing: json))
                    guard let response = Mapper<CallModel>().mapArray(JSONObject: json) else  {
                        completion([], nil)
                        return
                    }
                    completion(response, nil)
                case .failure(let error):
                    completion([], error)
                    print(error)
                }
            } catch let error {
                completion([], error)
                print(error)
            }
        }
    }
}


class ResponseError {
    static let invalidJSONFormat = NSError(domain: "", code: 600, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON Format"])
}

