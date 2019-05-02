import json
import os
import base64

with open('./home_text.json') as f:
    data = json.load(f)

with open('./assets/bannersite.jpg',"rb") as image_file:
        data['banner'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/fablab-map.svg.png',"rb") as image_file:
        data['address']['map'] = base64.b64encode(image_file.read()).decode('ascii')

for i in ['open_lab', 'expert_lab']:
    with open('./assets/' + i + '.png',"rb") as image_file:
            data[i]['logo'] = base64.b64encode(image_file.read()).decode('ascii')

for i in ['mail', 'facebook', 'instagram', 'github']:
    with open('./assets/fablab-picto-' + i + '.png',"rb") as image_file:
        data['social'][i]['logo'] = base64.b64encode(image_file.read()).decode('ascii')

with open('home.json', 'w', encoding='utf-8') as fp:
    json.dump(data, fp)
