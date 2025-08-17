import pandas as pd


def find_employees(employees: pd.DataFrame, salaries: pd.DataFrame) -> pd.DataFrame:
    df = employees.merge(salaries, how='outer', on='employee_id')
    return df.loc[(df['name'].isna()) | (df['salary'].isna()), ['employee_id']].sort_values(by='employee_id')
