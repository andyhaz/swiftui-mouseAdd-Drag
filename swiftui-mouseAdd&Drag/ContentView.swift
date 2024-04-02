//
//  ContentView.swift
//  swiftui-mouseAdd&Drag
//
//  Created by andyhaz on 3/17/24.
//

import SwiftUI

struct DraggableShape: View, Identifiable {
  let id = UUID() // Unique identifier for each shape
  let color: Color
  let size: CGSize // Size of the shape
  var location: CGPoint
    
  @State private var offset: CGSize = .zero // Stores drag offset
  @State private var isDragging = true
  @State private var postion:CGSize = .zero
    
  var body: some View {
      RoundedRectangle(cornerRadius: 5, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
          .frame(width: 20, height: 20)
          .offset(postion)
          .foregroundColor(color)
          .gesture(
          DragGesture()
              .onChanged({ value in
                  postion = value.translation
                  isDragging = true
              })
              .onEnded({ vaule in
                  postion = vaule.translation
                  isDragging = false
                 // Text("\(tag)")
              }))
  }

  private func calculatePosition() -> CGPoint {
    // Implement logic to calculate final position based on size, offset, and potential boundary checks
    return CGPoint(x: 100, y: 100) // Example initial position
  }
}
struct ContentView: View {
    //@State var shapes: [DraggableShape] = [] //<-- Start with `none`
    @State private var shapes = [DraggableShape]()
    @State private var toolSel: Int = .zero
    @State var postion:CGSize = .zero
    @State var isDragging = true
    
   // @Binding var sel: Hammer
    
    var body: some View {
        VStack{
            HStack{
                //  let _ = print("draw")
                ZStack{
                    Text("canves draw")
                    ForEach(shapes) { shape in
                        DraggableShape(color: shape.color, size: shape.size, location:shape.location)
                    }
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .gesture(DragGesture(minimumDistance: 0).onEnded { value in
                    if(toolSel == 0){
                        self.shapes.append(DraggableShape(color: .red, size: CGSize(width: 20, height: 20), location:CGPoint(x: 5, y: 5))) // Add a box
                    } else {
                        // print("data:\(self.hammers)")
                        
                    }
                })
                .edgesIgnoringSafeArea(.all)
                
                //add list
                List($shapes) { shape in
                    Text(String(shape.id.uuidString))
                    //Text(string(for ))
                }
            }
        }
    }
}

#Preview {
    ContentView()
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
 */
