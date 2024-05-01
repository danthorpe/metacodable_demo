import Foundation
import HelperCoders
import MetaCodable

@Codable
@CodedAt("type")
public protocol Post {
  var id: UUID { get }
}

@IgnoreCoding
public struct InvalidPost: Post {
  public let id: UUID
  public let invalid: Bool
}

@Codable
public struct TextPost: Post, DynamicCodable {
  public static var identifier:
  DynamicCodableIdentifier<String> {
    return "text"
  }

  public let id: UUID
  public let text: String

  public init(id: UUID = UUID(), text: String) {
    self.id = id
    self.text = text
  }
}

@Codable
public struct PicturePost: Post, DynamicCodable {
  public static var identifier:
  DynamicCodableIdentifier<String> {
    return ["picture", "photo"]
  }

  public let id: UUID
  public let url: URL
  public let caption: String

  public init(id: UUID = UUID(), url: URL, caption: String) {
    self.id = id
    self.url = url
    self.caption = caption
  }
}

@Codable
public struct AudioPost: Post, DynamicCodable {
  public static var identifier:
  DynamicCodableIdentifier<String> {
    return "audio"
  }

  public let id: UUID
  public let url: URL
  public let duration: Int

  public init(id: UUID = UUID(), url: URL, duration: Int) {
    self.id = id
    self.url = url
    self.duration = duration
  }
}

@Codable
public struct VideoPost: Post, DynamicCodable {
  public static var identifier:
  DynamicCodableIdentifier<String> {
    return "video"
  }


  public let id: UUID
  public let url: URL
  public let duration: Int
  public let thumbnail: URL

  public init(id: UUID = UUID(), url: URL, duration: Int, thumbnail: URL) {
    self.id = id
    self.url = url
    self.duration = duration
    self.thumbnail = thumbnail
  }
}

@Codable
public struct Posts {
  @CodedBy(
    SequenceCoder(
      elementHelper: PostCoder()
    )
  )

  @CodedAt
  public let posts: [Post]

  public init(posts: [Post]) {
    self.posts = posts
  }
}
