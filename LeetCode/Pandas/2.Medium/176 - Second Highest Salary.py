import pandas as pd


def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee['salary'].drop_duplicates().sort_values(ascending=False)
    return pd.DataFrame({
        'SecondHighestSalary': [None if df.size < 2 else df.iloc[1]]
    })
