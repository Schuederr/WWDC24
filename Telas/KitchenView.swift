//
//  KitchenView.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI

struct KitchenView: View {
    
    // tirar animaçao depois que abrir
    
    @State private var sheetFolhinha = false
    @State private var sheetBarco = false
    @State private var sheetFuba = false
    @State private var sheetRetrato = false
    
    @State private var isAnimating: Bool = false
    
    @State private var vovo = true
    
    @State private var abriuFolhinha = false
    @State private var abriuBarco = false
    @State private var abriuFuba = false
    @State private var abriuRetrato = false
    
    var body: some View {
        ZStack {
            Image("cozinha")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            //buttons
            VStack {
                //folhinha e barco
                HStack {
                    Button(action: {
                        sheetFolhinha.toggle()
                    }, label: {
                        Image("folhinha")
                            .scaleEffect(0.5)
                            .blur(radius: abriuFolhinha ? 3.0 : 0.0)
                    })
                    .frame(width: 120, height: 220)
                    .offset(CGSize(width: -150, height: -150))
                    .sheet(isPresented: $sheetFolhinha, onDismiss: { abriuFolhinha = true }, content: {
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    sheetFolhinha.toggle()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title3)
                                        .fontWeight(.bold)
                            })
                                .padding(.top)
                                .padding(.leading)
                                
                                Spacer()
                            }
                            
                            
                            Text("HEALTH BENEFITS OF FUBÁ")
                                .font(.custom("VastShadow-Regular", size: 32))
                                .foregroundStyle(Color("marrom"))
                                .padding()
                            
                            ScrollView {
                                VStack {
                                    
                                    Image("health")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.vertical)
                                        .padding(.horizontal, 32)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                                    
                                    Text("""
In addition to being **a great source of energy**, fubá brings significant health benefits.

It is rich in niacin (vitamin B3), zinc, and iron, and also provides potassium, phosphorus, and magnesium.

Fubá is known for providing fiber, which is great for your gut health. It also can **reduce the risk** of *obesity, heart diseases, and diabetes.*

Good news for those with celiac disease: **fubá does not contain gluten!**

The food is also recommended for pregnant women as it is a source of folic acid, essential for the proper formation of the baby.
""")
                                        .font(.custom("Arvo", size: 20))
                                        .foregroundStyle(Color("marrom"))
                                        .padding(.horizontal, 32)
                                        .padding(.top, 16)
                                }.padding(.bottom, 20)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color("begezinho"))
                    })
                    
                    .task {
                        withAnimation(.bouncy(duration: 0.65).repeatForever()) {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                    
                    Button(action: {
                        sheetBarco.toggle()
                    }, label: {
                        Image("barco")
                            .scaleEffect(0.5)
                            .blur(radius: abriuBarco ? 3.0 : 0.0)
                    })
                    .frame(width: 140, height: 225)
                    .offset(CGSize(width: 250, height: -100))
                    .sheet(isPresented: $sheetBarco, onDismiss: { abriuBarco = true }, content: {
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    sheetBarco.toggle()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                })
                                .padding(.top)
                                .padding(.leading)
                                Spacer()
                            }
                            
                            Text("FUBÁ HISTORY")
                                .font(.custom("VastShadow-Regular", size: 30))
                                .foregroundStyle(Color("marrom"))
                                .padding()
                            
                            ScrollView{
                                
                                Image("barco")
                                    .scaleEffect(0.8)
                                
                                Text("""
The history of fubá dates back to the **colonial past of Latin American countries.**

Indigenous peoples revered this food as something sacred before the arrival of the Spanish and Portuguese on the continent.

As colonization progressed and economic shifts occurred, it became a **traditional food** in the region, considered a staple in the economy.

In the context of **Brazilian history**, Portuguese colonizers heavily relied on fubá for the preparation of various dishes, which *persist in popularity throughout the country to this day*.
""")
                                    .font(.custom("Arvo", size: 20))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal, 32)
                                    .padding(.top, 16)
                            }.padding(.bottom, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color("begezinho"))

                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.7).repeatForever()) {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                }
                
                // fuba e retrato
                HStack {
                    Button(action: {
                        sheetFuba.toggle()
                    }, label: {
                        Image("sacoFuba")
                            .scaleEffect(0.5)
                            .blur(radius: abriuFuba ? 3.0 : 0.0)
                    })
                    .frame(width: 135, height: 165)
                    .offset(CGSize(width: -20, height: -60))
                    .sheet(isPresented: $sheetFuba, onDismiss: { abriuFuba = true }, content: {
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    sheetFuba.toggle()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                })
                                .padding(.top)
                                .padding(.horizontal)
                                Spacer()
                            }
                            
                            Text("WHAT IS FUBÁ")
                                .font(.custom("VastShadow-Regular", size: 30))
                                .foregroundStyle(Color("marrom"))
                                .padding()
                            
                            ScrollView{
                                Image("milhoPilha")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                                
                                Text("""
*Fubá* (pronounced like *foo-bah*) is a word of African origin that means *flour*.

In Brazilian lands, it refers to a **type of cornmeal deeply rooted in Brazilian cuisine.**

This product results from the grinding of degerminated corn, resulting in a finer-flaked flour that absorbs more water than regular cornmeal.

There are three distinct varieties of fubá, each differing in thickness and culinary applications: the traditional fubá, fubá mimoso and semolina.
""")
                                    .font(.custom("Arvo", size: 20))
                                    .foregroundStyle(Color("marrom"))
                                    .padding(.horizontal, 32)
                                    .padding(.top, 16)
                            }.padding(.bottom, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color("begezinho"))

                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.6).repeatForever()) {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                    
                    //retrato
                    Button(action: {
                        sheetRetrato.toggle()
                    }, label: {
                        Image("retrato")
                            .scaleEffect(0.5)
                            .blur(radius: abriuRetrato ? 3.0 : 0.0)
                    })
                    .frame(width: 140, height: 50)
                    .offset(CGSize(width: 400, height: -10))
                    .sheet(isPresented: $sheetRetrato, onDismiss: { abriuRetrato = true }, content: {
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    sheetRetrato.toggle()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                })
                                .padding(.top)
                                .padding(.leading)
                                Spacer()
                            }
                            
                            Text("FUBÁ AND BRAZILIAN CULTURE")
                                .font(.custom("VastShadow-Regular", size: 24))
                                .foregroundStyle(Color("marrom"))
                                .padding()
                            
                            ScrollView{
                                Image("culture")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 32)
                                    .padding(.vertical)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                                
                                Text("""
Fubá plays a fundamental role in crafting a wide variety of dishes, such as cakes, bread, puddings, *angu* and *polenta*.

It is worth mentioning that many of these recipes are **meant to be shared**. Fubá cake, in particular, has become a tradition during the popular Brazilian festivities known as *festas juninas*, which take place annually in June.

Food has the **unique power** to build bonds with cherished people and places, to evoke memories and to connect to the history of a nation.

*Fubá carries within it flavors that transport us to a grandmother's home, to a specific time of the year, to festive celebrations, to historical echoes, and to **Brazil itself**.*
""")
                                .font(.custom("Arvo", size: 20))
                                .foregroundStyle(Color("marrom"))
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                                
                            }.padding(.bottom, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color("begezinho"))

                    })
                    .task {
                        withAnimation(.bouncy(duration: 0.75).repeatForever()) {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1.0 : 0.98)
                }
            }.frame(maxWidth: .infinity)
            
            if vovo == true {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.4))
                        .ignoresSafeArea()
                    
                    HStack {
                        Image("vovo")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                            .offset(CGSize(width: 100, height: 110))
                        
                        ZStack {
                            Image("fala")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.9)
                                .ignoresSafeArea()
                            
                                Text("Hi, kid! I'm so happy you're here to bake a **bolo de fubá** with me.\n\n*Bolo* is portuguese for *cake*, you know.\n\n And *fubá*, well... You'll find out what it means if you **explore my kitchen** while I grab the ingredients for our fubá cake.")
                                    .font(.custom("Arvo", size: 22))
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(Color("marrom"))
                                    .frame(width: 670, height: 245, alignment: .topLeading)
                                    .offset(CGSize(width: 40, height: 8))
                                    .rotationEffect(Angle(degrees: -2))
                            
                        }.offset(CGSize(width: 10.0, height: -250))
                    }
                    
                    Text("Tap the screen")
                        .frame(width: 200, height: 50)
                        .opacity(0.8)
                        .font(.custom("Arvo", size: 20))
                        .foregroundStyle(Color("marrom"))
                        .background(Color("amarelinho"))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
                        .offset(CGSize(width: 100, height: 80))
                    
                }.onTapGesture {
                    vovo = false
                }
                
            }
            
            if (abriuFolhinha == true) && (abriuBarco == true) && (abriuFuba == true) && (abriuRetrato == true) {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.4))
                        .ignoresSafeArea()
                    
                    HStack {
                        Image("vovo")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                            .offset(CGSize(width: 100, height: 110))
                        
                        ZStack {
                            Image("fala")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.9)
                                .ignoresSafeArea()
                            VStack {
                                Text("It's interesting how fubá is something so common in our daily lives in Brazil, but we don't usually think about it.\n\nAnyway... The ingredients are waiting for us.\n\n**Let’s start baking!**")
                                    .font(.custom("Arvo", size: 22))
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(Color("marrom"))
                            }
                            .frame(width: 670, height: 210, alignment: .topLeading)
                            .offset(CGSize(width: 40, height: 8))
                            .rotationEffect(Angle(degrees: -2))
                        }.offset(CGSize(width: 10.0, height: -250))
                    }
                    
                    VStack(alignment: .trailing) {
                        NavigationLink {
                            CakeView()
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
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("amarelinho"))
    }
}

#Preview {
    KitchenView()
}
