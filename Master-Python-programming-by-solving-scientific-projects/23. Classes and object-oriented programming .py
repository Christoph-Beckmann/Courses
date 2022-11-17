# OOP (object-oriented programming)

class Experiment(object):
    def __init__(self, eType, dataCount, status="ongoing"):
        self.expType = eType
        self.dataCount = dataCount
        self.expStatus = status

    def increase_dataN(self, number):
        self.dataCount += number

    def change_ExpStatus(self, status):
        self.expStatus = status

    def __str__(self):
        return "Experiment type: " + self.expType + " has " + str(self.dataCount) + " data points."

if __name__ == "__main__":
    myExperiment = Experiment("Brain Experiment", 120)
    print(myExperiment)


# Exercise
## create a class to store information about your board game hobby.
### the class must contain information about:
#### the name of the board game
#### the number of times you've played
#### and the number of times you've won.
### and the following methods
#### update N plays and N wins
#### print out outcome of last game (win/lose)

## create at least two different instances to make sure it works.


class Boardgame(object):
    def __init__(self,name,nGames,nWins):
        self.name = name
        self.nGames = nGames
        self.nWins = nWins
    
    def update_nGames(self, increase_count, increase_win):
        if increase_win > increase_count:
            print("False input. Check it")
        else:
            self.nGames += increase_count
            self.nWins += increase_win
    
    def __str__(self):
        return "The game " + self.name + " completed " + str(self.nGames) + " games, with a total of " + str(self.nWins) + " victories!"
