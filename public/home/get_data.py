import json
import os
import base64

with open('./home_text.json') as f:
    data = json.load(f)

with open('./assets/banner.jpg',"rb") as image_file:
        data['banner'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/fabriquer.svg.png',"rb") as image_file:
        data['make'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/apprentissage.svg.png',"rb") as image_file:
        data['learn'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/communauté.svg.png',"rb") as image_file:
        data['community'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/machine.svg.png',"rb") as image_file:
        data['local']['cards'][0]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/machconv.svg.png',"rb") as image_file:
        data['local']['cards'][1]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/partage.svg.png',"rb") as image_file:
        data['local']['cards'][2]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/elect.svg.png',"rb") as image_file:
        data['local']['cards'][3]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/outil.svg.png',"rb") as image_file:
        data['local']['cards'][4]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/idée.svg.png',"rb") as image_file:
        data['local']['cards'][5]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/canton.svg.png',"rb") as image_file:
        data['network']['cards'][0]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/suisse.svg.png',"rb") as image_file:
        data['network']['cards'][1]['img'] = base64.b64encode(image_file.read()).decode('ascii')

with open('./assets/monde.svg.png',"rb") as image_file:
        data['network']['cards'][2]['img'] = base64.b64encode(image_file.read()).decode('ascii')

for i in ['mail', 'facebook', 'instagram', 'github']:
    with open('./assets/fablab-picto-' + i + '.png',"rb") as image_file:
        data['social'][i]['logo'] = base64.b64encode(image_file.read()).decode('ascii')

with open('home.json', 'w', encoding='utf-8') as fp:
    json.dump(data, fp)
