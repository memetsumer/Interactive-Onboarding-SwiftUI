//
//  ContentView.swift
//  Instagram
//
//  Created by Mehmet Sümer on 23.12.2022.
//

import SwiftUI


struct ContentView: View {
    @State var change = false
    @State var changeText = false
    @State var buttonVisible = false
    
    var rows = 20
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .teal] ), startPoint: .bottom, endPoint: .top)
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(200)), count: 7)) {
                ForEach(0..<57) { index in
                    Box(mainColor: Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
                        .padding(.all)
                }
            }
                .scaleEffect(0.6)
                .rotation3DEffect(Angle(degrees: change ? 34 : 0), axis: (x: 0, y: 0, z: 1) )

            ZStack {
                Color.white.opacity(0.4)
                    .background(.ultraThinMaterial)
                    .shadow(color: .white.opacity(0.2), radius: 10, x: 0, y: 10)
                    .frame(maxWidth: 300, maxHeight: change ? 460 : 200)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                VStack() {
                    HStack {
                        if (!changeText) {
                            VStack(alignment: .leading) {
                                Text("Individuality")
                                    .font(.largeTitle)
                                Text("starts here.")
                                    .font(.title2)
                            }
                        } else {
                            Text("Let's Roll!")
                                .font(.title)
                                
                        }
                     
                        Spacer()
                    }
                    .padding()
                    
                    if (!changeText) {
                        HStack {
                            Spacer()
                            if (buttonVisible) {
                                CTA(change: $change, changeText: $changeText)
                            }
                                }.padding()
                    }
                    
                    if (change) {
                        VStack(spacing: 12) {
                            SignUpButton(message: "Sign Up with Apple")
                            SignUpButton(message: "Sign Up with Google")
                        }
                        .padding(.top)
                    }
                        }
                    }
                .padding()
                .frame(maxWidth: 300, maxHeight: change ?  300 : 200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        withAnimation {
                            buttonVisible.toggle()
                        }
                    }
                }
        }.edgesIgnoringSafeArea(.all)
     
                
        
    }
        
}
    
    //                        ZStack {
    //                            ForEach(0...rows, id: \.self) { row in
    //                                        Path { path in
    //                                            path.move(to: CGPoint(x: Int(geometry.size.width) * row / rows, y: 0))
    //                                            path.addLine(to: CGPoint(x: Int(geometry.size.width) * row / rows, y: Int(geometry.size.height)))
    //                                        }
    //                                        .stroke(Color.black, lineWidth: 1)
    //                            }
    //                            ForEach(0...total, id: \.self) { column in
    //                                        Path { path in
    //                                            path.move(to: CGPoint(x: 0, y: Int(geometry.size.height) * column / total))
    //                                            path.addLine(to: CGPoint(x: Int(geometry.size.width), y: Int(geometry.size.height) * column / total))
    //                                        }
    //                                        .stroke(Color.black, lineWidth: 1)
    //                            }
    //                        }
    //
    //                    }
    
    
    
    
    //        GeometryReader { geometry in
    //                TimelineView(.animation) { timeline in
    //                    Canvas { context, size in
    //                        let timelineDate = timeline.date.timeIntervalSinceReferenceDate
    //                        particleSystem.update(date: timelineDate)
    //
    //                        for particle in particleSystem.particles {
    //                            let xPos = particle.x * size.width
    //                            let yPos = particle.y * size.height
    //
    //                            context.fill(Path(CGRect(origin: CGPoint(x: Int(xPos) - Int(xPos) % 10, y: Int(yPos) - Int(yPos) % 10), size: CGSize(width: 10, height: 10)))
    //                                , with: .color(selectedColor))
    //
    //                        }
    //                    }
    //                }
    //                .background(.purple.opacity(0.2))
    //
    //                .gesture(
    //                    DragGesture(minimumDistance: 0)
    //                        .onChanged { drag in
    //                            particleSystem.center.x = drag.location.x / geometry.size.width
    //                            particleSystem.center.y = drag.location.y / geometry.size.height
    //                        }
    //                )
    //
    //            }
    //        }


