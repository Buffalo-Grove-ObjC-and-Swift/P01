# Colored Dice Game
Buffalo Grove Objective-C and Swift Meetup Repo, Building a Colored Dice Game

Target Devices: Universal iOS app, primarily targeting iPhone 5 or 6, secondarily iPad.
OS: iOS 9

Description:
This is an MVP of a specific multi-player dice game. The way the game is played is as follows. Each player takes turns rolling dice to accrue points (more on this later). Play continues until a player captures a total of 100 points or more. When a player has exceeded 100 points, every other player gets one more final turn to try and get the highest score they can. At the end of this final round, the player with the highest points is declared the winner.

### Wiki for the dev team
* [Please read the Wiki](https://github.com/Buffalo-Grove-ObjC-and-Swift/P01/wiki "Wiki") 

Equipment: 
-10 dice. These dice are six sided. The sides of the dice are as follows: 3 Green sides, 2 Yellow sides, 1 Red side. It is assumed these dice are balanced, with equally random outcomes.
-2 or more players (it is right to call a player "equipment"?)
-a scoring sheet

How a turn works:
A player starts out with 10 dice and rolls them. The player get a temporary point for every Green die rolled and the green dice are put off to the side. The player re-rolls with the remaining dice (the ones that resulted in yellow or red). Once again, the number of green dice are added to the temporary score and put off to the side. If the player ends up rolling enough greens where all 10 are green, the player gets to pick up all 10 dice and roll them again.  This continued until either: 1) the player decides to stop. This captures all of the players temporary points and this amount is added to their permanent score or 2) the player rolls dice where the dice that are rolled contain a Red without a Green. When this happens, the player loses all of their temporary points, their turn is over and no points are added to their permanent score.

Example of a turn:
Player 1 starts: 
  Available dice=10, 
    results from role = 6 Green, 3 Yellow, 1 Red
    temporary points += 6
    available dice -= 6
    Red without a Greed? = False
  
Player 1 continues:
  Available dice=6, 
    results from role = 3 Green, 0 Yellow, 3 Red
    temporary points += 3
    available dice -= 3
    Red without a Greed? = False (even though there are 3 reds, the fact that there was at least 1 green keep the turn going)
    
Player 1 continues:
  Available dice=3, 
    results from role = 0 Green, 3 Yellow, 0 Red
    temporary points += 0
    available dice -= 0
    Red without a Greed? = False (yellows don't add temporary points or end a turn)
  
Player 1 continues:
  Available dice=3, 
    results from role = 3 Green, 0 Yellow, 0 Red
    temporary points += 3
    available dice += 10 (since player got all 10 to be green, they get to now roll all 10 again)
    Red without a Greed? = False
    
Player 1 continues:
  Available dice=10, 
    results from role = 7 Green, 1 Yellow, 1 Red
    temporary points += 7
    available dice -= 7
    Red without a Greed? = False
    
Player 1 continues:
  Available dice=3, 
    results from role = 0 Green, 2 Yellow, 1 Red
    temporary points = 0
    available dice = 0
    Red without a Greed? = True (All temporary points are lost. No points are added to player's permanent score. Next player begins)

Player 2 starts: 
  Available dice=10, 
    results from role = 8 Green, 1 Yellow, 1 Red
    temporary points += 8
    available dice -= 8
    Red without a Greed? = False
    
Player 2 starts: 
  Available dice=2, 
    Player 2 chooses to stop rolling, end their turn and capture their points.
  Temporary points added to permanent points. Turn is over. Next player begins.
