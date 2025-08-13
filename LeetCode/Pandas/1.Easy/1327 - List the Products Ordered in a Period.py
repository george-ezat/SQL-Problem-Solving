import pandas as pd


def list_products(products: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = orders[orders['order_date'].between('2020-02-01', '2020-02-29')]
    df = df.groupby('product_id', as_index=False)['unit'].sum()
    df = df.merge(products, on='product_id')
    return df.loc[df['unit'] >= 100, ['product_name', 'unit']]
