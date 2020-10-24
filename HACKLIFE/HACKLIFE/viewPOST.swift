//
//  viewPOST.swift
//  FirebaseTemplate
//
//  Created by Haya Saleemah on 10/15/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
import Firebase
import CodableFirebase
import FirebaseFirestore
import SDWebImageSwiftUI
import Foundation
import UIKit

//import FirebaseStorage
import Combine

import UserNotifications

struct datatype2 : Identifiable {
    
    var id = UUID()
    var url : String
    var msg : String
    var pic : String
    var collection : String
    var title : String
}

struct viewPOST: View {

     var selected = ""
    @State var imageURLList = [String]()
    @State var msg = ""
    @State var collection = ""
    @State var url = ""
    @State var pic = " "
    @State var title = " "
    @State var review : [datatype2]
    
    var body : some View{
        
//        NavigationView{
                
                ScrollView(.vertical) {
                    
                    VStack(spacing: 25){
                            
                            Spacer(minLength: 0)
                        if review.count>0{
                            ForEach(review, id: (\.id)){thispost in
                             
                                VStack(spacing: 15){}.onAppear(){loadImageFromFirebase(imagePath: thispost.pic)}
                                VStack(spacing: 15){
                                    
                                    VStack(){

                                        Text(thispost.collection).bold()
                                        Text(thispost.title).bold().foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                                    Text("\(thispost.msg)|| \(thispost.collection)|| \(thispost.title)")
                                        .multilineTextAlignment(.leading).font(.system(size: 15, weight: .regular))
                                        .padding()
                                        }.padding(.trailing , 15)

                                if pic != nil {
//                                WebImage
                                    WebImage(url: URL(string: thispost.url) )
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
//                                    .frame(width:320 ,height: 200)
                                    .clipped()
                                    .cornerRadius(15)}
                                    
                                    
                                }.padding().background(Color("Color"))
                                .cornerRadius(10).padding()
          
                                }
                        }else{
                            Text("please submit post").onAppear(
                            )
                            
                        }
                        
                        }.padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top).background(Color.white.opacity(0.06))
                      
                  
                    
                }.padding(.bottom, 100)

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
                     

                        }

                    }}}
                  

        

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

struct viewPOST_Previews: PreviewProvider {
    static var previews: some View {
        viewPOST( review: [])
    }
}



