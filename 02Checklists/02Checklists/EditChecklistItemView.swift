//
//  EditChecklistItemView.swift
//  02Checklists
//
//  Created by Valiant on 2020/4/26.
//  Copyright © 2020 Valiant. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
