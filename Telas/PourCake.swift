import SwiftUI
import CoreMotion

class PourCakeViewModel: ObservableObject {
    @Published var rotation = 0.0
    @Published var isFinished = false
    @Published var timeElapsed = 0.0
        
    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    
    init() {
        motionManager.startDeviceMotionUpdates(to: motionQueue) { (data, error) in
            guard let data = data else {
                print("Error: \(error!)")
                return
            }
            
            let yRotation = data.attitude.pitch * 180 / Double.pi

            DispatchQueue.main.async {
                print("rotation: \(self.rotation), yRotation \(yRotation)")
                self.rotation = yRotation
                
                if self.rotation < -25 {
                    self.timeElapsed += 0.1
                    print("timeElapsed: \(self.timeElapsed)")
                    
                    if self.timeElapsed >= 100 {
                        self.isFinished = true
                    }
                }
            }
        }
    }
}

struct PourCakeView: View {
    @StateObject var viewModel = PourCakeViewModel()

    var body: some View {
        
        
        ZStack {
            Image("pourCake")
                .resizable()
                .aspectRatio(contentMode: .fill)
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
            
            
            HStack {
                
                Image("formaVazia")
                    .scaleEffect(0.5)
                    .offset(CGSize(width: 180, height: 130))
                
                Image("liquidCheio")
                    .scaleEffect(0.5)
                    .rotationEffect(.degrees(viewModel.rotation), anchor: .center)
                    .foregroundStyle(viewModel.isFinished ? .black : .blue)
                
                
            }
            
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
                }
            }
            .frame(width: 1100, height: 780, alignment: .bottomTrailing)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 5, y: 5)
        }.background(Color("amarelinho"))
        
    }
}
