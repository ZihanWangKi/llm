import random 
import json 

def three_x_plus_one(x):
    if x % 2 == 0:
        return x // 2
    else:
        return 3 * x + 1
    
def random_sequence_of_characters(L):
    # only a - z
    return "".join([chr(random.randint(ord('a'), ord('z'))) for _ in range(L)])
    
dataset = []
for i in range(1000):
    x = i + 1
    ins = [x]
    for j in range(1000):
        x = three_x_plus_one(x)
        ins.append(x)
    dataset.append({
        "input": random_sequence_of_characters(10),
        "output": " ".join(str(x) for x in ins)
    })

json.dump(dataset, open("3x+1.json", "w"), indent=2)