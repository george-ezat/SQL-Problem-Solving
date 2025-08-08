import pandas as pd


def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    cu_or = orders['customerId']
    no_or = customers.loc[~customers['id'].isin(cu_or), ['name']]
    return no_or.rename(columns={'name': 'Customers'})


# or


def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    cu_or = customers.merge(
        orders,
        how='left',
        left_on='id',
        right_on='customerId',
        indicator=True
    )
    no_or = cu_or.loc[cu_or['_merge'] == 'left_only', ['name']]
    return no_or.rename(columns={'name': 'Customers'})