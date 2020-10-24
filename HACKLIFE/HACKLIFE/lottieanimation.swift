//
//  lottieanimation.swift
//  HACKLIFE
//
//  Created by Haya Saleemah on 10/19/20.
//
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  let animationView = AnimationView()
    var loopMode: LottieLoopMode = .playOnce
    var filename = "LottieLogo2"
    func makeUIView(context: UIViewRepresentableContext<LottieView>) ->  UIView {
        let view = UIView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                             ])
        return view

    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {

    }


}
//
//
//import SwiftUI
//import Lottie
//
//struct LottieView: UIViewRepresentable {
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    var name: String!
//    @Binding var play:Int
//
//    var animationView = AnimationView()
//    var loopMode: LottieLoopMode = .playOnce
//    class Coordinator: NSObject {
//        var parent: LottieView
//
//        init(_ animationView: LottieView) {
//            self.parent = animationView
//            super.init()
//        }
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
//        let view = UIView()
//
//        animationView.animation = Animation.named(name)
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//
//        NSLayoutConstraint.activate([
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
//        ])
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
//        animationView.play()
//    }
//}


struct LottieButton: UIViewRepresentable {

    typealias UIViewType = UIView
    let animationView = AnimatedButton()
//    var loopMode: LottieLoopMode = .playOnce
    let filename: String
    let action: () -> Void

    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
        let view = UIView()
       
        let animation = Animation.named(filename)
        animationView.animation = animation
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieButton>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    class Coordinator: NSObject {
        let parent: LottieButton

        init(_ parent: LottieButton) {
            self.parent = parent
            super.init()
            parent.animationView.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }

        
        @objc func touchUpInside() {
            parent.action()
        }
    }
}
