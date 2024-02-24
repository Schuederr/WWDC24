//
//  FinalView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct FinalView: View {
    
    @State private var sheetReceita = true
    @State private var sheetCredits = false
    
    let gridItems = [GridItem(), GridItem()]
    
    var body: some View {
        ZStack {
            Image("final")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ZStack {
                Image("fala")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.6)
                    .ignoresSafeArea()
                
                Text("This cake is looking delicious! You're really a gifted cook.\n\nI'm so glad that you came in today and we spent some time together.")
                    .font(.custom("Arvo", size: 24))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color("marrom"))
                    .frame(width: 600, height: 185, alignment: .topLeading)
                    .offset(x: 45, y: 15)
                    .rotationEffect(Angle(degrees: -2))
                //                    .background()
            }.offset(x: 180, y: -275)
            
            Image("bolo")
                .scaleEffect(0.4)
                .offset(CGSize(width: 170, height: 150))
                .rotationEffect(Angle(degrees: 3))
                .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
            
            //buttons
            VStack(alignment: .trailing, spacing: 20) {
                Button(action: {
                    sheetReceita.toggle()
                }, label: {
                    Text("SEE FULL RECIPE")
                        .font(.custom("VastShadow-Regular", size: 24))
                        .foregroundStyle(Color("marrom")).multilineTextAlignment(.center)
                        .frame(width: 330, height: 75)
                        .background(Color("begezinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                    
                }).sheet(isPresented: $sheetReceita, content: {
                    
                    ZStack {
                        Button(action: {
                            sheetReceita.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.bold)
                        })
                        .offset(x: -320, y: -340)
                        
                        Text("RECIPE")
                            .font(.custom("VastShadow-Regular", size: 24))
                            .foregroundStyle(Color("marrom"))
                            .padding()
                            .offset(y: -325)
                        
                        ScrollView{
                            
                            
                            
                        }.offset(y: 75)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(Color("begezinho"))
                })
                
                //CREDITS
                Button(action: {
                    sheetCredits.toggle()
                }, label: {
                    Text("Credits")
                        .font(.custom("VastShadow-Regular", size: 16))
                        .foregroundStyle(Color("begezinho")).multilineTextAlignment(.center)
                    
                        .frame(width: 125, height: 30)
                        .background(Color("marrom"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                }).sheet(isPresented: $sheetCredits, content: {
                    
                    ZStack {
                        Button(action: {
                            sheetCredits.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.bold)
                        })
                        .offset(x: -320, y: -340)
                        
                        Text("CREDITS")
                            .font(.custom("VastShadow-Regular", size: 24))
                            .foregroundStyle(Color("marrom"))
                            .padding()
                            .offset(y: -325)
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                
                                Text("Unreferenced resources on this page are owned by the author.")
                                    .font(.custom("Arvo-Bold", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 12)
                                
                                Text("Sounds")
                                    .font(.custom("VastShadow-Regular", size: 20))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                
                                Text("Music by Philanthrope, twofiveone - Move Like That https://chll.to/3cc6247d")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                
                                Text("Mini blender by Richard1052 at https://freesound.org/people/Richard1052/sounds/585770/?")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)

                                
                                //images
                                Text("Images")
                                    .font(.custom("VastShadow-Regular", size: 20))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.vertical, 12)
                                    .padding(.horizontal)
                                
                                Text("Picture from Macie Jones at Unsplash https://unsplash.com/pt-br/fotografias/tiro-proximo-da-parede-de-madeira-branca-yk9QThtWV4o")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                
                                Text("Picture from Jake Nackos at Unsplash https://unsplash.com/pt-br/fotografias/papel-de-grade-branco-e-preto-Gm9XbhjhJKE")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("MS220 Log 252, Log of the ship Washington by Coffin, James G. https://archive.org/details/ms220log252/page/n15/mode/2up")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)                                
                                Text("Picture from Pixabay: https://www.pexels.com/pt-br/foto/planta-de-folhas-marrons-em-foco-fotografia-37837/")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("Picture from Klaus Nielsen: https://www.pexels.com/pt-br/foto/ovo-branco-em-tigela-de-ceramica-preta-6294267/")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("Picture from Pawel Czerwinski at Unsplash https://unsplash.com/pt-br/fotografias/arte-abstrata-PPwMUmx4NSA")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("Picture from Peter Fazekas: https://www.pexels.com/pt-br/foto/foto-aproximada-de-girassois-1234064/")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("Picture from Vidar Nordli-Mathisen at Unsplash https://unsplash.com/pt-br/fotografias/cadeira-branca-colocada-ao-lado-da-janela-com-cortina-pzAuIypUg7I")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)

                                Text("Picture from Anna Shvets: https://www.pexels.com/pt-br/foto/ovo-em-um-fundo-vermelho-4045697/")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("German gothic fonts from Draughtsman's Alphabets by Hermann Esser (1845–1908). https://www.rawpixel.com/image/378047/free-illustration-image-gothic-church-font")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)
                                
                                Text("Ornamental fonts from Draughtsman's Alphabets by Hermann Esser (1845–1908). https://www.rawpixel.com/image/378052/free-illustration-image-vintage-letters-font")
                                    .font(.custom("Arvo", size: 14))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal)
                                    .padding(.vertical, 2)

                            }
                        }
                        .offset(y: 75)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(Color("begezinho"))
                    
                })
                
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Play again")
                        .font(.custom("VastShadow-Regular", size: 20))
                        .foregroundStyle(Color("marrom"))
                        .frame(width: 200, height: 40)
                        .background(Color("begezinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                }
                
            }
            .frame(maxWidth: .infinity)
            .offset(CGSize(width: 420, height: -40))
            
        }.background(Color("amarelo"))
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
}

#Preview {
    FinalView()
}
