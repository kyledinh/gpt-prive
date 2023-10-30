# GPT-Prive
> A fork of https://github.com/imartinez/privateGPT to run on MacOS and Docker on June 1, 2023. All for developent and learning.

<br><br>
## Table of Contents

- [Software Requirements](#software-requirements)
- [Onboarding](#onboarding)

<br><hr><br>

## Software Requirements

Software | Version | Desc
---------|---------|--------------------------
python   | 3.10 +  |
pip      |         | `apt install python3-pip`
make     |         |

<br><hr><br>

## Onboarding
- `make check` - Inspect for install versions
- `make setup` - Setup files and directories (.env)
- download models to `models/` and documents to `source_documents/` 
- `make ingest` - Reloads models and docs 
- `make run` - Run GPT-prive interface - `exit` to quit

## Windows and Linux Subsystem
- `wsl --list --verbose` list the available distros
- `wsl cat /proc/version`
- [Enable GPU on WSL](https://learn.microsoft.com/en-us/windows/ai/directml/gpu-cuda-in-wsl)
- `wsl -d Ubuntu-22.04` run a perticular distro

<br><hr><br>

## Models

- https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin
- https://huggingface.co/models

<br><hr><br>

## Source Documents

- The Odyssey by Homer - http://classics.mit.edu/Homer/odyssey.html


<br><hr><br>

## Resources
- https://gpt4all.io/index.html
- https://huggingface.co/
- https://community.openai.com/


<br><hr><br>

## Issues
- Getting to use the GPU
- https://github.com/imartinez/privateGPT/issues/59
- https://github.com/imartinez/privateGPT/discussions/217
