//
//  ContentView.swift
//  LikeAnimation
//
//  Created by Sergio Sepulveda on 2021-06-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLiked: Bool = false
    
    var body: some View {
        
        VStack {
            Text(isLiked ? "Liked!" : "Unliked")
            HeartButton(isLiked: $isLiked)
        }
    }
}

struct HeartButton:View {
    
    @Binding var isLiked: Bool
    private let animationDuration: Double = 0.1
    private var animationScale: CGFloat {
        isLiked ? 0.7 : 1.3
    }
    @State private var animate = false
    
    var body: some View {
        Button(action: {
            self.animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration, execute: {
                self.animate = false
                self.isLiked.toggle()
                
            })
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(isLiked ? .red : .gray)
        })
        .scaleEffect(animate ? animationScale : 1)
        .animation(.easeIn(duration: animationDuration))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
