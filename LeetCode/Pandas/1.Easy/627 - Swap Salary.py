import pandas as pd

def swap_salary(salary: pd.DataFrame) -> pd.DataFrame:
    salary['sex'] = salary.apply(
        lambda row: 'f' if row.sex == 'm' else 'm',
        axis=1
    )
    return salary