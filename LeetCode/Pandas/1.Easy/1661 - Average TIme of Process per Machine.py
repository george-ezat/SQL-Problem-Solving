import pandas as pd


def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    df = activity.pivot_table(
        values='timestamp',
        index=['machine_id', 'process_id'],
        columns='activity_type'
    ).reset_index()

    df['processing_time'] = df['end'] - df['start']
    return df.groupby('machine_id', as_index=False)['processing_time'].mean().round(3)
