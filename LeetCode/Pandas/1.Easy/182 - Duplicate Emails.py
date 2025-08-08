import pandas as pd


def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:
    result = person[['email']].rename(columns={'email': 'Email'})
    return result[result.duplicated()].drop_duplicates()
