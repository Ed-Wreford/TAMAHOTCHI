//
//  ContentView.swift
//  Tamagotchi
//
//  Created by Wreford, Edward (PGW) on 24/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var basicStats = BasicStats()
    @State private var remainingTime = 30
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                    if remainingTime == 0 {
                        basicStats.stats[0].hunger = 10
                        basicStats.stats[0].happiness = "Depressed"
                        remainingTime = 30
                    }
                }
                .foregroundColor(.red)
            
            Text("\(basicStats.stats[0].displayStats())")
            Button("Feed Henry", action: {
                feedTamagotchi()
            })
        }
    }
    
    func feedTamagotchi() {
        
        basicStats.stats[0].hunger -= 5
        basicStats.stats[0].happiness = "Sad"
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}

