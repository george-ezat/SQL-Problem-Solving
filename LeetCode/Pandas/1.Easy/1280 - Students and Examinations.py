import pandas as pd


def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    examinations.rename(columns={'subject_name': 'attended_exams'}, inplace=True)

    df = students.merge(subjects, how='cross')
    df = df.merge(
        examinations,
        how='left',
        left_on=['student_id', 'subject_name'],
        right_on=['student_id', 'attended_exams'],
    )

    df = df.groupby(['student_id', 'student_name', 'subject_name'], as_index=False, dropna=False)
    return df['attended_exams'].count()