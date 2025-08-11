import pandas as pd


def sales_analysis(product: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:
    start = pd.to_datetime('2019-01-01')
    end = pd.to_datetime('2019-03-31')
    df = sales.groupby('product_id').filter(
        lambda r:
        min(r['sale_date']) >= start and max(r['sale_date']) <= end
    )
    df.drop_duplicates(subset='product_id', inplace=True)
    return df.merge(product, on='product_id')[['product_id', 'product_name']]
