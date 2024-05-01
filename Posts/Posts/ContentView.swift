import SwiftUI
import Models

struct ContentView: View {
    let model: Models.Posts
    var body: some View {
        VStack {
          ForEach(model.posts, id: \.id) { post in
            Text(String(describing: post))
              .padding(.vertical, 4)
          }
        }

    }
}

#Preview {
    ContentView(
      model: Posts(
        posts: [
          TextPost(text: "Hello World"),
          PicturePost(url: URL(string: "http://example.com")!, caption: "Picture post!")
        ]
      )
    )
}
