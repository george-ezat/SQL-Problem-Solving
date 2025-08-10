import pandas as pd


def not_boring_movies(cinema: pd.DataFrame) -> pd.DataFrame:
    not_boring = cinema.loc[(cinema['id'] % 2 != 0) &
                            (cinema['description'] != 'boring')]
    return not_boring.sort_values(by='rating', ascending=False)
