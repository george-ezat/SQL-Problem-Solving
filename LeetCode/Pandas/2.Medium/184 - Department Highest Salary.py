import pandas as pd


def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df = employee.groupby('departmentId', as_index=False).agg(max_sal=('salary', 'max'))

    df = df.merge(employee, left_on=['departmentId', 'max_sal'], right_on=['departmentId', 'salary'])
    df = df.merge(department, left_on='departmentId', right_on='id')

    return df.rename(columns={
        'name_y': 'Department',
        'name_x': 'Employee',
        'salary': 'Salary'
    })[['Department', 'Employee', 'Salary']]