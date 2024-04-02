//
//  oldcode.swift
//  swiftui-mouseAdd&Drag
//
//  Created by andyhaz on 3/21/24.
//

import Foundation
//
//  ContentView.swift
//  swiftui-mouseAdd&Drag
//
//  Created by andyhaz on 3/17/24.
//
/*
import SwiftUI


struct ContentView: View {
  @State private var startPoint: CGPoint = .zero
  @State private var endPoint: CGPoint = CGPoint(x: 100, y: 100)

  var body: some View {
    ZStack {
      Path { (path) in
        path.move(to: startPoint)
        path.addLine(to: endPoint)
      }
      .strokedPath(StrokeStyle(lineWidth: 9, lineCap: .square, lineJoin: .round))
      .foregroundColor(.red)

      //Circle 1
      Circle()
        .frame(width: 16, height: 16)
        .position(startPoint)
        .foregroundColor(.blue)
        .gesture(DragGesture()
          .onChanged { (value) in
            self.startPoint = CGPoint(x: value.location.x, y: value.location.y)
        })

      //Circle 2
      Circle()
        .frame(width: 16, height: 16)
        .position(endPoint)
        .foregroundColor(.green)
        .gesture(DragGesture()
        .onChanged { (value) in
          self.endPoint = CGPoint(x: value.location.x, y: value.location.y)
        })
      Color.clear
    }
  }
}

struct Hammer: Identifiable {
    var id = UUID()
    var location: CGPoint
}

struct Level1: View {
    @State var hammers: [Hammer] = [] //<-- Start with `none`
    
    @State var isDragging = true
    @State var dragOFFset:CGSize = .zero
    @State var NewPostion:CGSize = .zero
    @State private var location: CGPoint = .zero
    @State private var toolSel: Int = .zero
    
    var tap: some Gesture {
        SpatialTapGesture()
        
            .onEnded { event in
                self.location = event.location
             }
    }
    
    var body: some View {
        VStack{
            HStack {
                ZStack {
                    if(toolSel == 0){
                        let _ = print("add box")
                        ForEach(hammers) { hammer in // Display all of the
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .position(hammer.location)
                              //.gesture(tap)
                            
                            // Image(systemName: "hammer.fill")
                            //   .resizable()
                            //   .frame(width: 30, height: 30)
                            //   .position(hammer.location)
                        }
                        
                    } else {
                      let _ =  print("drag box")
                            ForEach(hammers) { hammer in // Display all of the
                               Rectangle()
                                    .frame(width: 30, height: 30)
                                    .position(hammer.location)
                                    .onTapGesture {
                                        print("drag\(hammer.location)")
                                        DragGesture()
                                            .onChanged({value in
                                                self.dragOFFset = value.translation
                                            })
                                    }
                                    //.gesture(tap)
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .gesture(DragGesture(minimumDistance: 0).onEnded { value in
                    self.hammers.append(Hammer(location: value.location)) // Add a Hammer
                })
                .edgesIgnoringSafeArea(.all)
                //add list
                List(hammers) { Hammer in
                    Text(String(Hammer.id.uuidString))
                    //Text(string(for ))
                }
            }
        }
        HStack{
            Button(action: {
                self.toolSel = 0
            }, label: {
                Text("Add")
            })
            
            Button(action: {
                self.toolSel = 1
            }, label: {
                Text("drage")
            })
        }

    }
}

struct Box {
    var id = UUID()
    var location: CGPoint
}

#Preview {
    Level1()
}
/*
 .gesture(
 DragGesture()
     .onChanged({ value in
         self.dragOFFset = value.translation
         isDragging = true
     })
     .onEnded({ vaule in
         self.NewPostion.width += vaule.translation.width
         self.NewPostion.height += vaule.translation.height
         dragOFFset = .zero
         isDragging = false
        // Text("\(tag)")
     })) */
/*
 
 Rectangle()
    .fill(.red)
    .gesture(dragG)
    .frame(width: 20, height: 20)
}
 
 let dragG = DragGesture()
     .onChanged{ value in
         offset =  value.translation
     }
 
 
 struct ContentView: View {
     
     @State private var message: String = "Click on rectangle"
     var myLocation: NSPoint { NSEvent.mouseLocation}
     @State private var loc:CGPoint = .zero

     var body: some View {
             VStack {
                 Image(systemName: "magicmouse")
                     .imageScale(.large)
                     .foregroundColor(.accentColor)
                 Text("\(message)")

                 Rectangle()
                     .modifier(PressActions(
                         onPress: {
                             loc.x = myLocation.x
                             loc.y = myLocation.y
                             // Do something on press...
                             message = "Mouse down"
                         },
                         onRelease: {
                             // Do something on release...
                             message = "x: \(loc.x), y: \(loc.y)"
                         }
                         
                     ))

             }
             .padding()
             .frame(width: 200, height: 200)
         }
 }
 */*/
