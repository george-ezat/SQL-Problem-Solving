import pandas as pd


def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    df = activities.groupby('sell_date', as_index=False).agg(
        num_sold=('product', 'nunique'),
        products=('product', lambda s: ','.join(sorted(set(s))))
    )
    return df
