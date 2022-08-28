//
//  EditTodoSheet.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 28/08/22.
//

import SwiftUI

struct EditTodoSheet: View {
    var todo: Todo
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var category: Int = 0
    let categories: [String] = ["School", "Shopping", "Extras"]
    @State private var dateToBeCompleted: Date = Date.now
    
    var body: some View {
        VStack {
            HStack {
                Text("Edit your Todo")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
            }
            
            Form() {
                Section("Details") {
                    TextField(title, text: $title)
                    TextField(description, text: $description)
                }
                
                Section("Category") {
                    Picker("", selection: $category) {
                        ForEach(0...categories.count-1, id: \.self) {i in
                            Text(categories[i])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Finish By") {
                    DatePicker("", selection: $dateToBeCompleted)
                        .labelsHidden()
                }
                
                Button {
                    print("Updated the todo")
                } label: {
                    Text("Update")
                        .foregroundColor(Color(.systemBlue))
                }

            }
        }
        .padding()
        .padding(.vertical)
        .onAppear() {
            self.title = todo.title
            self.description = todo.description
            self.category = categories.firstIndex(of: todo.category) ?? 0
            self.dateToBeCompleted = todo.dateToBeCompleted!
            
        }
    }
}

struct EditTodoSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditTodoSheet(todo: todo1)
    }
}
