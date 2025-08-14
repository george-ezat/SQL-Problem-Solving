import pandas as pd


def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df = visits[~visits['visit_id'].isin(transactions['visit_id'])]
    df = df.groupby('customer_id', as_index=False)['visit_id'].count()
    return df.rename(columns={'visit_id': 'count_no_trans'})