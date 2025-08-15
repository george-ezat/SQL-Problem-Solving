import pandas as pd


def count_followers(followers: pd.DataFrame) -> pd.DataFrame:
    return followers.groupby('user_id', as_index=False).agg(
        followers_count=('follower_id', 'count')
    ).sort_values(by='user_id')
