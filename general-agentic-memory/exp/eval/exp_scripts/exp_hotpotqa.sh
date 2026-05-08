#!/bin/bash

# 加载环境config
source /NAS/wangxy/general-agentic-memory/exp/eval/config/config_hotpotqa.sh

mkdir -p $BASE_OUTPUTDIR

for dataset in $HOTPOTQA_DATA
do
    echo "Processing dataset: $dataset"
    outputdir=$BASE_OUTPUTDIR/${dataset}

    python3 /NAS/wangxy/general-agentic-memory/exp/eval/datasets_test/hotpotqa_exp.py \
        --data /NAS/wangxy/general-agentic-memory/data/hotpotqa/${dataset}.json \
        --outdir $outputdir \
        --start-idx 0 \
        --max-tokens 2048 \
        --memory-api-key "empty" \
        --memory-base-url $MEMORY_BASE_URL \
        --memory-model $MEMORY_MODEL \
        --memory-api-type "vllm" \
        --research-api-key "empty" \
        --research-base-url $MEMORY_BASE_URL \
        --research-model $MEMORY_MODEL \
        --research-api-type "vllm" \
        --working-api-key "empty" \
        --working-base-url $MEMORY_BASE_URL \
        --working-model $MEMORY_MODEL \
        --working-api-type "vllm"
done