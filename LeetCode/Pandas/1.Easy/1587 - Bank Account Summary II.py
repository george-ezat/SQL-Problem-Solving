import pandas as pd


def account_summary(users: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df = transactions.groupby('account', as_index=False)['amount'].sum()
    df = df.merge(users, on='account').loc[df['amount'] > 10000, ['name', 'amount']]
    return df.rename(columns={'amount':'balance'})