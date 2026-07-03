import pandas as pd

vendors = pd.read_csv("Dataset/vendors_final.csv")
purchases = pd.read_csv("Dataset/purchases_final.csv")

print(vendors.head())

print(purchases.head())

# Number of rows and columns
print("\nVendors Shape:")
print(vendors.shape)

print("\nPurchases Shape:")
print(purchases.shape)

# Display column names
print("\nVendor Columns:")
print(vendors.columns)

print("\nPurchase Columns:")
print(purchases.columns)

# Display dataset information
print("\nVendors information:")
vendors.info()

print("\nPurchases information")
purchases.info()

# Check missing values
print("\n Missing values in vendors dataset")
print(vendors.isnull().sum())

print("\n Missing values in purchases dataset")
print(purchases.isnull().sum())

#Check duplicate records
print("\n Duplicate records in vendors dataset")
print(vendors.duplicated().sum())

print("\n Duplicate records in purchases dataset")
print(purchases.duplicated().sum())

#Statisitical summary
print("\n Statisitical summary of dataset")
print(purchases.describe())

# Convert date columns into datetime format
purchases["Order_Date"] = pd.to_datetime(purchases["Order_Date"])
purchases["Delivery_Date"] = pd.to_datetime(purchases["Delivery_Date"])

print("\nDate columns converted successfully!")

# Verify data type
print("\n Data type after conversion")
print(purchases.dtypes)


print("\n======== DATA PREPARATION COMPLETED ========")
print("✓ Vendors dataset loaded")
print("✓ Purchases dataset loaded")
print("✓ Dataset structure checked")
print("✓ Missing values checked")
print("✓ Duplicate records checked")
print("✓ Statistical summary generated")
print("✓ Date columns converted")
