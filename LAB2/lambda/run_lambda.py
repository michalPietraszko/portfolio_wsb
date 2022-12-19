import pandas as pd 
#import xlrd 
import openpyxl
from PIL import ImageColor
#from io import StringIO  
#import boto3 

import json

def lambda_handler(event,context): 

    COLORS_FILE_URL=event['path']#event.get('path')
    df=pd.read_csv(COLORS_FILE_URL)
    df.insert(2, column = "RGB", value = "255 255 255")

    for row, index  in df.iterrows():
        index['RGB']=ImageColor.getcolor(index['value'], "RGB")
    
    print(df)


def main():
    event_json=open('./event.json')

    lambda_handler(json.load(event_json), None)
    event_json.close()
    

if __name__ == "__main__":
    main()