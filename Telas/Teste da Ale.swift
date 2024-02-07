import SwiftUI

struct Teste: View {
    @State private var dragOffsets: [CGSize] = Array(repeating: .zero, count: 6)
    @State private var positions: [CGSize] = Array(repeating: .zero, count: 6)
    @State private var isRectVisible: [Bool] = Array(repeating: true, count: 6)
    let circlePosition: CGPoint = CGPoint(x: 200, y: 200) // Corrected to CGPoint
    
    var body: some View {
        ZStack {
            ForEach(0..<6) { index in
                if isRectVisible[index] {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .offset(x: positions[index].width + dragOffsets[index].width,
                                y: positions[index].height + dragOffsets[index].height)
                        .gesture(DragGesture()
                            .onChanged { value in
                                dragOffsets[index] = value.translation
                            }
                            .onEnded { value in
                                positions[index].width += value.translation.width
                                positions[index].height += value.translation.height
                                dragOffsets[index] = .zero
                                
                                // Check if the center of the rectangle is inside the circle
                                let rectCenter = CGPoint(x: positions[index].width + 50, y: positions[index].height + 50)
                                if circleContainsPoint(rectCenter) {
                                    isRectVisible[index] = false
                                }
                            }
                        )
                }
            }
            
            Circle()
                .frame(width: 100, height: 100)
                .position(circlePosition)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func circleContainsPoint(_ point: CGPoint) -> Bool {
        let distance = sqrt(pow(point.x - circlePosition.x, 2) + pow(point.y - circlePosition.y, 2))
        return distance < 50 // Adjust the distance threshold as needed
    }
}
struct Teste_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}



