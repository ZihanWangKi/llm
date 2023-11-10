# LLM Training & Inference
training w/ [Fastchat](https://github.com/lm-sys/FastChat)
inference w/ [vllm](https://github.com/vllm-project/vllm)

### setup
Create a new python environment. We will install everything with cuda 11.8. Other cuda versions and library versions likely won't work for now.
```bash
conda create -n llm python=3.10 -y
conda deactivate && conda activate llm
bash setup.sh
```

### inference
Play with `vllm_test.py`

### training
Modify `data_module.py` to support the data format, and use `finetune.sh` or `finetune_lora.sh`