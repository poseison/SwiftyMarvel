//
//  SplashView.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 23/7/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack{
            if(self.isActive){
                HomeView()
                
            }else{
                Rectangle().background(Color.black)
                Image("SplashLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{self.isActive = true}
            }
        }
    }
    
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
        }
    }
}
