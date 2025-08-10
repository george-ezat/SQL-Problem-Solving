import pandas as pd


def sales_person(sales_person: pd.DataFrame, company: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    ord_com = orders.merge(company, on='com_id')
    red_id = ord_com.loc[ord_com['name'] == 'RED', 'sales_id']
    return sales_person.loc[~sales_person['sales_id'].isin(red_id), ['name']]
