//
//  TodoItem.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct TodoItem: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    var todo: Todo
    let dateFormatter = DateFormatter()
    
    @State private var editSheet: Bool = false
    init(todo: Todo) {
        self.todo = todo
        dateFormatter.dateFormat = "dd/MM/YY, h:mm a"
    }
    
    var body: some View {
        ZStack {
            
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(todo.title)
                        .font(.system(size: 25).bold())
                        .foregroundColor(.cyan.opacity(0.8))
                    
                    Text(todo.description)
                        .font(.system(size: 15).bold())
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text(dateFormatter.string(from: todo.dateToBeCompleted!))
                        .font(.system(size: 15).bold())
                        .foregroundColor(.gray.opacity(0.8))
                    
                    if(todo.completed) {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green.opacity(0.7))
                            Text(dateFormatter.string(from: todo.dateCompleted ?? Date.now))
                        }
                    }
                    
                }
                Spacer()
                
                VStack {
                    
                    Button {
                        editSheet = true
                    } label: {
                        Image(systemName: "pencil")
                            .font(.system(size: 20))
                            
                    }
                    Spacer()
                    
                    if(!todo.completed) {
                        
                        Button {
                            todoViewModel.completeTodo(todoId: todo.uid)
                        } label: {
                            Image(systemName: "square")
                                .foregroundColor(Color("Light"))
                                .font(.system(size: 50))
                        }
                        
                        
                    } else {
                        Button {
                            todoViewModel.uncompleteTodo(todoId: todo.uid)
                        } label: {
                            Image(systemName: "checkmark.square.fill")
                                .foregroundColor(Color("Light"))
                                .font(.system(size: 50))
                        }
                        
                    }
                }
                .padding(.vertical, 5)
            }
            .padding()
        }
        .frame(width: 340)
        .background(Color("Dark"))
        .cornerRadius(15)
        .sheet(isPresented: $editSheet) {
            EditTodoSheet(todo: todo)
        }
        
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: todo1)
    }
}
