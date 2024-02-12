import Foundation

import SwiftUI

@main
struct MyNotesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct Note {
    var text: String
}

class NotesApp {
    var note: Note?
    
    init() {
        if let savedNote = loadNote() {
            note = savedNote
        } else {
            note = Note(text: "New note")
            saveNote()
        }
    }
    
    func editNote(newText: String) {
        note?.text = newText
        saveNote()
    }
    
    func saveNote() {
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("note.txt")
        
        do {
            let data = note?.text.data(using: .utf8)
            try data?.write(to: filePath)
            print("Note saved successfully!")
        } catch {
            print("Error saving note: \(error.localizedDescription)")
        }
    }
    
    func loadNote() -> Note? {
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("note.txt")
        
        do {
            let data = try Data(contentsOf: filePath)
            let text = String(data: data, encoding: .utf8)
            return Note(text: text ?? "")
        } catch {
            print("Error loading note from file: \(error.localizedDescription)")
            return nil
        }
    }
    
    func run() {
        print(note?.text ?? "Note not found")
        editNote(newText: "Edited note")
        print(note?.text ?? "Note not found")
    }
}

func main() {
    let myNotesApp = NotesApp()
    myNotesApp.run()
}


