import pandas as pd


def top_travellers(users: pd.DataFrame, rides: pd.DataFrame) -> pd.DataFrame:
    df = rides.groupby('user_id', as_index=False)['distance'].sum()
    df = df.rename(columns={'user_id': 'id', 'distance': 'travelled_distance'})
    df = df.merge(users, how='right', on='id')[['name', 'travelled_distance']]
    df['travelled_distance'].fillna(0, inplace=True)
    return df.sort_values(by=['travelled_distance', 'name'], ascending=[False, True])
