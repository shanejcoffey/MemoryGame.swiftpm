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

    @State var bestSuperEasyTimes: [Int] = []
    @State var bestEasyTimes: [Int] = []
    @State var bestMediumTimes: [Int] = []
    @State var bestHardTimes: [Int] = []

    init() {
        bestSuperEasyTimes = UserDefaults.standard.array(forKey: "bestSuperEasyTimes") as? [Int] ?? []
        bestEasyTimes = UserDefaults.standard.array(forKey: "bestEasyTimes") as? [Int] ?? []
        bestMediumTimes = UserDefaults.standard.array(forKey: "bestMediumTimes") as? [Int] ?? []
        bestHardTimes = UserDefaults.standard.array(forKey: "bestHardTimes") as? [Int] ?? []
    }

    var body: some View {
        NavigationStack {
            VStack {

                Spacer()

                Text("Welcome to Memory Game")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                Spacer().frame(height: 50)

                ZStack {
                    Capsule()
                        .frame(width: 150, height: 50)
                    NavigationLink("BEST TIMES") {
                        TimesView(
                            bestSuperEasyTimes: $bestSuperEasyTimes,
                            bestEasyTimes: $bestEasyTimes,
                            bestMediumTimes: $bestMediumTimes,
                            bestHardTimes: $bestHardTimes
                        )
                    }
                    .foregroundStyle(.white)
                }

                Spacer().frame(height: 50)

                Text("Difficulty:")
                    .font(.title2)

                Menu {
                    ForEach(
                        difficultiesDictionary.keys.sorted {
                            difficultiesDictionary[$0]! < difficultiesDictionary[$1]!
                        },
                        id: \.self
                    ) { difficulty in
                        Button {
                            difficultySelected = difficulty
                        } label: {
                            Text(difficulty)
                                .font(.title2)
                        }
                    }
                } label: {
                    HStack {
                        Text(difficultySelected)
                            .foregroundStyle(.blue)
                            .font(.title2)

                        Image(systemName: "arrowshape.down.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.blue)
                    }
                }

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue)
                        .frame(width:200, height: 100)
                    NavigationLink("Start Game") {
                        
                        if difficultySelected == "hard" {
                            GameView(
                                cards: [
                                    Card(imageName: "aceSpades"), Card(imageName: "aceSpades"),
                                    Card(imageName: "aceHearts"), Card(imageName: "aceHearts"),
                                    Card(imageName: "aceDiamonds"), Card(imageName: "aceDiamonds"),
                                    Card(imageName: "aceClubs"), Card(imageName: "aceClubs"),
                                    Card(imageName: "kingClubs"), Card(imageName: "kingClubs"),
                                    Card(imageName: "kingHearts"), Card(imageName: "kingHearts"),
                                    Card(imageName: "kingDiamonds"), Card(imageName: "kingDiamonds"),
                                    Card(imageName: "kingSpades"), Card(imageName: "kingSpades"),
                                    Card(imageName: "queenSpades"), Card(imageName: "queenSpades"),
                                    Card(imageName: "queenHearts"), Card(imageName: "queenHearts"),
                                    Card(imageName: "queenDiamonds"), Card(imageName: "queenDiamonds"),
                                    Card(imageName: "queenClubs"), Card(imageName: "queenClubs")
                                ].shuffled(),
                                numColumns: 6,
                                numRows: 4,
                                bestTimes: $bestHardTimes
                            )
                            
                        } else if difficultySelected == "medium" {
                            GameView(
                                cards: [
                                    Card(imageName: "aceSpades"), Card(imageName: "aceSpades"),
                                    Card(imageName: "aceHearts"), Card(imageName: "aceHearts"),
                                    Card(imageName: "aceDiamonds"), Card(imageName: "aceDiamonds"),
                                    Card(imageName: "aceClubs"), Card(imageName: "aceClubs"),
                                    Card(imageName: "kingClubs"), Card(imageName: "kingClubs"),
                                    Card(imageName: "kingHearts"), Card(imageName: "kingHearts"),
                                    Card(imageName: "kingDiamonds"), Card(imageName: "kingDiamonds"),
                                    Card(imageName: "kingSpades"), Card(imageName: "kingSpades")
                                ].shuffled(),
                                numColumns: 4,
                                numRows: 4,
                                bestTimes: $bestMediumTimes
                            )
                            
                        } else if difficultySelected == "easy" {
                            GameView(
                                cards: [
                                    Card(imageName: "aceSpades"), Card(imageName: "aceSpades"),
                                    Card(imageName: "aceHearts"), Card(imageName: "aceHearts"),
                                    Card(imageName: "aceDiamonds"), Card(imageName: "aceDiamonds"),
                                    Card(imageName: "aceClubs"), Card(imageName: "aceClubs")
                                ].shuffled(),
                                numColumns: 4,
                                numRows: 2,
                                bestTimes: $bestEasyTimes
                            )
                            
                        } else {
                            GameView(
                                cards: [
                                    Card(imageName: "aceSpades"), Card(imageName: "aceSpades"),
                                    Card(imageName: "aceHearts"), Card(imageName: "aceHearts")
                                ].shuffled(),
                                numColumns: 2,
                                numRows: 2,
                                bestTimes: $bestSuperEasyTimes
                            )
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                }

                Spacer()
            }
        }
    }
}
