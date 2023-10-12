#!/bin/bash

pip install git+https://github.com/huggingface/accelerate

accerate config
accerate env 

# accelerate estimate-memory bert-base-cased

accelerate estimate-memory HuggingFaceM4/idefics-80b-instruct --library_name transformers

#  https://huggingface.co/spaces/hf-accelerate/model-memory-usage