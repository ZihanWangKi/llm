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

# fixing deepspeed library missing problem (for lora finetune)
ln -s $CONDA_PREFIX/lib $CONDA_PREFIX/lib64
curand_file=$CONDA_PREFIX/lib/libcurand.so
curand_perhaps_source_file=$CONDA_PREFIX/lib/libcurand.so.10.3.4.52
if [ ! -e "$curand_file" ] ; then
    # code if the symlink is broken
    echo symlink broken for $curand_file
    if [ -e "$curand_perhaps_source_file" ] ; then
        echo linking $curand_perhaps_source_file
        rm $curand_file
        ln -s $curand_perhaps_source_file $curand_file
    else
        echo $curand_perhaps_source_file not found
    fi
fi
