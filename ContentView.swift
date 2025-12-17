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
                            
                            NavigationLink("Single player"){
                                if difficultySelected == "hard"{
                                    GameView(cards: [Card(imageName: "aceSpades"), Card(imageName: "aceSpades"), Card(imageName: "aceHearts"), Card(imageName: "aceHearts"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingSpades"),
                                        Card(imageName: "kingSpades"),
                                        Card(imageName: "aceSpades"),
                                        Card(imageName: "aceSpades"),
                                        Card(imageName: "aceHearts"),
                                        Card(imageName: "aceHearts"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingSpades"),
                                        Card(imageName: "kingSpades")], numColumns: 6, numRows: 4)
                                } else if difficultySelected == "medium"{
                                    GameView(cards: [Card(imageName: "aceSpades"), Card(imageName: "aceSpades"), Card(imageName: "aceHearts"), Card(imageName: "aceHearts"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingClubs"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingHearts"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingDiamonds"),
                                        Card(imageName: "kingSpades"),
                                        Card(imageName: "kingSpades")], numColumns: 4, numRows: 4)
                                } else if difficultySelected == "easy"{
                                    GameView(cards: [Card(imageName: "aceSpades"), Card(imageName: "aceSpades"),
                                        Card(imageName: "aceHearts"),
                                        Card(imageName: "aceHearts"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceDiamonds"),
                                        Card(imageName: "aceClubs"),
                                        Card(imageName: "aceClubs")], numColumns: 4, numRows: 2)
                                } else {
                                    GameView(cards: [
                                        Card(imageName: "aceSpades"), Card(imageName: "aceSpades"), Card(imageName: "aceHearts"), Card(imageName: "aceHearts")], numColumns: 2, numRows: 2)
                                }
                               
                            }
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
        if difficultySelected == "hard"{
            rows = 4
            columns = 6
        } else if difficultySelected == "medium"{
            rows = 4
            columns = 4
        } else if difficultySelected == "easy"{
            rows = 2
            columns = 4
        } else {
            rows = 2
            columns = 2
        }
    }
}
