# Developer Guide

# Tools
- Model Memory Calculator - https://huggingface.co/spaces/hf-accelerate/model-memory-usage
- Hugging Face Open LLM Leaderboard - https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard
- Google Colab - https://colab.research.google.com/

## Playgrounds
- Hugging Face - https://huggingface.co/chat/
- Hugging Face Spaces - https://huggingface.co/spaces

# Python Notebooks 
- NVidia Info Command - `nvidia-smi`
```
Tue Oct 24 22:14:03 2023       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 525.105.17   Driver Version: 525.105.17   CUDA Version: 12.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            Off  | 00000000:00:04.0 Off |                    0 |
| N/A   51C    P8    10W /  70W |      0MiB / 15360MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```
- Hugging Face Login
```
from huggingface_hub import notebook_login
notebook_login()
```
