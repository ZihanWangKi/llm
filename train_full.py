# Make it more memory efficient by monkey patching the LLaMA model with FlashAttn.

# Need to call this before importing transformers.
from fastchat.train.llama2_flash_attn_monkey_patch import (
    replace_llama_attn_with_flash_attn,
)

replace_llama_attn_with_flash_attn()

from fastchat.train import train
import data_module 
    
train.make_supervised_data_module = data_module.make_supervised_data_module

if __name__ == "__main__":
    train.train()
