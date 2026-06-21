import pandas as pd

file_path = "Data/customers.csv"

df = pd.read_csv(file_path)

rows_before = len(df)

duplicates_removed = df.duplicated().sum()

critical_fields = ["customer_name", "email", "city"]
null_rows = df[critical_fields].isnull().any(axis=1).sum()

df = df.drop_duplicates()

df = df.dropna(subset=critical_fields)

df["customer_name"] = df["customer_name"].str.strip().str.title()
df["email"] = df["email"].str.strip().str.lower()
df["city"] = df["city"].str.strip().str.title()

rows_after = len(df)

df.to_csv("Cleaned_csv/customers_cleaned.csv", index=False)

print("\nDATA CLEANING REPORT")
print("-" * 40)
print(f"Rows Before Cleaning : {rows_before}")
print(f"Rows After Cleaning  : {rows_after}")
print(f"Duplicates Removed   : {duplicates_removed}")
print(f"Null Records Removed : {null_rows}")
print("-" * 40)
