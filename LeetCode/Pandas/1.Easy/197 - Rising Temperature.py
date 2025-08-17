import pandas as pd


def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    weather['prev'] = weather['recordDate'] - pd.DateOffset(days=1)

    df = weather.merge(
        weather,
        left_on='recordDate',
        right_on='prev'
    ).rename(columns={'id_y': 'Id'})

    return df.loc[df['temperature_y'] > df['temperature_x'], ['Id']]
