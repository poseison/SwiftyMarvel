//
//  BaseStateView.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import SwiftUI

struct BaseStateView: View {
    @ObservedObject var viewModel: ViewModel
    let successView: AnyView
    let emptyView: AnyView?
    let errorView: AnyView?
    let loadingView: AnyView?
    
   
    init(viewModel: ViewModel,
         successView: AnyView,
         emptyView: AnyView? = AnyView(MessageView(message: "No Data Found")),
         errorView: AnyView? = nil,
         loadingView: AnyView? = AnyView(ProgressView())) {
        self.viewModel = viewModel
        self.successView = successView
        self.emptyView = emptyView
        self.errorView = errorView
        self.loadingView = loadingView
    }

    var body: some View {
        ZStack {
            successView
            switch viewModel.state {
            case .initial,
                    .loading:
                loadingView
            case .error(let errorMessage):
                errorView ?? AnyView(MessageView(message: errorMessage))
            case .empty:
                emptyView
            default:
                EmptyView()
            }
        }
    }
}
