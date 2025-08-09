import pandas as pd


def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    result = employee.merge(bonus, on='empId', how='left')
    result = result.loc[(result['bonus'].isna()) | (result['bonus'] < 1000)]
    return result[['name', 'bonus']]
