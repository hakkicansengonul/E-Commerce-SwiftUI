//
//  ContentView.swift
//  E-Commerce-SwiftUI
//
//  Created by hakkı can şengönül on 12.06.2022.
//

import SwiftUI
//navigation view olmadan kullanım saferarea dikkat edilerek.
extension UIApplication {
    var safeAreaInsets: UIEdgeInsets? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundInactive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter {$0.isKeyWindow}
            .first
        
        return keyWindow?.safeAreaInsets
    }
}
struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var  shop : Shop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing:0) {
                    
                    NavigationBarView()
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                        .background(.white)
                        .padding(.top,UIApplication.shared.safeAreaInsets?.top)
                    
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack (spacing:0){
                            
                            FeaturedTabView()
                                .frame(height:UIScreen.main.bounds.width / 1.475)
                                .padding(.vertical,20)
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products){product in
                                    ProductItemView(product: product).onTapGesture {
                                        feedback.impactOccurred()
                                        withAnimation(.easeOut) {
                                            shop.selectedProduct = product
                                            shop.showingProduct = true
                                        }
                                    }
                                    
                                }//Loop
                            }//Grid
                            .padding(15)
                            TitleView(title: "Brands")
                            BrandGridView()
                            
                            
                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                    
                }//VStack
                
                .background(colorBackground.ignoresSafeArea(.all,edges: .all))
            } else {
                ProductDetailView()
            }
        }//ZStack
        .ignoresSafeArea(.all,edges: .top
        )
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Shop())
    }
}
