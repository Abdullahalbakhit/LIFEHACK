import SwiftUI
import FirebaseAuth
import CodableFirebase
import FirebaseFirestore

  struct FIRSTView: View {
      var body: some View {
          Home11()
      }
  }
  
  struct FIRSTView_Previews: PreviewProvider {
      static var previews: some View {
        FIRSTView()
      }
  }
  
  struct Home11 : View {
    @State var show = false
      @State var index = 0
      @State var curvePos : CGFloat = 0
      
      var body: some View{
            
            // changing view based on index...
          
          ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
              
              Color("coding")
            
            if self.index == 0{

                collectionHomeUIView()
                    .navigationBarHidden(true)
            }
            else if self.index == 1{
                

                TOPTopicsSwiftUIView()
                // hiding navigation bar for all other remaining tabs..
                .navigationBarHidden(true)
            }
            else if self.index == 2{

                Createblog(show: self.$show)

                .navigationBarHidden(true)
            }
            else{

                userpageView()
                .navigationBarHidden(true)
            }
              
              // Tab Bar...
              
              HStack{
                  
                  // using it for reading curve position....
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 0
                                  self.curvePos = g.frame(in: .global).midX
                               
                              }
                           
                          }, label: {
                              
                              Image("homee")

                                  .resizable()
                                  .foregroundColor(index == 0 ? .black : .gray)
                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                              // animating View...
                                  .background(Color.white.opacity(index == 0 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 0 ? -35 : 0)
                          })
                      }
                   
                      .frame(width: 43, height: 43)
                      .onAppear {
                          
                          // getting initial index position...
                          
                          DispatchQueue.main.async {
                              
                              self.curvePos = g.frame(in: .global).midX
                          }
                      }
                  }
                  .frame(width: 43, height: 43)
                  
                  Spacer(minLength: 0)
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 1
                                  // assigning it whenever its button is clicked...
                                  
                                  self.curvePos = g.frame(in: .global).midX
                              }
                              
                          }, label: {
                              
                              Image("TOP")
                                  .resizable()
                                  .foregroundColor(index == 1 ? .black : .gray)
                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                                  .background(Color.white.opacity(index == 1 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 1 ? -35 : 0)
                          })
                      }
                   
                      .frame(width: 43, height: 43)
                  }
                  .frame(width: 43, height: 43)
                  
                  Spacer(minLength: 0)
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 2
                                  self.curvePos = g.frame(in: .global).midX
                              }
                              
                          }, label: {
                              
                              Image("ADD")

                                  .resizable()
                                  .foregroundColor(index == 2 ? .yellow : .purple)
                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                                  .background(Color.white.opacity(index == 2 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 2 ? -35 : 0)
                          })
                      }
                    
                      .frame(width: 43, height: 43)
                  }
                  .frame(width: 43, height: 43)
                  
                  Spacer(minLength: 0)
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 3
                                  self.curvePos = g.frame(in: .global).midX
                              }
                              
                          }, label: {
                              
                              Image("account")

                                  .resizable()

                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                                  .background(Color.white.opacity(index == 3 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 3 ? -35 : 0)
                          })
                      }
                      .frame(width: 43, height: 43)
                  }
                  .frame(width: 43, height: 43)
              }
              .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
              .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 6 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
              .padding(.top, 3)
              .background(Color.white.clipShape(CShape11(curvePos: curvePos)))
              
              //   add Curve...
          })
          .edgesIgnoringSafeArea(.all)
      }
  }
  
  struct CShape11 : Shape {
  
     
      
      var curvePos : CGFloat
      
      
      // animating Path....
      
      
      var animatableData: CGFloat{
          
          get{return curvePos}
          set{curvePos = newValue}
      }
      
      func path(in rect: CGRect) -> Path {
       
          return Path{path in
              
              path.move(to: CGPoint(x: 0, y: 0))
              path.addLine(to: CGPoint(x: 0, y: rect.height))
              path.addLine(to: CGPoint(x: rect.width, y: rect.height))
              path.addLine(to: CGPoint(x: rect.width, y: 0))
              
              // adding Curve...
              
              path.move(to: CGPoint(x: curvePos + 40, y: 0))
              
              path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0), control: CGPoint(x: curvePos, y: 70))
             
          }
          
      }
  }
  
