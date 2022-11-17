# Exercise write a function that flips a coin N times and reports the average.
import numpy as np


def get_input():
    return input("How many time you want to flip the coin? ")


def flip_coin(n: int):
    results = {
        "heads": 0,
        "tails": 0,
    }
    sides = list(results.keys())

    for i in range(n):
        results[np.random.choice(sides)] += 1

    return results
    
if __name__ == "__main__":
    n = int(get_input())
    results = flip_coin(n)
    print("Heads:" + str(results["heads"]) + ", or: " + str((int(results["heads"])/n)) + "%")
    print("Tails:" + str(results["tails"]) + ", or: " + str((int(results["tails"])/n)) + "%")

