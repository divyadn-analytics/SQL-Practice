import pandas as pd
df=pd.read_csv('TSLA.csv')  # load the dataset
print(df.head())  # print the first 5 rows of the dataset
df['Date']=pd.to_datetime(df['Date'])  # convert the 'Date' column to datetime format
df=df.sort_values('Date')    # sort the dataframe by 'Date' 
print(df.duplicated().sum())  # check for duplicate rows    
df=df.drop_duplicates()  # drop duplicate rows
df['year']=df['Date'].dt.year  # create a new column 'year' from the 'Date' column
df["Daily_returns"]=df["Close"].pct_change()  # calculate daily returns and create a new column 'daily_returns'
print(df.isnull().sum())  # check for missing values
df.info()  # print the summary of the dataframe
print(df.shape)  # print the shape of the dataframe