import pandas as pd


def find_valid_serial_products(products: pd.DataFrame) -> pd.DataFrame:
    return products.loc[products['description'].str.contains(r'\bSN[0-9]{4}-[0-9]{4}\b')].sort_values(by='product_id')
