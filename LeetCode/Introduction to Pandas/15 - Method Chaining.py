import pandas as pd


def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    big_animals = animals[animals['weight'] > 100]
    return big_animals.sort_values(by='weight', ascending=False)[['name']]