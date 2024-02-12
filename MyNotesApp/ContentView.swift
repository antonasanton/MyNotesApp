import SwiftUI

struct ContentView: View {
    @State private var noteText: String = "New note"
    
    var body: some View {
        VStack {
            Text("My Notes App")
                .font(.title)
                .padding()
            
            TextEditor(text: $noteText)
                .padding()
            
            Button("Save Note") {
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
