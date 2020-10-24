//
//  onboardi.swift
//  HACKLIFE
//
//  Created by Haya Saleemah on 10/22/20.
//

import SwiftUI


struct onboardView: View {
    @State private var onboardinDone = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !onboardinDone {
                OnboardingViewPure(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    print("done onboarding")
                })
            } else {
//                Text("Hello world")
                ContentView11()
            }
        }
    }
}

struct onboardView_Previews: PreviewProvider {
    static var previews: some View {
        onboardView()
    }
}




struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            VStack {
            LottieView(filename: data.image ).frame(width: 350, height: 270, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(50)
//                .padding(.bottom, 50)
                
//            Image(data.image)
//                .resizable()
//                .scaledToFit()
//                .padding(.bottom, 50)
            }.padding()
//            .padding(.bottom, 50)
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.1982479393, green: 0.3144441843, blue: 0.5790199041, alpha: 1)))
//                .opacity(0.9)
                .padding(.bottom, 20)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(Color(#colorLiteral(red: 0.4218762219, green: 0.6087950468, blue: 0.821793735, alpha: 1)))
                .multilineTextAlignment(.center)
        }.padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 100)
    .padding()
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}



struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
//        17054-smartsharp-animations-volume-1
        OnboardingDataModel(image: "28573-animation", heading: "Hack your life", text: "life is short so make everything Easy Peasy Lemon Squeezy"),
        
        
        OnboardingDataModel(image: "29553-adverting-concept", heading: "Be Creative", text: "If you can't think outside of the box , think of what you can do with the box. Share Your Ideas and get inspiration from other."),
        
        OnboardingDataModel(image: "17054-smartsharp-animations-volume-1", heading: "Explore the World", text: "you will find 6 collections: (Cooking, Drawing, Gifts, Fashion,  Decoration, Technology) in app that have new and powerful ideas can make your life easy"),
//        OnboardingDataModel(image: "", heading: "Helping each other", text: "Share Your Ideas and take the inspiration from other ideas, the good idea beacomes a great idea when you let it out"),
//        OnboardingDataModel(image: "33420-teamwork-1", heading: "Work Hard", text: "Make it Easy Peasy Lemon Squeezy"),
//        34804-think-outside-the-box
//        29553-adverting-concept
        
    ]
}




struct OnboardingViewPure: View {
    var data: [OnboardingDataModel]
    var doneFunction: () -> ()

    @State var slideGesture: CGSize = CGSize.zero
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    
    
    func nextButton() {
        if self.curSlideIndex == self.data.count - 1 {
            doneFunction()
            return
        }
        
        if self.curSlideIndex < self.data.count - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }
    
    var body: some View {
        ZStack {
//            Color("marketing").edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .center) {
                ForEach(0..<data.count) { i in

                    OnboardingStepView(data: self.data[i])
                        .offset(x: CGFloat(i) * self.distance)
                        .offset(x: self.slideGesture.width - CGFloat(self.curSlideIndex) * self.distance)
                        .animation(.spring())
                        .gesture(DragGesture().onChanged{ value in
                            self.slideGesture = value.translation
                        }
                        .onEnded{ value in
                            if self.slideGesture.width < -50 {
                                if self.curSlideIndex < self.data.count - 1 {
                                    withAnimation {
                                        self.curSlideIndex += 1
                                    }
                                }
                            }
                            if self.slideGesture.width > 50 {
                                if self.curSlideIndex > 0 {
                                    withAnimation {
                                        self.curSlideIndex -= 1
                                    }
                                }
                            }
                            self.slideGesture = .zero
                        })
                }
            }
            
            
            VStack {
                Spacer()
                HStack {
                    self.progressView()
                    Spacer()
                    Button(action: nextButton) {
                        self.arrowView()
                    }
                }
            }
            .padding(20)
        }
    }
    
    func arrowView() -> some View {
        Group {
            if self.curSlideIndex == self.data.count - 1 {
//                ZStack(alignment: .center) {
                HStack {
                    Text("Let's hack it")
                        .font(.system(size: 27, weight: .medium, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.1982479393, green: 0.3144441843, blue: 0.5790199041, alpha: 1))).bold()
                }
                .frame(width: 180, height: 50)
                .background(Color(#colorLiteral(red: 0.917874217, green: 0.9409895539, blue: 1, alpha: 1)))
                .cornerRadius(25).padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 120)
                .offset(x: -100, y: 80)
//                }
            }
            else {
                
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .foregroundColor(Color(#colorLiteral(red: 0.1982479393, green: 0.3144441843, blue: 0.5790199041, alpha: 1)))
                    .scaledToFit()
                    .frame(width: 50).padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 120)
                
            }
        }
    }
    
    func progressView() -> some View {
        HStack {
            ForEach(0..<data.count) { i in
                Circle()
                    .scaledToFit()
                    .frame(width: 10).padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 100)
                    .foregroundColor(self.curSlideIndex >= i ? Color(#colorLiteral(red: 0.1982479393, green: 0.3144441843, blue: 0.5790199041, alpha: 1)) : Color(.systemGray))
                    .offset(x: 165, y: 0)
//                Color((#colorLiteral(red: 0.7978792787, green: 0.6204611659, blue: 1, alpha: 1))
            }
        }
    }
    
}

struct OnboardingViewPure_Previews: PreviewProvider {
    static let sample = OnboardingDataModel.data
    static var previews: some View {
        OnboardingViewPure(data: sample, doneFunction: { print("done") })
    }
}
