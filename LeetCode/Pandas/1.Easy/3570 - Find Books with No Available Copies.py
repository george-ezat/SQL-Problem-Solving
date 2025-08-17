import pandas as pd


def find_books_with_no_available_copies(library_books: pd.DataFrame, borrowing_records: pd.DataFrame) -> pd.DataFrame:
    df = borrowing_records[borrowing_records['return_date'].isna()].fillna(1)
    df = df.groupby('book_id', as_index=False).agg(current_borrowers=('return_date', 'sum'))

    df = df.merge(
        library_books,
        left_on=['book_id', 'current_borrowers'],
        right_on=['book_id', 'total_copies']
    )

    return df[['book_id', 'title', 'author', 'genre', 'publication_year', 'current_borrowers']]\
        .sort_values(by=['current_borrowers', 'title'], ascending=[False, True])
