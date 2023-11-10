# 1.82s/it

deepspeed train_lora.py \
    --model_name_or_path /data/shared/llama-hf/llama-2-7b-hf \
    --lora_r 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --data_path "3x+1".json \
    --bf16 True \
    --output_dir test_model_3x1_lora \
    --num_train_epochs 3 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 1200 \
    --save_total_limit 100 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 512 \
    --q_lora True \
    --deepspeed deepspeed_config_s2.json