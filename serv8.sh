# basic
conda install -y pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 -c pytorch -c nvidia

# inference
pip install vllm

# finetune
conda install -y -c "nvidia/label/cuda-11.8.0" cuda-nvcc
pip install transformers==4.34.0
pip install "fschat[model_worker,train]"

# lora finetune
pip install deepspeed bitsandbytes scipy
conda install -y -c "nvidia/label/cuda-11.8.0" cuda-cudart-dev
conda install -y -c "nvidia/label/cuda-11.8.0" cuda-toolkit
ln -s $CONDA_PREFIX/lib $CONDA_PREFIX/lib64