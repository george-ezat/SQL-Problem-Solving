import pandas as pd


def count_employees(employees: pd.DataFrame) -> pd.DataFrame:
    df = employees.merge(employees, left_on='employee_id', right_on='reports_to')
    df = df.groupby(['employee_id_x', 'name_x'], as_index=False).agg(
        reports_count=('reports_to_y', 'count'),
        average_age=('age_y', 'mean')
    )

    df['average_age'] = (df['average_age'] + 1e-10).round()

    return df.rename(columns={
        'employee_id_x': 'employee_id',
        'name_x': 'name'
    }).sort_values(by='employee_id')
