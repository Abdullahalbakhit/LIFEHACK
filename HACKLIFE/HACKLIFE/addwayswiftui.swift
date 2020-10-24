//
//  SwiftUIView.swift
//  FirebaseTemplate
//
//  Created by Haya Saleemah on 10/15/20.
//  Copyright © 2020 OMAR. All rights reserved.

import SwiftUI
import Firebase
import CodableFirebase
import FirebaseFirestore
import SDWebImageSwiftUI
import Foundation
import UIKit


struct Createblog: View {
    @Binding var show : Bool
    @State var txt = ""
    @State var title = ""
    @State var collection = "Cooking"
    @State var picker = false
    @State var picData : Data = .init(count: 0)
    @State var loading = false
    @State var viewcollection = ["Fashion","Cooking","Drawing","Technology","Gifts", "Decoration"]
    @State var flipped = false
    @State var flipped1 = false
    @State var flipped2 = false
    @State var flipped3 = false
    @State var flipped4 = false
    @State var flipped5 = false
    @State var flipped6 = false
    
    @State var showAlert = false
    @State var showAlertdone = false
    @State var senddataloading = false
    var body: some View {
       
//        ScrollView(.vertical) {
//        VStack(spacing: 60){
//            Text("        ")
//        }
//        Spacer()
        ZStack(){
        VStack(spacing: 15){
            
            HStack(spacing: 20){
               
                TextField( "  add title",text: $title).frame( height: 50).background(Color(#colorLiteral(red: 0.1380944252, green: 0.8040791154, blue: 0.9961763024, alpha: 1))).cornerRadius(20)
    
                if loading{
                indicator()
                }else {

                    Button(action: {
                        self.picker.toggle()
                    })
                    {
                        Image( "addimage").resizable().frame(width: 60 , height: 60 )
                    }
                }
                
                LottieButton(filename: "14911-amazing-submit-button", action: {
                    if self.picData.count != 0{
                        self.firetestuplad()
                        self.senddataloading = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7){
//                            collectionHomeUIView()
                            self.senddataloading = false
                            self.showAlertdone.toggle()
                        }
                    }else if self.picData.count == 0 || self.title == "" || self.txt == ""{
//
                        self.showAlert.toggle()
                        
                    }
                    
               
                }).frame(width: 120, height: 120).alert(isPresented: self.$showAlert) {
                    Alert(title: Text("please add all the information "), dismissButton: .default(Text("Got it!")))
                }

            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! ).alert(isPresented: self.$showAlertdone) {
                Alert(title: Text("Think you for share your ideas"), dismissButton: .default(Text("✔️")))
            }

            VStack(){
                
                Text("please select one of the collection").foregroundColor(.white).lineLimit(2).fixedSize(horizontal: false, vertical: true)
                
                HStack(){
                    
                    Button(action: {
                        collection = "Technology"
                        }) {
                        Image("devices") .resizable().cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default)
//                            .animation(Animation.interpolatingSpring(stiffness: 60, damping: 6)) // implicitly applying animation
                            .onTapGesture {
                                // explicitly apply animation on toggle (choose either or)
                                //withAnimation {
                                self.collection = "Technology"
                                self.flipped.toggle()}
    
                        }
//                    Spacer(minLength: 0)
                    Button(action: {
                        self.collection = "Drawing"
                        }) {
                        Image("draw3") .resizable().cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50).rotation3DEffect(self.flipped1 ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default) // implicitly applying animation
                            .onTapGesture {
                              
                                //withAnimation {
                                self.collection = "Drawing"
                                self.flipped1.toggle()}
    
                        }


                    Button(action: {
                        self.collection = "Cooking"
                        }) {
                        Image("cook") .resizable().cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50).rotation3DEffect(self.flipped2 ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default) // implicitly applying animation
                            .onTapGesture {
                             
                                self.collection = "Cooking"
                                self.flipped2.toggle()
                                
                            }
    
                        }
                    Button(action: {
                        self.collection = "Gifts"
                        }) {
                        Image("gifts").resizable().cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50).rotation3DEffect(self.flipped3 ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default) // implicitly applying animation
                            .onTapGesture {
                               
                                //withAnimation {
                                self.collection = "Gifts"
                                self.flipped3.toggle()}
    
                        }
                    Button(action: {
                        self.collection = "Fashion"
                        }) {
                        Image("clothes") .resizable().cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50).rotation3DEffect(self.flipped4 ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default) // implicitly applying animation
                            .onTapGesture {
                              
                                self.collection = "Fashion"
                                self.flipped4.toggle()}
    
                        }
                    Button(action: {
                        self.collection = "Decoration"
                        }) {
                        Image("deco") .resizable()
//                            .cornerRadius(25)
                                                   .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50).rotation3DEffect(self.flipped5 ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default) // implicitly applying animation
                            .onTapGesture {
                               
                                self.collection = "Decoration"
                                self.flipped5.toggle()}
    
                        }
                    .cornerRadius(25)
                    
                }
                .frame(width: 350, height:100).onAppear(
                )
               

            }.padding(.top,5)
 
               
            
            if self.picData.count != 0{
                
                ZStack() {
//                    alignment: Alignment(horizontal: .trailing, vertical: .top)
                    Image(uiImage: UIImage(data: self.picData)!)
                        .resizable().frame(width: 250, height: 150)
                        .aspectRatio(contentMode: .fit)
                        
                        .cornerRadius(15)
                   
                    // Cancel Button...
                    
                    Button(action: {picData = Data(count: 0)}) {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color(#colorLiteral(red: 0.1380944252, green: 0.8040791154, blue: 0.9961763024, alpha: 1)))
                            .padding(10)
                            .background(Color("blue"))
                            .clipShape(Circle())
                    }.offset(x: 112, y: -60)
                   
                }
                .padding()
                

            }
            
            
            multilineTextField(txt: $txt).cornerRadius(15)

            
            
            Text("  ").padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 40)
            
            
        }.padding().padding(.top,5)
        .sheet(isPresented: $picker){
            imagePicker(picker: self.$picker , picData: self.$picData )
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4392156863, green: 0.1058823529, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.631372549, green: 0.4078431373, blue: 1, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
//        .background(Color("accent"))
        .cornerRadius(15)
            if senddataloading{

                senddataloadingView()
            }
    }
    }
    
    
    func firetestuplad(){
//        let data = self.picData()

        // Create a reference to the file you want to upload
        let riversRef = Storage.storage().reference().child("images/\(self.title)")

        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(self.picData, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            print((error?.localizedDescription))
            return
          }
          // Metadata contains file metadata such as size, content-type.
//          let size = metadata.size
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
                print ((error?.localizedDescription))
              return
            }
            postTweet(msg: self.txt, pic: "\(url!)", collection: self.collection , title: self.title , url: "\(url!)")
          }
        }
        
    }
    }





func postTweet(msg : String ,pic :String , collection : String , title :String , url :String ){
    
    let db = Firestore.firestore()
    
    // I'm going to use default name and image url.....
    
    db.collection("pp").document().setData(["collection" : collection , "msg":msg, "pic":pic , "title" : title , "url" : url ]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            
            return
        }
        print("success")
    }
}








struct multilineTextField : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multilineTextField.Coordinator {
        
        return multilineTextField.Coordinator(parent1 : self)
    }
    func makeUIView(context: UIViewRepresentableContext<multilineTextField>) -> UITextView {
        
        let text = UITextView()
//            .cornerRadius(15)
        text.isEditable = true
        text.isScrollEnabled = true
        text.isUserInteractionEnabled = true
        text.text = "Type Something"
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multilineTextField>) {
        uiView.text = txt
        
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        
        var parent : multilineTextField
        
        init(parent1 : multilineTextField) {
            
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
       
    }
}




struct imagePicker : UIViewControllerRepresentable {
    @Binding var picker : Bool
    @Binding var picData : Data
    
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePicker.Coordinator(parent1: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController{
        let picker1 = UIImagePickerController()
        picker1.sourceType = .photoLibrary
        picker1.delegate = context.coordinator
        return picker1
        
    }
    
    func updateUIViewController(_ uiViewController : UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    class Coordinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        var parent : imagePicker
        init(parent1 : imagePicker) {
            parent = parent1
        }
        func imagePickerControllerDidCancel(_ picker : UIImagePickerController) {
            self.parent.picker.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            let picdata = image?.jpegData(compressionQuality: 0.8)
            self.parent.picData = picdata!
            self.parent.picker.toggle()
        }
       
        
    }
}




struct senddataloadingView: View {
//    @State var play = 0

      var body: some View {
          VStack{
            ZStack(){
//            Button(action: {collectionHomeUIView()}) {
//                
//                Image(systemName: "white")
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(Color("blue"))
//                    .cornerRadius(25).frame(width: 260, height: 260, alignment: .center)
//            }
              LottieView(filename: "35692-check-blue")
                  .frame(width:200, height:200)
            
//              Button("Play"){ self.play += 1 }
          }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                collectionHomeUIView()
            }
    }
    
}
        

      }
}




struct indicator : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<indicator>) -> UIActivityIndicatorView {
        let indicator1 = UIActivityIndicatorView(style: .large)
        indicator1.stopAnimating()
        return indicator1
        
    }
    func  updateUIView(_ uiView: indicator.UIViewType, context: UIViewRepresentableContext<indicator> ) {
        
    }
    
}
