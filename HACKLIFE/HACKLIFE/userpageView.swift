//
//  userpageView.swift
//  HACKLIFE
//
//  Created by Haya Saleemah on 10/20/20.
//

import SwiftUI
import SwiftUI
import Firebase
//import CodableFirebase
import FirebaseFirestore
import SDWebImage
struct userpageView: View {
    @State var show = false
    @State var showmsg = false
    @State var title = "hello"
    @State var animate = "a"
    @State var color1 = Color((#colorLiteral(red: 0.1357237399, green: 0.192122668, blue: 0.6524842381, alpha: 1)))
    @State var color2 = Color("bg")
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            VStack {
                Button(action: {
        //                    Homescreenlogout()
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)

                })
                {
                    Text("logout")
                        .padding()
                }.background(Color(#colorLiteral(red: 0.6210387349, green: 0.3866854906, blue: 0.9981178641, alpha: 1)))
                .foregroundColor(.white)
                .clipShape(Capsule()).frame(width: UIScreen.main.bounds.width - 50).padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)!)

                
                
                VStack(){
                    Text("If you have any suggestions or problem please send us a message here").foregroundColor(.gray).bold().lineLimit(2).fixedSize(horizontal: false, vertical: true)
                    Button(action: {
                        self.showmsg.toggle()
                       

                    })
                    {
                        
                        Image("suggestion").resizable().frame(width: 60, height: 60)
     
                    }.sheet(isPresented: self.$showmsg) {
                        suggestionsView()
                
                    }
                    
                }.padding()
            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! - 10)


        VStack(){
            ZStack{
        ZStack{
            RoundedRectangle(cornerRadius : 30).fill(LinearGradient(gradient : Gradient(colors : [color1,color2 ]), startPoint : .top , endPoint : .bottom)).frame(width : 350 ,height:200).shadow(color : Color(.gray) , radius : 25 , x : -10 , y: 10 )
           
//            Text("we will try our best").foregroundColor(.white).bold().offset(x : -105 , y: -80 )
               
            LottieView(filename : "29780-users-and-vr-loop").frame(width: 200 , height: 200 )
        
        }.offset(y : show ? 140 : 20 ).animation(.spring(response : 0.5 , dampingFraction : 0.5 ,  blendDuration : 0)).onTapGesture {
            self.show.toggle()
        }
                        ZStack{
                            RoundedRectangle(cornerRadius : 30).fill(LinearGradient(gradient : Gradient(colors : [Color(#colorLiteral(red: 0.4392156863, green: 0.1058823529, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.631372549, green: 0.4078431373, blue: 1, alpha: 1))]), startPoint : .top , endPoint : .bottom)).frame(width : 350 ,height:200).shadow(color : Color(.gray) , radius : 25 , x : -10 , y: 10 )
                            Text("").foregroundColor(.white).bold().offset(x : -130 , y: -80 )
                            LottieView(filename : "30816-mail-send-animation").frame(width: 170 , height: 170 )
                            
            
                        }.offset(y : show ? -300 : 0 ).rotationEffect(Angle(degrees: show ? 120 : 0)).animation(.spring(response : 0.5 , dampingFraction : 0.5 ,  blendDuration : 0)).onTapGesture {
                            self.show.toggle()
                        }
            }
            
           
        }.padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 250)
            
            
        }.padding().padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 20)
    
    }}

struct userpageView_Previews: PreviewProvider {
    static var previews: some View {
        userpageView()
    }
}



