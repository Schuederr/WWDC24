//
//  PourCakeViewModel.swift
//  WWDC24
//
//  Created by Natalia Schueda on 05/02/24.
//

import SwiftUI
import CoreMotion

class PourCakeViewModel: ObservableObject {
    @Published var rotation = 0.0
    @Published var timeElapsed = 0.0
    @Published var isRotating = false
    @Published var isFinished = true
        
    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    init() {
        motionManager.startDeviceMotionUpdates(to: motionQueue) { (data, error) in
            guard let data = data else {
                print("Error: \(error!)")
                return
            }
            
            let yRotation = data.attitude.pitch * 180 / Double.pi

            if self.isRotating == true {
                
                DispatchQueue.main.async {
                    //                print("rotation: \(self.rotation), yRotation \(yRotation)")
                    self.rotation = yRotation
                    
                    if self.rotation < -25 {
                        self.timeElapsed += 0.1
                        //                    print("timeElapsed: \(self.timeElapsed)")
                        
                        if self.timeElapsed >= 40 {
                            self.isFinished = true
                        }
                    }
                }
            }
            
        }
    }
}


