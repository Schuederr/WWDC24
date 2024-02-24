import SwiftUI

struct ContentView: View {
    
    @ObservedObject var audioManager = AudioManager()
    
    var body: some View {
            ZStack {
                //images
                VStack{
                    HStack {
                        Image("milho")
                            .frame(width: 400, height: 400)
                            .scaleEffect(0.7)
                            .edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Image("formaVazia")
                            .frame(width: 340, height: 200)
                            .scaleEffect(0.7)
                            .rotationEffect(Angle(degrees: -25))
                            .edgesIgnoringSafeArea(.all)
                    }
                }
                
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "rectangle.landscape.rotate")
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(Color("marrom"))
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.trailing, 2)
                            Text("Please use landscape orientation")
                                .foregroundStyle(Color("marrom"))
                                .font(.custom("Arvo", size: 20))
                        }.padding()
                    }
                    Spacer()
                    
                }
                
                VStack {
                    Image("titulo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.7)
                        .padding(32)
                    
                    NavigationLink {
                        MsgView()
                    } label: {
                        VStack {
                            Text("START")
                                .font(.custom("VastShadow-Regular", size: 36))
                                .foregroundStyle(Color("marrom"))
                        }
                        .frame(width: 250, height: 75)
                        .background(Color("begezinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color("amarelo"))
            .navigationBarBackButtonHidden()
            .onAppear {
                audioManager.stopAll()
//                audioManager.playAudio(for: "Move Like That", loop: true)
            }
    }
}

