//
//  BackgroundClearView.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import SwiftUI

struct BackgroundClearView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .black.withAlphaComponent(0.4)
        }
        return view
    }
}

struct BackgroundClearView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundClearView()
    }
}
