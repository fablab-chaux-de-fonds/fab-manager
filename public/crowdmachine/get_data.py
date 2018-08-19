import pandas as pd
import base64
import os
import json

path=r'../../app/assets/images/crowdmachine/400x400'

def to_base64(file):
    with open(file, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode('ascii')  

url = 'https://docs.google.com/spreadsheets/d/1uS8elJvel5WN_dvNN7ziWpwc-Qz3lVh0GdPCYTN90-s/gviz/tq?tqx=out:csv&sheet='
df = pd.read_csv(url)[['sort', 'id', 'get',  'title', 'description', 'specification']]

df['image'] = df.apply(lambda row: to_base64(os.path.join(path, str(row.id) + '_400x400.png')), axis=1)
df['specification'] = df.apply(lambda row: row['specification'].split('\n'), axis=1)
data = {'data': df.to_dict(orient='records')}
with open('crowdmachine.json', 'w', encoding='utf-8') as fp:
    json.dump(data, fp)
