//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 17/03/24.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    let items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                .padding(.bottom, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }.frame(height: 150)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
        
    )
}





//struct CategoryRow: View {
//    @Environment(ModelData.self) var modelData
//    let category: Category
//    
//    var body: some View {
//        List {
//            ForEach(modelData.landmarks.filter{ $0.category.rawValue == category }, id: \.self) { Landmark in
//                Text(Landmark.name)
//            }
//        }
//    }
//}
//
//#Preview {
//    CategoryRow(category: Category.lakes)
//        .environment(ModelData())
//}
