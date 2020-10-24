//
//  TOPTopicsSwiftUIView.swift
//  FirebaseTemplate
//
//  Created by Haya Saleemah on 10/14/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct TOPTopicsSwiftUIView: View {
    var body: some View {
        
        topt()
    }
}

struct TOPTopicsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TOPTopicsSwiftUIView()
    }
}

struct topt : View {
    
    @State var data = [

        Card(id: 0, image: "cooking22", title: "cute baking ", details: " Ingredients: *  1/4 cup of sugar  * 1 cup of milk  * 2 cups flour  * 1/4 cup of oil  * 2 teaspoons yeast * 3/4 cup of warm water * 24 Kiri square \n  Directions: 1. In a large bowl, mix all the ingredients together using your hand, until forming a ball with the dough. 2. Using your hands, form small balls with the dough. Slightly spread each ball until it’s 5 cm long. 2. Place a walnut, kiri cheese, and roll them around to shape small buns. 3.Place the comb in a preheated oven at 180°C (356°F) and bake for 10 minutes or until it’s golden brown. 4.After that draw on it using food coloring markers", expand: false),
        
        Card(id: 1, image: "websit", title: "Sketch 2 Code", details: "Sketch 2 Code websit help you to transform any hands-drawn design into a HTML code with AI.", expand: false),
        
        Card(id: 2, image: "Image-35", title: "Artificial Potted Plant", details: "you can make your own Artificial Potted Plant by just stones ,pot ,color and brush as you can see in the picture.", expand: false),
        
        Card(id: 3, image: "Image-34", title: "Design your Gergean", details: "you need jar, small toy, resin, color and brush so follow the steps stick the toy in the top ot the jar as you can see in picture then painted with your favorite color .", expand: false),
        
        Card(id: 4, image: "Image-17", title: "Tray in new design", details: "you can use any CD and cut it in small pieces and stick it in the tray as you cn see in picture so new we have a new tray in beautiful design.", expand: false),
        
        Card(id: 5, image: "Image-36", title: "Succulent Doodle Ideas", details: " The drawing is easy now. here is small steps to make drawing easy ", expand: false)
    ]
    
    @State var hero = false
    
    var body: some View{
        
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 17) {
                            
                            Text("  ")
                            
                            Text("Top Topics")
                                .font(.title)
                                .fontWeight(.bold).foregroundColor(.black).opacity(0.9)
//                                .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                        }.padding(.bottom ,2)
                        
                       
                        LottieView(filename: "16555-firery-passion" ).frame(width: 200, height: 200).cornerRadius(50).padding()

                    }
                    .padding(.bottom ,2)
                    
                    VStack(spacing: 15){
                        
                    
                        
                        ForEach(0..<self.data.count){i in
                            
                            GeometryReader{g in
                             
                                CardView(data: self.$data[i], hero: self.$hero)
                                    
                              
                                .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                    
                                
                                .opacity(self.hero ? (self.data[i].expand ? 1 : 0) : 1)
                              
                                    
                                .onTapGesture {
                                
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                        
                                        if !self.data[i].expand{
                                            
                                            // opening only one time then close button will work...
                                            self.hero.toggle()
                                            self.data[i].expand.toggle()
                                        }
                                    }
    
                                }
                                
                            }
//
                            .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 250)
                                
                            
                            .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 500).onChanged({ (_) in
                                    
                                    print("dragging")
                            }))
                        }
                    }
                }.padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 90)
                
            }
        }
    }
}



struct CardView : View {
    
    @Binding var data : Card
    @Binding var hero : Bool
    
    var body: some View{
        
        

        
        ZStack(alignment: .topTrailing){
            
            VStack{
                
                Image(self.data.image)
                .resizable()

                .frame(height: self.data.expand ? 350 : 250)
                .cornerRadius(self.data.expand ? 0 : 25)
                
                if self.data.expand{
                    
                    HStack{
                        
                        Text(self.data.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text(self.data.details)
                        .padding(.horizontal)
                    
//
                    Spacer(minLength: 0)
                    
//
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20)
        
            .contentShape(Rectangle())
            
            
            if self.data.expand{
                
                Button(action: {
                   
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        
                        self.data.expand.toggle()
                        self.hero.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                    
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.trailing,10)
            }
        }
    }
}




struct Card : Identifiable {
    
    var id : Int
    var image : String
    var title : String
    var details : String
    var expand : Bool
}












