import SwiftUI

struct ContentView: View {
    var body: some View {
            
            ZStack {
                //images
                VStack{
                    HStack {
                        Image("milho")
                            .frame(width: 375, height: 268)
                        //                            .resizable()
                        //                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.5)
                            .clipped()
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Image("formaVazia")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(0.5)
                            .rotationEffect(Angle(degrees: -20))
                            .clipped()
                    }
                }
                
                .frame(maxWidth: .infinity)
                
                // text, title and button
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "ipad.landscape")
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(Color("marrom"))
                            .padding(.trailing, 2)
                        Text("Please use landscape orientation")
                            .foregroundStyle(Color("marrom"))
                        Spacer()
                        Image(systemName: "speaker.slash")
                            .padding(.trailing)
                    }
                    
                    Image("titulo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.5)
                    NavigationLink {
                        MsgView()
                    } label: {
                            VStack {
                                Text("START")
                                    .font(.custom("VastShadow", size: 36))
                                    .foregroundStyle(Color("marrom"))
                            }
                            .frame(width: 250, height: 75)
                        .background(Color("begezinho"))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color("amarelo"))
        }
    }

