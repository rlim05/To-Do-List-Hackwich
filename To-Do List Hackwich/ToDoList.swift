//
//  ToDoList.swift
//  To-Do List Hackwich
//
//  Created by Student on 1/10/22.
//

import Foundation

class ToDoList: ObservableObject {
    @Published var items : [ToDoItem]{
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ToDoItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
