import pandas as pd


def average_selling_price(prices: pd.DataFrame, units_sold: pd.DataFrame) -> pd.DataFrame:
    df = prices.merge(units_sold, on='product_id', how='left')
    df['purchase_date'].fillna(df['start_date'], inplace=True)

    df = df[df['purchase_date'].between(df['start_date'], df['end_date'])]
    df['price'] = df['units'] * df['price']
    df = df.groupby('product_id', as_index=False)[['price', 'units']].sum()

    df.loc[df['units'] == 0, 'units'] = 1

    df['average_price'] = (df['price'] / df['units']).round(2)
    return df[['product_id', 'average_price']]


# if a product has no sales:
# - the units column will equal null after merging
# - the price column will equal null after multiplying by units
# - the price and units columns will equal 0 after aggregating the groups
# so when we assign its units to 1, the average will be (0 / 1) = 0