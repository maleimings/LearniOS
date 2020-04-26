//
//  ContentView.swift
//  02Checklists
//
//  Created by Valiant on 2020/4/26.
//  Copyright © 2020 Valiant. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ?"✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let index = self.checklist.items.firstIndex(where: {$0.id == checklistItem.id}) {
                            self.checklist.items[index].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListitem)
                .onMove(perform: checklist.moveListItem)
            }
        .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear() {
                self.checklist.printChecklistContents()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
