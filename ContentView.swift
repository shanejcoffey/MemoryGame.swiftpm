import SwiftUI

struct ContentView: View {
    
    @State var numCards: Int = 4
    
    let difficultiesDictionary: [String: Int] = [
        "super easy": 4,
        "easy": 8,
        "medium": 16,
        "hard": 24
    ]
    
    @State var difficultySelected: String = "super easy"
    @State var rows = 2
    @State var columns = 2
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Welcome to memory game")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Text("select num cards here")
                
                ZStack {
                    Menu {
                        // this sorts it by the number that is gotten from the dictionary
                        ForEach(difficultiesDictionary.keys.sorted { lhs, rhs in
                            difficultiesDictionary[lhs]! < difficultiesDictionary[rhs]!
                        }, id: \.self) { difficulty in
                            Button {
                                difficultySelected = difficulty
                            } label: {
                                HStack {
                                    Image("\(difficulty)Image")
                                    Text(difficulty)
                                }
                            }
                        }
                    } label: {
                        HStack{
                            Text(difficultySelected)
                                .foregroundStyle(.blue)
                            
                            Image(systemName: "arrowshape.down.fill")
                                .resizable()
                                .frame(maxWidth: 20, maxHeight: 20)
                                .foregroundStyle(.blue)
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: 190, maxHeight: 150)
                                .foregroundStyle(.cyan)
                            
                            NavigationLink("Single player", destination: GameView(columns: columns, rows: rows, amountOfCards: $numCards))
                                .foregroundStyle(.black)
                                .font(.title)
                                .bold()
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: 190, maxHeight: 150)
                                .foregroundStyle(.cyan)
                            
                            Text("Single player")
                                .foregroundStyle(.black)
                                .font(.title)
                                .bold()
                        }
                    }

                }
                
                Spacer()
            }
        }
    }
    func rowAndColumn(){
        if difficultySelected == "super easy"{
            rows = 2
            columns = 2
        }
        if difficultySelected == "easy"{
            rows = 4
            columns = 2
        }
        if difficultySelected == "medium"{
            rows = 4
            columns = 4
        }
        if difficultySelected == "hard"{
            rows = 4
            columns = 6
        }
    }
}
