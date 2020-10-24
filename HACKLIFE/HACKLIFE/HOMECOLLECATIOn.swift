//
//  SwiftUIView.swift
//  FirebaseTemplate
//
//  Created by Haya Saleemah on 10/18/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
import Firebase
import CodableFirebase
import FirebaseFirestore
import SDWebImageSwiftUI
import Foundation
import UIKit

struct collectionHomeUIView: View {
    @State var selected1 = "Fashion"
    var selected2 = ""
    @State var isModal: Bool = false
    @State var showContent6 = false
    @State var showContent1 = false
    @State var showContent2 = false
    @State var showContent3 = false
    @State var showContent4 = false
    @State var showContent5 = false
  
//    @Binding var show : Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                
                    Color("coding")
        VStack(){
//            GeometryReader { geometry in
            
            HStack(spacing :15){
                VStack(){

                    ZStack(){
                Button(action: {
                        self.isModal = true
                    self.showContent1.toggle()
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent1) {
                    cookingPOST( selected : "Cooking" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "26901-cooking" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
                    }}
//                .padding(.leading)
//                Spacer()
                VStack(){
                    ZStack(){
                Button(action: {
                        self.isModal = true
//                    self.selected1 = "Drawing"
                    self.showContent2.toggle()
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent2) {
                    cookingPOST( selected : "Decoration" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "30145-working-women-in-home" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
                    }
                }
            }.padding(.horizontal).padding(.top,10).foregroundColor(.blue)
                //            .frame( width:UIScreen.main.bounds.width + 50, height: 150)
            

           
            HStack(spacing :25){
                VStack(){
                    ZStack(){
                Button(action: {
                        self.isModal = true
                    self.showContent5.toggle()
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent5) {
                    cookingPOST( selected : "Drawing" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "27600-balcony-leisure" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
//                        12937-gift-box
                    }
                    
                }
//                .padding(.leading)
//                Spacer()
                VStack(){
                    ZStack(){
                Button(action: {
                        self.isModal = true
                    self.showContent6.toggle()
                    
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent6) {
//                    TechnologyPOST( review: [])
                    cookingPOST( selected : "Technology" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "34766-modern-technologies" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
//                        "34766-modern-technologies (1)"
                    }
                    
                }
            }.padding(.horizontal).padding(.top,5)
       
            
            
            HStack(spacing :10){
                VStack(){
                    ZStack(){
                Button(action: {
                        self.isModal = true
                    self.showContent3.toggle()
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent3) {
                    cookingPOST( selected : "Fashion" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "25026-clothes-app-buying-tutorial" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
                    }
                    
                }
//                .padding(.leading)
//                Spacer()
                VStack(){
                    ZStack(){
                Button(action: {
                        self.isModal = true
                    self.showContent4.toggle()
                    }) {


//                        Text("Show Action Sheet")
                    Image("white") .resizable()
                                               .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .frame(width: geometry.size.width * 0.45, // Set width and height to a fraction of view width
//                                                       height: geometry.size.width * 0.55)
//                        .padding(.horizontal)
                    }
                .sheet(isPresented: self.$showContent4) {
                    cookingPOST( selected : "Gifts" ,review: [])
//                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                }.cornerRadius(25)
                        LottieView(filename: "14122-present" ).frame(width: 150, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
                    }
                    
                }
            }.padding(.horizontal).padding(.top,10).foregroundColor(.blue)
                //            .frame( width:UISc
            

        }.padding(.horizontal).padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 150).padding(.top,1 )

            }).edgesIgnoringSafeArea(.all)
        }
    }
}


struct collectionHomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        collectionHomeUIView()
    }
}






struct cookingPOST: View {
    @State private var showingModal = false
//     var selected = "Drawing"
    var selected = "Fashion"
    @State var imageURLList = [String]()
    @State var msg = ""
    @State var collection = ""
    @State var url = ""
    @State var pic = " "
    @State var title = " "
    @State var review : [datatype2]
    
    var body : some View{
        

                
                ScrollView(.vertical) {
                    
                    VStack(){
                        ZStack(){
                        Image("Certificate3").resizable()
                            Text(self.selected)
                                .font(.largeTitle)
                                .bold()
//                                .font(.system(size: 30, weight: .medium, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(.black).opacity(0.9).offset(x: -60 )
                        }
                    }.padding().padding(.bottom , 5)
                    
                    VStack(spacing: 25){
       
                        if review.count>0{
                            ForEach(review, id: (\.id)){thispost in
                                if thispost.collection == self.selected
                                {ZStack(){
                                VStack(spacing: 15){}.onAppear(){loadImageFromFirebase(imagePath: thispost.pic)}
                                    
                                VStack(spacing: 15){
                                    
                                    VStack(){
//                                        HStack(){
//                                        Text(thispost.collection).bold().foregroundColor(Color(.white))
                                        Text(thispost.title).bold().foregroundColor(Color(.white))
                                        Text("\(thispost.msg)").foregroundColor(Color(.white))
                                        .multilineTextAlignment(.leading).font(.system(size: 16, weight: .regular))
                                        .padding()
                                        }.padding(.trailing , 15)
//                                    }.padding(.trailing , 15)
                                if pic != nil {
                                    Button(action: { self.showingModal = true}){
                                    WebImage(url: URL(string: thispost.url) )
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
//                                    .frame(width:320 ,height: 200)
                                    .clipped()
                                        .cornerRadius(15)}}
                                    
//                                    Color(#colorLiteral(red: 0.8058480024, green: 0.7278354764, blue: 0.8901826739, alpha: 1))
//                                    Color(#colorLiteral(red: 0.7663006186, green: 0.7622330785, blue: 0.9013587832, alpha: 1)), Color(#colorLiteral(red: 0.8897310495, green: 0.6615038514, blue: 0.8798628449, alpha: 1)),Color(#colorLiteral(red: 0.6952592731, green: 0.817786634, blue: 0.9113975763, alpha: 1)),Color(#colorLiteral(red: 0.6428730488, green: 0.8598865867, blue: 0.9218227267, alpha: 1))
                                }.padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7663006186, green: 0.7622330785, blue: 0.9013587832, alpha: 1)),Color(#colorLiteral(red: 0.6428730488, green: 0.8598865867, blue: 0.9218227267, alpha: 1)), Color(#colorLiteral(red: 0.8897310495, green: 0.6615038514, blue: 0.8798628449, alpha: 1)),Color(#colorLiteral(red: 0.6952592731, green: 0.817786634, blue: 0.9113975763, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                
                                .cornerRadius(10).padding()
                                        
                                        if $showingModal.wrappedValue {
                                                      // But it will not show unless this variable is true
                                                      ZStack {
                                                          Color.black.opacity(0.4)
                                                              .edgesIgnoringSafeArea(.vertical)
                                                          // This VStack is the popup
                                                          VStack(spacing: 10) {
                                                            WebImage(url: URL(string: thispost.url) )
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit).frame(width: 300, height: 500).padding()
                                                            
                                                              Button(action: {
                                                                  self.showingModal = false
                                                              }) {
                                                                  Text("Close")
//                                                                    .background(Color(#colorLiteral(red: 0.6428730488, green: 0.8598865867, blue: 0.9218227267, alpha: 1)))
                                                                    .bold().padding().background(Color(#colorLiteral(red: 0.6428730488, green: 0.8598865867, blue: 0.9218227267, alpha: 1))).cornerRadius(25).foregroundColor(Color.white)
                                                              }.padding(.bottom , 10)
                                                          }
                                                          .frame(width: 320, height: 600)
                                                          .background(Color.white)
                                                          .cornerRadius(20).shadow(radius: 20)
//                                                        Button(action: {self.showingModal = false}) {
//
//                                                            Image(systemName: "xmark")
//                                                                .foregroundColor(.white)
//                                                                .padding(10)
//                                                                .background(Color(.black))
//                                                                .clipShape(Circle())
//                                                        }.offset(x:160 , y: 420)
                                                      }
                                                  }
                                
                                    }
                                }
//                            }
                                }
                        }else{
                            Text("please submit post").onAppear(
                            )
                            
                        }
                        
                    }.padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top).background(Color.white.opacity(0.06)).shadow(color : Color(.gray).opacity(0.09) , radius : 13 , x : -8 , y: 8 )
                      
                  
                    
                }
//                .padding()
                

                .onAppear(){
                    
                    let storage = Storage.storage().reference()
               
                    let db = Firestore.firestore()
                    
                    db.collection("pp").addSnapshotListener { (snap, err) in
                        
                        guard let documents = snap?.documents else {
                            
                            print((err?.localizedDescription)!)
                            print("there is an error \(err!)")
                            return
                        }
                        storage.downloadURL { (pic, error) in
                             if error != nil {
                                 print((error?.localizedDescription)!)
                                 return
                             }}
                        let msg = documents.map {$0["msg"]}
                        let collections = documents.map {$0["collection"]}
                        let url = documents.map {$0["url"]}
                        let pic = documents.map {$0["pic"]}
                        let title = documents.map {$0["title"]}
                        for i in 0..<msg.count{
                         
                            self.review.append(datatype2( url: url[i] as? String ?? "faild to get url" ,
                                                          msg: msg[i] as? String ?? "faild to get msg",
                                                          pic: pic[i] as? String ?? "faild to get pic",
                                                          collection: collections[i] as? String ?? "faild to get collection",
                                                          title: title[i] as? String ?? "faild to get title"))
//                            self.imageURLList.append( pic: pic[i] as? String ?? "faild to get URL")
                            print ("A URL FOR PIC",url[i])
                           
                            func downloadfireIMg(path: String){
                                let riversRef = Storage.storage().reference().child("images/\(path)")
//                                let starsRef = storageRef.child("images/stars.jpg")

                                // Fetch the download URL
                                riversRef.downloadURL { url, error in
                                  if let error = error {
                                    // Handle any errors
                                    print("Error occurred while getting thtr ulss for th eimages with url: ", url)
                                  } else {
                                    print("There is an error while downloading the imges")
                                    print ((error?.localizedDescription))
                                    // Get the download URL for 'images/stars.jpg'
                                  }
                                }
                            }
                            downloadfireIMg(path:(title[i] as? String ?? "faild to get img from images path"))
                            func downlodImage(url: String){
                                Storage.storage().reference().child(url).downloadURL{ (url, error) in
                                    if error == nil{
                                        if let url = url{
                                            DispatchQueue.main.async {
//                                                success(url)
                                            }
                                                print ((err?.localizedDescription))
                                             
                                        }
                                        else{
                                            print("Error occurred while getting thtr ulss for th eimages with url: ", url)
                                        }
                                    }
                                    else{
                                        print("There is an error while downloading the imges", error!)
                                    }
                                }
                            }
//                            Networking.downlodImage(storagePath: pic[i])
//                            downlodImage(url:(pic[i] as? String ?? "faild to get img"))
                     

                        }
//
                    }}}
                  

        
//    }
    func loadImageFromFirebase(imagePath: String) {
        let storage = Storage.storage().reference(withPath: imagePath)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success")
            let urlString = "\(url!)"
            self.imageURLList.append(urlString)
        }
    }
    
    
}
