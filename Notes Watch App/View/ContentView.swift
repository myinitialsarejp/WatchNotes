//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Jesse Pelletier on 5/20/24.
//

import SwiftUI


struct ContentView: View {
    // MARK: -PROPERTY
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    // MARK: -FUNCTION
    
    func GetDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func save(){
        //dump(notes)
        do{
            // 1. Convert the Notes array to Json using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            // 2. Create new directory to store new file using getDocumentDirectory
            let url = GetDocumentDirectory().appendingPathComponent("notes")
            // 3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving Data has failed")
        }
    }
    
    func load() {
        // Uses Grand Central Dispatch at system level to help manage tasks on multicore systems
        DispatchQueue.main.async {
            do {
                // 1. Get notes URL path
                let url = GetDocumentDirectory().appendingPathComponent("notes")
                
                // 2. Create new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode data and assign it to newly created property
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                //Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    // MARK: -BODY
    var body: some View {
        NavigationStack{
            VStack {
                HStack(alignment: .center, spacing: 6){
                    TextField("Add New Note", text: $text)
                    Button{
                        //ACTION
                        //1. Run action only if TextField is not empty
                        guard text.isEmpty == false else {return}
                        //2. Create a new Note item and initialize it with TextField value
                        let note = Note(id: UUID(), text: text)
                        //3. Add new Note item to Notes array
                        notes.append(note)
                        //4. Clear TextField
                        text = ""
                        //5. Save new Notes using SaveFunction
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                }//: HSTACK
                Spacer()
                
                if !notes.isEmpty {
                    List {
                        ForEach(0..<notes.count, id: \.self){ i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }//: HSTACK
                        }//: FOREACH LOOP
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                load()
            })
        }
        
    }
}

// MARK: -PREVIEW

#Preview {
    ContentView()
}
