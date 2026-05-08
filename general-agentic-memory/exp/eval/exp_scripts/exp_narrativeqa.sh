#!/bin/bash

# Activate your conda/virtual environment if needed
# source /path/to/your/conda/bin/activate your_env

export HF_DATASETS_CACHE=/NAS/wangxy/hf_cache_narrativeqa
mkdir -p /NAS/wangxy/hf_cache_narrativeqa

# Set output directory
outputdir=/home/wangxy/results/narrativeqa

# Create output directory
mkdir -p $outputdir

# Run NarrativeQA evaluation
# 这里直接从第31个开始，前30个当时用作经验，不处理
python3 /NAS/wangxy/general-agentic-memory/exp/eval/datasets_test/narrativeqa_exp.py \
    --data-dir /NAS/wangxy/general-agentic-memory/data/narrativeqa \
    --split test \
    --outdir $outputdir \
    --start-idx 30 \
    --end-idx 300 \
    --max-tokens 2048 \
    --seed 42 \
    --memory-api-key "empty" \
    --memory-base-url "http://localhost:8002/v1" \
    --memory-model "qwen2.5-7B-Instruct" \
    --memory-api-type "vllm" \
    --research-api-key "empty" \
    --research-base-url "http://localhost:8002/v1" \
    --research-model "qwen2.5-7B-Instruct" \
    --research-api-type "vllm" \
    --working-api-key "empty" \
    --working-base-url "http://localhost:8002/v1" \
    --working-model "qwen2.5-7B-Instruct" \
    --working-api-type "vllm" \
    --embedding-model-path /NAS/wangxy/BAAI/bge-m3

