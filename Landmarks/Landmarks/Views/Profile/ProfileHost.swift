//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 17/03/24.
//
import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default


    var body: some View {
        VStack{
           HStack {
               if editMode?.wrappedValue == .active {
                   Button("Cancel", role: .cancel) {
                       draftProfile = modelData.profile
                       editMode?.animation().wrappedValue = .inactive
                   }
               }
               Spacer()
               EditButton()
           }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile) 
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }

        }.padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}
