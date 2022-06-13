//
//  BrandGridView.swift
//  E-Commerce-SwiftUI
//
//  Created by hakkı can şengönül on 13.06.2022.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }//Grid
            .padding(15)
            .frame(height : 200)
            
        }
    }
}



// MARK: - PREVIEW
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView().previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}