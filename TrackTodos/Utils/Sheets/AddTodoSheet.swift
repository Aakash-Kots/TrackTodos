//
//  AddTodoSheet.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 27/08/22.
//

import SwiftUI

struct AddTodoSheet: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var category: Int = 0
    
    @State private var date: Date = Date.now
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                HStack {
                    Text("Create Todo")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                }
                Form {
                    Section("Category") {
                        Picker("", selection: $category) {
                            ForEach(0...categories.count-1, id:\.self) {i in
                                Text(categories[i])
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Details") {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                    }
                   
                    
                    Section("Finish By") {
                        DatePicker("", selection: $date)
                            .labelsHidden()
                    }
                    
                    Button {
                        let uid = UUID().uuidString
                        todoViewModel.createTodo(todo: Todo(uid:uid, title: title, description: description,category: categories[category], completed: false, dateAdded: Date.now, dateCompleted: nil, dateToBeCompleted: date))
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("Create")
                            .foregroundColor(Color(.systemBlue))
                    }

                    
                }
            }
            .padding()
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
}

struct AddTodoSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoSheet()
    }
}
