//
//  DetailEditview.swift
//  Scrumdinger
//
//  Created by Safal Neupane on 4/10/2022.
//

import SwiftUI

struct DetailEditview: View {
    @Binding var data: DailyScrum.Data
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinute, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityLabel("\(Int(data.lengthInMinute)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinute)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(newAttendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditview_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditview(data: .constant(DailyScrum.sampleData[0].data))
    }
}
