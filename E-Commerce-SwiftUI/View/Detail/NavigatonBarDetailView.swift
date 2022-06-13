//
//  NavigatonBarDetailView.swift
//  E-Commerce-SwiftUI
//
//  Created by hakkı can şengönül on 13.06.2022.
//

import SwiftUI

struct NavigatonBarDetailView: View {
     // MARK: - PROPERTIES
    
    
    
     // MARK: - BODY
    var body: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            }

            
            
        }
    }
}



 // MARK: - PREVIEW
struct NavigatonBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatonBarDetailView().previewLayout(.sizeThatFits)
            .padding().background(.gray)
    }
}
