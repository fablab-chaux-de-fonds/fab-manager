import json
import os
import base64

with open('support_text.json') as f:
    data = json.load(f)

root = r'assets/logo-sponsoring/png'
data['sponsoring'] = ['']*14

for i in sorted(os.listdir(root)):
    with open(os.path.join(root, i),"rb") as image_file:
        data['sponsoring'][int(i[:-4])]=(base64.b64encode(image_file.read()).decode('ascii'))

with open('support.json', 'w', encoding='utf-8') as fp:
    json.dump(data, fp)
