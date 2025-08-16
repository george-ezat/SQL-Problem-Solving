import pandas as pd


def find_primary_department(employee: pd.DataFrame) -> pd.DataFrame:
    return employee.loc[
        (employee['primary_flag'] == 'Y') |
        (~employee.duplicated(subset='employee_id', keep=False)),
        ['employee_id', 'department_id']
    ]


# or


def find_primary_department(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee.sort_values(by='primary_flag', ascending=False).drop_duplicates(subset='employee_id')
    return df[['employee_id', 'department_id']]
