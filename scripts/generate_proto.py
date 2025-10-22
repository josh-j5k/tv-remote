import json

with open("../lib/data/services/key_codes.json") as f:
    data = json.load(f)

print('syntax = "proto3";\n\npackage remote;\n')

print('enum AndroidKeyCode {')
print('  KEYCODE_UNKNOWN = 0;')

for category, items in data.items():
    print(f'\n  // {category}')
    for item in items:
        print(f'  {item["name"]} = {item["code"]};')
print('}\n')

print('message KeyEvent {')
print('  AndroidKeyCode code = 1;')
print('  string description = 2;')
print('}')
