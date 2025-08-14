import pandas as pd


def users_percentage(users: pd.DataFrame, register: pd.DataFrame) -> pd.DataFrame:
    df = register.groupby('contest_id', as_index=False)['user_id'].count()
    df['user_id'] = (df['user_id'] * 100 / users['user_id'].count()).round(2)
    df.rename(columns={'user_id': 'percentage'}, inplace=True)
    return df.sort_values(by=['percentage', 'contest_id'], ascending=[False, True])
