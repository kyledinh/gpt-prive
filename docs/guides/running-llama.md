
## Using llama.cpp

- Clone LLAMA codebase from git - https://github.com/facebookresearch/llama 
- Clone Llama.cpp from git - https://github.com/ggerganov/llama.cpp 
- Download models
- Compile Llama.cpp
```
make LLAMA_CUBLSD=1
```
- Run the model
```bash
./main -m models/llama-2-7b/ggml-model-f32.bin -n 128 -i -ins
```
- https://github.com/ggerganov/llama.cpp#prepare-data--run

```
# obtain the original LLaMA model weights and place them in ./models
ls ./models
65B 30B 13B 7B tokenizer_checklist.chk tokenizer.model
  # [Optional] for models using BPE tokenizers
  ls ./models
  65B 30B 13B 7B vocab.json

# install Python dependencies
python3 -m pip install -r requirements.txt

# convert the 7B model to ggml FP16 format
python3 convert.py models/7B/

# Optional for models using BPE tokenizers
python convert.py models/7B/ --vocabtype bpe

## quantize the model to 4-bits (using q4_0 method)
./quantize ./models/7B/ggml-model-f16.gguf ./models/7B/ggml-model-q4_0.gguf q4_0

# update the gguf filetype to current if older version is unsupported by another application
./quantize ./models/7B/ggml-model-q4_0.gguf ./models/7B/ggml-model-q4_0-v2.gguf COPY

# run the inference
./main -m ./models/7B/ggml-model-q4_0.gguf -n 128
```


[Llama 2 on Ubuntu Video](https://www.youtube.com/watch?v=Ed7SH2y9Sos)

## Useful helpers

Check GPU support
- `nvidia-smi`
- with pytorch
```python
import torch 
print("Cuda support:", torch.cuda.is_available(), ":", torch.cudda.device_count(), "devices")
```


## Notes

### Memory/Disk Requirements

As the models are currently fully loaded into memory, you will need adequate disk space to save them and sufficient RAM to load them. At the moment, memory and disk requirements are the same.

| Model | Original size | Quantized size (4-bit) |
|------:|--------------:|-----------------------:|
|    7B |         13 GB |                 3.9 GB |
|   13B |         24 GB |                 7.8 GB |
|   30B |         60 GB |                19.5 GB |
|   65B |        120 GB |                38.5 GB |

### Quantization

Several quantization methods are supported. They differ in the resulting model disk size and inference speed.

*(outdated)*

| Model | Measure      | F16    | Q4_0   | Q4_1   | Q5_0   | Q5_1   | Q8_0   |
|------:|--------------|-------:|-------:|-------:|-------:|-------:|-------:|
|    7B | perplexity   | 5.9066 | 6.1565 | 6.0912 | 5.9862 | 5.9481 | 5.9070 |
|    7B | file size    |  13.0G |   3.5G |   3.9G |   4.3G |   4.7G |   6.7G |
|    7B | ms/tok @ 4th |    127 |     55 |     54 |     76 |     83 |     72 |
|    7B | ms/tok @ 8th |    122 |     43 |     45 |     52 |     56 |     67 |
|    7B | bits/weight  |   16.0 |    4.5 |    5.0 |    5.5 |    6.0 |    8.5 |
|   13B | perplexity   | 5.2543 | 5.3860 | 5.3608 | 5.2856 | 5.2706 | 5.2548 |
|   13B | file size    |  25.0G |   6.8G |   7.6G |   8.3G |   9.1G |    13G |
|   13B | ms/tok @ 4th |      - |    103 |    105 |    148 |    160 |    131 |
|   13B | ms/tok @ 8th |      - |     73 |     82 |     98 |    105 |    128 |
|   13B | bits/weight  |   16.0 |    4.5 |    5.0 |    5.5 |    6.0 |    8.5 |
