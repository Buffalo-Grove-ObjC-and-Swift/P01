import Darwin

//Our Dice object
struct Dice {
    var upSideColor = String()
}

var turnScore = 0
let numberOfDice = 10
var diceLeft = numberOfDice

//Couple of Helper Methods below
func rollDice(numberOfDice:Int) -> [Dice] {
    var diceRolled = [Dice]()
    let colorArray: [String] = ["red", "yellow", "yellow", "green", "green", "green"]
    for _ in 1...numberOfDice {
        let diceRoll = Int(arc4random_uniform(6))
        let currentDice = Dice(upSideColor: colorArray[diceRoll])
        diceRolled.append(currentDice)
    }
    return diceRolled
}

func calculateRollScore (diceRolled:[Dice]) -> Int {
    var rollScore = 0
    var redDicePresent = false
    for dice in diceRolled {
        if dice.upSideColor=="green" {
            rollScore++
            diceLeft--
        } else if dice.upSideColor=="red" {
            redDicePresent = true
        }
    }
    if rollScore == 0 && redDicePresent == true {
        rollScore = -1
    }
    return rollScore
}

//Main Method that simulates roll in a turn
func makeTurnRoll() -> Bool{
    var rollScore = 0
    var turnIsOver = false
    if diceLeft == 0 {
        diceLeft = numberOfDice
        print("Dice spent, starting with \(diceLeft) dice again")
    }
    rollScore = calculateRollScore(rollDice(diceLeft))
    if rollScore > -1 {
        turnScore+=rollScore
        print("Current roll score \(rollScore)")
    } else {
        print("💩 Better luck next time!")
        rollScore = 0
        turnScore = 0
        turnIsOver = true
    }
    print("Current turn score \(turnScore)")
    print("Dice left \(diceLeft)")
    print("===============================")
    return turnIsOver
}

//Lines below just for testing purposes. They allow rolling the dice until you win or lose.
while makeTurnRoll() == false && turnScore<=100 {
   print("Rolling 🎲 again...")
}
if turnScore >= 100 {
    print("🍀Congratulations, you won!🍀")
}




