import pandas as pd


def reformat_table(department: pd.DataFrame) -> pd.DataFrame:
    months = ['Jan', 'Feb', 'Mar',
              'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep',
              'Oct', 'Nov', 'Dec']

    df = department.pivot_table(index='id', columns='month', values='revenue')
    df = df.reindex(columns=months).rename(columns=lambda month: month + '_Revenue')

    return df.reset_index()
