import pandas as pd


def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    df = employee['salary'].drop_duplicates().sort_values(ascending=False)
    return pd.DataFrame({
        f'getNthHighestSalary({N})': [None if df.size < N or N < 1 else df.iloc[N - 1]]
    })
