import SwiftUI
import Models

let json = """
[
  {
    "id": "00005678-abcd-efab-0123-456789abcdef",
    "type": "text",
    "text": "Lorem Ipsium",
  },
  {
    "id": "43215678-abcd-efab-0123-456789abcdef",
    "type": "picture",
    "url": "https://a.url.com/to/a/picture.png",
    "caption": "Lorem Ipsium"
  },
  {
    "id": "43215678-abcd-efab-0123-456789abcdef",
    "type": "photo",
    "url": "https://a.url.com/to/a/picture.png",
    "caption": "Lorem Ipsium",
  },
  {
    "id": "64475bcb-caff-48c1-bb53-8376628b350b",
    "type": "audio",
    "url": "https://a.url.com/to/a/audio.aac",
    "duration": 60,
  },
  {
    "id": "98765432-abcd-efab-0123-456789abcdef",
    "type": "video",
    "url": "https://a.url.com/to/a/video.mp4",
    "duration": 460,
    "thumbnail": "https://a.url.com/to/a/thumbnail.png",
  }
]
"""

@main
struct PostsApp: App {

  var body: some Scene {
        WindowGroup {
          ContentView(
            model: try! JSONDecoder().decode(Models.Posts.self, from: json.data(using: .utf8)!)
          )
        }
    }
}
