import json
import os
import base64

with open('prices_text.json') as f:
    data = json.load(f)

with open('./assets/prices.svg',"rb") as image_file:
    data['images']['prices'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/trainings.svg',"rb") as image_file:
    data['images']['trainings'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/payment_methods.svg',"rb") as image_file:
    data['images']['payment_methods'] = base64.b64encode(image_file.read()).decode('ascii')

with open('prices.json', 'w') as fp:
    json.dump(data, fp)
