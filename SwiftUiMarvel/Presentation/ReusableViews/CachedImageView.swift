//
//  CachedImageView.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import SwiftUI
import Kingfisher

struct CachedImageView: View {
    
    let url: URL?
    
    init(_ url: URL?) {
        self.url = url
    }
    
    var body: some View {
        KFImage.url(url)
            .placeholder({
                ProgressView()
            })
            .fade(duration: 0.25)
            .resizable()
    }
}

struct CachedImageView_Previews: PreviewProvider {
    static var previews: some View {
        CachedImageView(nil)
    }
}
