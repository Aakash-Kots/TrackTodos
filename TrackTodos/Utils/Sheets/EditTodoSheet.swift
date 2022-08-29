//
//  EditTodoSheet.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 28/08/22.
//

import SwiftUI

struct EditTodoSheet: View {
    @Environment(\.presentationMode) var mode
    var todo: Todo
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var category: Int = 0
    
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
                Section("Category") {
                    Picker("", selection: $category) {
                        ForEach(0...categories.count-1, id: \.self) {i in
                            Text(categories[i])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Details") {
                    TextField(title, text: $title)
                    TextField(description, text: $description)
                }
                
                
                
                Section("Finish By") {
                    DatePicker("", selection: $dateToBeCompleted)
                        .labelsHidden()
                }
                
                Button {
                    let x: Todo = Todo(uid: todo.uid, title: title, description: description, category: categories[category], completed: todo.completed, dateAdded: todo.dateAdded, dateCompleted: todo.dateCompleted, dateToBeCompleted: dateToBeCompleted)
                    todoViewModel.updateTodo(todo: x)
                } label: {
                    Text("Update")
                        .foregroundColor(Color(.systemBlue))
                }
                
                
                Button {
                    todoViewModel.deleteTodo(todoID: todo.uid)
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Delete")
                        .foregroundColor(Color(.systemRed))
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
