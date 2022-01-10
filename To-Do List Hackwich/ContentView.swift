//
//  ContentView.swift
//  To-Do List Hackwich
//
//  Created by Ryan Lim on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoItems =
        [ToDoItem (priority: "High", description: "Take out trash", dueDate: Date()),
        ToDoItem (priority: "Medium", description: "Pick up clothes", dueDate: Date()),
        ToDoItem (priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView{
            List{
                ForEach(toDoItems) { item in
                    Text(item.description)
                }
                .onMove(perform: { indices, newOffset in toDoItems.move (fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in toDoItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
