import runpod
import os
from IPython.display import display, Markdown

runpod.api_key = os.getenv("RUNPOD_API_KEY", "your_runpod_api_key")

if runpod.api_key == "your_runpod_api_key":
    display(
        Markdown(
            "It appears that you don't have a RunPod API key. You can obtain one at [runpod.io](https://runpod.io?ref=s7508tca)"
        )
    )
    raise AssertionError("Missing RunPod API key")

gpus = runpod.get_gpus()

for gpu in gpus:
    # print(gpu)
    print(runpod.get_gpu(gpu["id"]))


## Specs for a specific GPU
# gpu_id = "NVIDIA A40"
# gpu = runpod.get_gpu(gpu_id)

# print(gpu)