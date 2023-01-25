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
            Form {
                Button("Reset", action: {
                    reset()
                })
                Text("Remaining time till hunger reset: \(remainingTime)")
                    .onReceive(timer) { _ in
                        if self.remainingTime > 0 {
                            self.remainingTime -= 1
                        }
                        if remainingTime == 0 {
                            if basicStats.stats[0].healthMeter != 0 {
                                basicStats.stats[0].hunger = 10
                                basicStats.stats[0].happiness = "Depressed"
                                remainingTime = 30
                            }
                        }
                    }
                    .foregroundColor(.red)
                
            Text("\(basicStats.stats[0].displayStats())")
            Button("Feed Henry", action: {
                feedTamagotchi()
            })
            Button("Feed Henry snack", action: {
                snackTamagotchi()
            })
            Button("Play a game", action: {
                playGame()
            })
            Button("Grow up", action: {
                growUp()
            })
            Button("Release fluids", action: {
                releaseFluids()
            })
            Button("Sick", action: {
                getSick()
            })
            Button("Heal", action: {
                heal()
            })
            Button("Suicide", action: {
                suicide()
            })
            
            }
        }
        
    }
    func feedTamagotchi() {
        if basicStats.stats[0].hunger >= 5 {
            basicStats.stats[0].hunger -= 5
            basicStats.stats[0].happiness = "Sad"
        }
        
    }
    func snackTamagotchi() {
        if basicStats.stats[0].hunger > 0 {
            basicStats.stats[0].hunger -= 1
            basicStats.stats[0].happiness = "I have been snacked"
        }
    }
    func playGame() {
        basicStats.stats[0].happiness = "Like the end of your birthday"
    }
    
    func growUp() {
        basicStats.stats[0].age += 1
        if basicStats.stats[0].age >= 100 {
            death()
        }
    }
    
    func releaseFluids() {
        if basicStats.stats[0].weight >= 10 {
            basicStats.stats[0].weight -= 10
            death()
        }
        
    }
    func getSick() {
        if basicStats.stats[0].healthMeter > 0 {
            basicStats.stats[0].healthMeter -= 1
        }
    }
    
    func heal() {
        if basicStats.stats[0].healthMeter < 5 {
            basicStats.stats[0].healthMeter += 1
        }
    }
    func suicide() {
        basicStats.stats[0].healthMeter = 0
        basicStats.stats[0].happiness = "Finally happy"
    }
    
    func death() {
        if basicStats.stats[0].age > 100 {
            basicStats.stats[0].healthMeter = 0
            basicStats.stats[0].happiness = "Died happily"
        }
        if basicStats.stats[0].weight == 0 {
            basicStats.stats[0].healthMeter = 0
            basicStats.stats[0].happiness = "Died happily"
        }
    }
    
    func reset() {
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}

