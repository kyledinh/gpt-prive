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

## Load 