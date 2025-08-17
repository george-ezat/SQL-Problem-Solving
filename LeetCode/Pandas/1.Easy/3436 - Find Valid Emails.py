import pandas as pd


def find_valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    return users.loc[users['email'].str.match('^[A-Za-z0-9\_]+@[A-Za-z]+\.com$')].sort_values(by='user_id')
