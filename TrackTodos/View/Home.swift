//
//  Home.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var selectedIndex: Int = 0
    @State private var addTodo: Bool = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    HStack {
                        Text("TrackTodos")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        
                        Button {
                            addTodo = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.largeTitle)
                            
                            
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0...categories.count-1, id: \.self) { i in
                                Button {
                                    selectedIndex = i

                                } label: {
                                    CategoryButton(text: categories[i], selected: selectedIndex == i ? true : false)
                                }
                                
                                
                            }
                        }
                        
                    }
                    
                    
                    VStack(spacing: 20) {
                        ForEach(todoViewModel.todos, id:\.uid) { todo in
                            
                            switch selectedIndex {
                            case 0:
                                TodoItem(todo:todo)
                                
                            case 1:
                                if(todo.category == "School") {
                                    TodoItem(todo:todo)
                                }
                                
                            case 2:
                                if(todo.category == "Shopping") {
                                    TodoItem(todo:todo)
                                }
                                
                            case 3:
                                if(todo.category == "Extras") {
                                    TodoItem(todo:todo)
                                }
                            
                            default:
                                TodoItem(todo: todo)
                            }
                            
                            
                            
                            
                        }
                    }
                    
                    
                }
                .padding()
            }
        }
        .sheet(isPresented: $addTodo) {
            AddTodoSheet()
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
