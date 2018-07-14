import pandas as pd

url = 'https://docs.google.com/spreadsheets/d/1uS8elJvel5WN_dvNN7ziWpwc-Qz3lVh0GdPCYTN90-s/gviz/tq?tqx=out:csv&sheet='
pd.read_csv(url)[['sort', 'id', 'title', 'description', 'specification']] \
    .to_json('crowdmachine.json', orient='records')
