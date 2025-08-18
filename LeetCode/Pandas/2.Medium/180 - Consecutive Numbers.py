import pandas as pd


def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:
    logs['prev'] = logs['num'].shift(1)
    logs['prev2'] = logs['num'].shift(2)
    return logs.loc[
        (logs['num'] == logs['prev']) & (logs['prev'] == logs['prev2']), ['num']
    ].drop_duplicates().rename(columns={'num': 'ConsecutiveNums'})