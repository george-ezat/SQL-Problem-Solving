import pandas as pd


def queries_stats(queries: pd.DataFrame) -> pd.DataFrame:
    queries['quality'] = queries['rating'] / queries['position'] + 1e-10
    queries['poor_query_percentage'] = (queries['rating'] < 3) * 100
    return queries.groupby('query_name', as_index=False)[
        ['quality', 'poor_query_percentage']].mean().round(2)

# + 1e-10  >> this prevents dividing by zero in any testcase
# (queries['rating'] < 3) results in boolean value
#   - if True  >>  1 * 100 = 100
#   - if False >>  0 * 100 = 100
