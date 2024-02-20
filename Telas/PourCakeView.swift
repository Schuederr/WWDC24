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
                        .foregroundStyle(.white.opacity(0.25))
                        .ignoresSafeArea()
                    ZStack {
                        Image("fala")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.6)
                            .ignoresSafeArea()
                        VStack {
                            Text("blablablabla nao defini ainda mas vai fala pra virar o ipad")
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 650, height: 250)
                        .offset(CGSize(width: 25, height: 0))
                    }.offset(CGSize(width: -225, height: -270))
                        .padding(.bottom)
                }.onTapGesture {
                    jaClicou = true
                    viewModel.isRotating = true
                }
            }
            
            if viewModel.isFinished == true {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.25))
                        .ignoresSafeArea()
                    
                    ZStack {
                        Image("fala")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.6)
                            .ignoresSafeArea()
                        Text("blablablabla nao defini ainda mas vai fala pra virar o ipad")
                            .multilineTextAlignment(.leading)
                            .frame(width: 650, height: 250)
                            .offset(CGSize(width: 25, height: 0))
                    }.offset(CGSize(width: -225, height: -270))
                        .padding(.bottom)
                    
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
                    
                }
            }
            
        }.background(Color("amarelinho"))
        
    }
}
