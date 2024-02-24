import SwiftUI
import CoreMotion

struct PourCakeView: View {
    
    @StateObject var viewModel = PourCakeViewModel()
    
    @State private var jaClicou = false
    
    var body: some View {
        ZStack {
            Image("tableCake")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            HStack {
                
                // pan conditions
                if viewModel.timeElapsed <= 10 {
                    Image("formaVazia")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: 250, height: 100))
                    
                } else if viewModel.timeElapsed > 10 && viewModel.timeElapsed < 40 {
                    Image("formaMetade")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: 250, height: 100))
                    
                } else {
                    Image("formaCheia")
                        .scaleEffect(0.5)
                        .offset(CGSize(width: 250, height: 100))
                }
                
                // blender conditions
                if viewModel.rotation >= -25 && viewModel.timeElapsed < 40 {
                    Image("liquidCheio")
                        .scaleEffect(0.5)
                        .rotationEffect(.degrees(viewModel.rotation), anchor: .center)
                        .offset(CGSize(width: -40, height: -60))
                    
                } else if viewModel.rotation < -25 && viewModel.timeElapsed <= 25 {
                    Image("liquidVirandoComeco")
                        .scaleEffect(0.5)
                        .rotationEffect(.degrees(viewModel.rotation), anchor: .center)
                        .offset(CGSize(width: -40, height: -60))
                    
                } else if viewModel.rotation < -25 && (viewModel.timeElapsed > 20 && viewModel.timeElapsed < 40) {
                    Image("liquidVirandoFinal")
                        .scaleEffect(0.5)
                        .rotationEffect(.degrees(viewModel.rotation), anchor: .center)
                        .offset(CGSize(width: -40, height: -60))
                    
                } else {
                    Image("liquidVazio")
                        .scaleEffect(0.5)
                        .rotationEffect(.degrees(viewModel.rotation), anchor: .center)
                        .offset(CGSize(width: -40, height: -60))
                        .onAppear(perform: {
                            viewModel.isRotating = false
                        })
                }
            }
            
            if jaClicou == false {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.4))
                        .ignoresSafeArea()
                    ZStack {
                        Image("fala")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.75)
                            .ignoresSafeArea()
                        Text("Now that the dough is ready, let’s pour it in the pan.\n\nI can guarantee you that fubá cake tastes better if it’s made in a rounded pan with a hole in the middle\n\nI’ve already greased the pan for you, so all you have to do is **tilt the iPad** to pour the dough.")
                            .font(.custom("Arvo", size: 24))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color("marrom"))
                            .frame(width: 700, height: 350)
                            .offset(CGSize(width: 40, height: 0))
                            .rotationEffect(Angle(degrees: -2))

                    }
                    .offset(x: -150, y: -230)
                        .padding(.bottom)
                    Text("Tap the screen")
                        .frame(width: 200, height: 50)
                        .opacity(0.8)
                        .font(.custom("Arvo", size: 20))
                        .foregroundStyle(Color("marrom"))
                        .background(Color("amarelinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                        .offset(CGSize(width: 00, height: 80))
                }.onTapGesture {
                    jaClicou = true
                    viewModel.isRotating = true
                }
            }
            
            if viewModel.isFinished == true {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.4))
                        .ignoresSafeArea()
                    
                    ZStack {
                        Image("fala")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.7)
                            .ignoresSafeArea()
                        Text("That was easy, right?\n\nNow let me put the baking pan in the oven for you.")
                            .font(.custom("Arvo", size: 24))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color("marrom"))
                            .frame(width: 700, height: 350)
                            .offset(CGSize(width: 40, height: 0))
                            .rotationEffect(Angle(degrees: -2))
                    }
                    .offset(x: -150, y: -230)
                    
                    VStack(alignment: .trailing) {
                        NavigationLink {
                            WaitingView()
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color("marrom"))
                                .bold()
                                .font(.title)
                                .frame(width: 75, height: 75)
                                .background(Color("begezinho"))
                        }.frame(alignment: .bottom)
                        
                    }
                    .padding(50)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .frame(maxHeight: .infinity)
                    .offset(CGSize(width: 0, height: 300))
                    
                }.frame(maxWidth: .infinity).frame(maxHeight: .infinity)
            }
            
        }.background(Color("amarelinho"))
        
    }
}
