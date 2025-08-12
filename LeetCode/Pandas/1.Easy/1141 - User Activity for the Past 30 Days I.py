import pandas as pd


def user_activity(activity: pd.DataFrame) -> pd.DataFrame:
    end = pd.to_datetime('2019-07-27')
    start = end - pd.DateOffset(days=29)

    df = activity.groupby('activity_date', as_index=False)['user_id'].nunique()
    df = df[df['activity_date'].isin(pd.date_range(start, end))]
    return df.rename(columns={'activity_date': 'day', 'user_id': 'active_users'})


# or


def user_activity(activity: pd.DataFrame) -> pd.DataFrame:
    df = activity[activity['activity_date'].between('2019-06-28', '2019-07-27')]
    df = df.groupby('activity_date', as_index=False)['user_id'].nunique()

    return df.rename(columns={'activity_date': 'day', 'user_id': 'active_users'})
