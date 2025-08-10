import pandas as pd


def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    cnt = courses.groupby('class', as_index=False).count()
    return cnt.loc[cnt['student'] >= 5, ['class']]
