//
//  LoginModel.swift
//  test
//
//  Created by HossamHelmy on 24/02/2022.
//


import Foundation

 //MARK: - LoginModel
//struct LoginModel: Codable {
//    let type: String
//    let data: MyDataClassLogin
//
//    init(json: JSON) {
//        type = json["type"].stringValue
//        data = MyDataClassLogin(json: json["data"])
//    }
//}
//
//struct MyDataClassLogin: Codable {
//    let id: String
//    let name, address, latitude, longitude: String
//    let statusLocation: Int
//    let avatar: String
//    let statusImage: Int
//    let email, phone, apiToken, notes: String
//    let review: Int
//    let role: String
//    let ban, verified: Int
//    let activationKey: String
//    let notificationsKey: String
//    let deviceToken: String
//    let badge: Int
//    let language: String
//    let provider, providerID: String
//    let isSocial, totalOrders, totalLastMissions, totalInProgress: Int
//    let cvPath, idPath: String
//    let userCountry, countryID, userCountryID, userCity: String
//    let userArea, userCurrency: String
//    let userAddress: UserAddress
//
//    init(json: JSON) {
//
//        id = json["id"].stringValue
//        name = json["name"].stringValue
//        address = json["address"].stringValue
//        latitude = json["latitude"].stringValue
//        longitude = json["longitude"].stringValue
//        statusLocation = json["status_location"].intValue
//        avatar = json["avatar"].stringValue.encode()
//        statusImage = json["status_image"].intValue
//        email = json["email"].stringValue
//        phone = json["phone"].stringValue
//        apiToken = json["api_token"].stringValue
//        notes = json["notes"].stringValue
//        review = json["review"].intValue
//        role = json["role"].stringValue
//        ban = json["ban"].intValue
//        verified = json["verified"].intValue
//        activationKey = json["activation_key"].stringValue
//        notificationsKey = json["notifications_key"].stringValue
//        deviceToken = json["device_token"].stringValue
//        badge = json["badge"].intValue
//        language = json["language"].stringValue
//        provider = json["provider"].stringValue
//        providerID = json["provider_id"].stringValue
//        isSocial = json["is_social"].intValue
//        totalOrders = json["total_orders"].intValue
//        totalLastMissions = json["total_last_missions"].intValue
//        totalInProgress = json["total_in_progress"].intValue
//        cvPath = json["cv_path"].stringValue
//        idPath = json["id_path"].stringValue
//        userCountry = json["user_country"].stringValue
//        countryID = json["country_id"].stringValue
//        userCountryID = json["user_country_id"].stringValue
//        userCity = json["user_city"].stringValue
//        userArea = json["user_area"].stringValue
//        userCurrency = json["user_currency"].stringValue
////        userAddress =   json["user_address"].arrayValue.map {UserAddress.init(json: $0)}
//        userAddress = UserAddress(json: json["userAddress"])
//    }
//}
//
//// MARK: - UserAddress
//struct UserAddress: Codable {
//    let country, city, currency, area: String
//    let cityID: String
//
//    init(json: JSON) {
//        country = json["country"].stringValue
//        city = json["city"].stringValue
//        currency = json["currency"].stringValue
//        area = json["area"].stringValue
//        cityID = json["city_id"].stringValue
//    }
//}

//// MARK: - LoginModel
struct LoginModel: Codable {
    let type: String
   // let data: MyDataClassLogin
}
// MARK: - DataClass
struct MyDataClassLogin: Codable {
//    let id: Int
//    let name, address, latitude, longitude: String
//    let statusLocation: Int
//    let avatar: String
//    let statusImage: Int
//    let email, phone, apiToken, notes: String
    let apiToken: String?
//    let review: Int
//    let role: String
//    let ban, verified, activationKey: Int
//    let notificationsKey: String
//    let deviceToken: JSONNull?
//    let badge: Int
//    let language: String
//    let provider, providerID: JSONNull?
//    let isSocial, totalOrders, totalLastMissions, totalInProgress: Int
//    let cvPath, idPath: JSONNull?
//    let userCountry, countryID, userCountryID, userCity: String
//    let userArea, userCurrency: String
//    let userAddress: UserAddress

    enum CodingKeys: String, CodingKey {
//        case id, name, address, latitude, longitude
//        case statusLocation = "status_location"
//        case avatar
//        case statusImage = "status_image"
//        case email, phone
        case apiToken = "api_token"
//        case notes, review, role, ban, verified
//        case activationKey = "activation_key"
//        case notificationsKey = "notifications_key"
//        case deviceToken = "device_token"
//        case badge, language, provider
//        case providerID = "provider_id"
//        case isSocial = "is_social"
//        case totalOrders = "total_orders"
//        case totalLastMissions = "total_last_missions"
//        case totalInProgress = "total_in_progress"
//        case cvPath = "cv_path"
//        case idPath = "id_path"
//        case userCountry = "user_country"
//        case countryID = "country_id"
//        case userCountryID = "user_country_id"
//        case userCity = "user_city"
//        case userArea = "user_area"
//        case userCurrency = "user_currency"
//        case userAddress = "user_address"
    }
}
// MARK: - UserAddress
struct UserAddress: Codable {
    let country, city, currency, area: String
    let cityID: String
    enum CodingKeys: String, CodingKey {
        case country, city, currency, area
        case cityID = "city_id"
    }
}
// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    public var hashValue: Int {
        return 0
    }
    public init() {}
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



