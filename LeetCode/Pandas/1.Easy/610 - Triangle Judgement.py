import pandas as pd


def triangle_judgement(triangle: pd.DataFrame) -> pd.DataFrame:
    triangle['triangle'] = triangle.apply(
        lambda r:
        'Yes' if (r.x + r.y > r.z and r.x + r.z > r.y and r.z + r.y > r.x)
        else 'No', axis=1
    )
    return triangle
