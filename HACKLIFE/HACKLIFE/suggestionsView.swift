//
//  suggestionsView.swift
//  HACKLIFE
//
//  Created by Haya Saleemah on 10/21/20.
//

import SwiftUI
import SwiftUI
import Firebase
import CodableFirebase
import FirebaseFirestore
import SDWebImageSwiftUI
import Foundation
import UIKit
struct suggestionsView: View {
    @State var txt = ""
    @State var showAlert = false
    var body: some View {
        
        ZStack() {
            
//            Color("backgroundShadow3")
//            background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color("background8")]), startPoint: .bottomLeading, endPoint: .topTrailing)).edgesIgnoringSafeArea(.all)
            
            VStack(spacing : 10){
                
                HStack(spacing : 2){
                    
            LottieButton(filename: "14911-amazing-submit-button", action: {
                if self.txt != ""{
                   
                    suggestions(msg: self.txt)
                   
                }
                else {
                    self.showAlert.toggle()
                }
            })

            .alert(isPresented: self.$showAlert) {
//                    LottieView(filename: "14911-amazing-submit-button")
                    Alert(title: Text("please add all the information "), dismissButton: .default(Text("Got it!")))
                }}.padding()
                Text("We will try to do our best").foregroundColor(.white).bold().padding()
            multilineTextField(txt: $txt).cornerRadius(15).frame(width: 320, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                LottieView(filename: "31662-e-mail-02" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
        }.padding()
            
//            14911-amazing-submit-button
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color("background8")]), startPoint: .bottomLeading, endPoint: .topTrailing)).edgesIgnoringSafeArea(.all)
        
    }
}

struct suggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        suggestionsView()
    }
}

func  suggestions(msg : String  ){
    
    let db = Firestore.firestore()
    
    db.collection("suggestions").document().setData(["msg":msg]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            
            return
        }
        print("success")
    }
}
