import pandas as pd


def latest_login(logins: pd.DataFrame) -> pd.DataFrame:
    df = logins.loc[logins['time_stamp'].dt.year == 2020]
    return df.groupby('user_id', as_index=False).agg(
        last_stamp=('time_stamp', 'max')
    )
