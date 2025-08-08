import pandas as pd


def find_employees(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee.merge(
        employee,
        left_on='managerId',
        right_on='id',
        suffixes=['_emp', '_man']
    )

    df.rename(columns={
        'name_emp': 'Employee'
    }, inplace=True)

    return df.loc[df['salary_man'] < df['salary_emp'], ['Employee']]