//
//  OptionSelectionHandler.swift
//  Duolingo
//
//  Created by Daniel Richardson on 1/4/25.
//

import Foundation

class OptionSelectionHandler : ObservableObject {
    
    @Published var selectedEntry: [Bool]
    
    subscript (index: Int) -> Bool {
        
        get {
            return selectedEntry[index]
        }
        
        set(newValue) {
            for i in 0 ..< selectedEntry.count {
                selectedEntry[i] = false
            }
            selectedEntry[index] = newValue /*?? true*/
        }
    }
    
    var isSomeSelectedEntry : Bool {
        for entry in selectedEntry {
            if entry{
                return true
            }
        }
        return false
    }
    
    var indexOfEntrySelected: Int {
        for i in 0..<selectedEntry.count {
            if selectedEntry[i] {
                return i
            }
        }
        return -1
    }
    
    func updateObject(count: Int){
        self.selectedEntry = Array(1...count).map{_ in false}
    }
    
    init(){
        self.selectedEntry = Array(1...LessonsData.lessons[0].options.count).map{_ in false}
    }
    
}
