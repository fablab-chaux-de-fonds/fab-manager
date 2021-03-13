import json
import os
import base64

with open('./contact_text.json', encoding="utf-8") as f:
    data = json.load(f)

with open('./assets/fablab-map.svg.png',"rb") as image_file:
        data['address']['map'] = base64.b64encode(image_file.read()).decode('ascii')

with open('contact.json', 'w', encoding='utf-8') as fp:
    json.dump(data, fp)
