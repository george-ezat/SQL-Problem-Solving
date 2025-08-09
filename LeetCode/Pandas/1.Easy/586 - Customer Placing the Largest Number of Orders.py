import pandas as pd


def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    df = orders.groupby('customer_number', as_index=False)['order_number'].count()
    df.sort_values(by='order_number', ascending=False, inplace=True)
    return df[['customer_number']].head(1)