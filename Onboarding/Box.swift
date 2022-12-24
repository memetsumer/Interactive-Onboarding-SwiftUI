//
//  Home.swift
//  Instagram
//
//  Created by Mehmet Sümer on 23.12.2022.
//

import SwiftUI

struct Box: View {
    
    var mainColor: Color = .purple
    var sideColor: Color = .green
    
    var body: some View {
        IsometricView {
            mainColor
                .border(.purple)
        } bottom: {
            sideColor
                .border(.purple)

        } side: {
            sideColor
                .border(.purple)
        }
        .frame(width: 150, height: 150)
    }
    
}
 

// MARK: Custom View
struct IsometricView<Content: View, Bottom: View, Side: View>: View {
    var content: Content
    var bottom: Bottom
    var side: Side
        
    // MARK: Isometric Depth
    @State var depth: CGFloat = 35
    @State var scale: CGFloat = 1
    @State var visible = false
    
    init (
          @ViewBuilder content: @escaping() -> Content,
          @ViewBuilder bottom: @escaping() -> Bottom,
          @ViewBuilder side: @escaping() -> Side) {
        self.content = content()
        self.bottom = bottom()
        self.side = side()
    }
    
    var body: some View {
        Color.clear
            .overlay {
                GeometryReader {
                    let size = $0.size
                    
                    ZStack {
                        content
                            .offset(x: 70 - depth * 2)
                            .scaleEffect(scale)

                        DepthView(isBottom: true, size: size)
                        DepthView(size: size)
                    }
                    .frame(width: size.width, height: size.height)
                }
            }.gesture(TapGesture()
                .onEnded({ _ in
                    withAnimation(.easeIn(duration: 0.2)) {
                    depth = 0
                    scale = 0.6
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeOut(duration: 0.2)) {
                            depth = 35
                            scale = 1
                        }
                    }

            }))
            .opacity(visible ? 1 : 0)
            .scaleEffect(visible ? 1 : 0.1)
            .offset(y: visible ? 100 : 0)
            .onAppear {
                withAnimation(.easeOut(duration: 0.4).delay(Double.random(in: 0.1..<2))) {
                    visible.toggle()
                }
            }
    }
    
    // MARK: Depth View's
    @ViewBuilder
    func DepthView(isBottom: Bool = false, size: CGSize) -> some View {
        ZStack {
            if isBottom {
                bottom
                    .frame(height: depth)
                    .clipped()
                    // MARK: Applying transforms
                    .projectionEffect(.init(.init(a:1, b:0, c:1, d:1, tx:0, ty:0)))
                    .offset(x: 70 - depth * 2, y: depth * 2 - 35)
                    .scaleEffect(scale)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            } else {
                side
                    .frame(width: depth)
                    .clipped()
                    // MARK: Applying transforms
                    .projectionEffect(.init(.init(a:1, b:1, c:0, d:1, tx:0, ty:0)))
                    .offset(x:70 - depth)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .scaleEffect(scale)
            }
        }
    }
}
