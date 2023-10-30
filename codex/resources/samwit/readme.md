# Finetuning Adapters with peft lora

- 7B finetuning example with peft - lora adapters
- from pretrained with 
- dataset "Abrirate/english_quotes" 

## Saves the adapter weight only
```
model.push_to_hub("Slowblood/somellm-7b-lora-tagger",
                  use_auth_token=True,
                  commit_message="finetune session 1a",
                  private=True)
```

## Resources
- Fine-tuning LLMs with PEFT and LoRA - Sam Witteveen - https://www.youtube.com/watch?v=Us5ZFp16PaU
- LoRA Colab : https://colab.research.google.com/dri...
- Blog Post: https://huggingface.co/blog/peft
- LoRa Paper: https://arxiv.org/abs/2106.09685

Github:
- https://github.com/samwit/langchain-tutorials
- https://github.com/samwit/llm-tutorials