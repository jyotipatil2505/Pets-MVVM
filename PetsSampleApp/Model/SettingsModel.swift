//
//  SettingsModel.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 21/12/22.
//

import UIKit

/*"settings": {
    "workHours" : "M-F 9:00 - 18:00"
}*/

class SettingsModel: Codable {
    
    var workHours: String?
    
    init(dictionary: [String: Any]) {
        workHours = dictionary["workHours"] as? String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if let workingHours = workHours {
            dictionary["workHours"] = workingHours
        }
        return dictionary
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workHours = try container.decodeIfPresent(String.self, forKey: .workHours)
    }
    
    enum CodingKeys: CodingKey {
        case workHours
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.workHours, forKey: .workHours)
    }
}

