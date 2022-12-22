//
//  PetModel.swift
//  PetsSampleApp
//
//  Created by Jyoti Mitkar on 20/12/22.
//

class PetModel: Codable {
    
    var image: String?
    var title: String?
    var contentUrl: String?
    var dateAdded: String?
    
    init(dictionary: [String: Any]) {
        image = dictionary["image_url"] as? String
        title = dictionary["title"] as? String
        dateAdded = dictionary["date_added" ] as? String
        contentUrl = dictionary["content_url" ] as? String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if let imageUrl = image {
            dictionary["image_url"] = imageUrl
        }
        if let petTitle = title {
            dictionary["title"] = petTitle
        }
        if let petContentUrl = contentUrl {
            dictionary["content_url"] = petContentUrl
        }
        if let petDateAdded = dateAdded {
            dictionary["date_added"] = petDateAdded
        }
        return dictionary
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.contentUrl = try container.decodeIfPresent(String.self, forKey: .contentUrl)
        self.dateAdded = try container.decodeIfPresent(String.self, forKey: .dateAdded)
    }
    
    enum CodingKeys: CodingKey {
        case image
        case title
        case contentUrl
        case dateAdded
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.contentUrl, forKey: .contentUrl)
        try container.encodeIfPresent(self.dateAdded, forKey: .dateAdded)
    }
}
