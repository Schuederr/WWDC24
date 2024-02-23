import SwiftUI

struct ContentView: View {
    
    @ObservedObject var audioManager = AudioManager()
    @State var isPlaying = true
    
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
                
                // text, title and button
                VStack {
                    HStack {
                        Spacer()
                        if isPlaying == true {
                            Button(action: {
                                audioManager.stopAll()
                                isPlaying = false
                            }, label: {
                                Image(systemName: "speaker.slash")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.trailing, 40)
                                    .padding(.top, 24)
                            })
                        }
                        if isPlaying == false {
                            Button(action: {
                                audioManager.playAudio(for: "Move Like That")
                                isPlaying = true
                            }, label: {
                                Image(systemName: "speaker")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.trailing, 40)
                                    .padding(.top, 24)
                            })
                        }
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "ipad.landscape")
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(Color("marrom"))
                            .padding(.trailing, 2)
                        Text("Please use landscape orientation")
                            .foregroundStyle(Color("marrom"))
                    }.frame(alignment: .center)
                        .padding(.bottom, 40)
                    
                    Image("titulo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.7)
                        .padding(32)

                    /// fazer sombra (do jeito certo) e botar fonte
                    
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
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color("amarelo"))
            .navigationBarBackButtonHidden()
            .onAppear {
//                audioManager.playAudio(for: "Move Like That")
            }
    }
}

