#!/bin/bash

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Download model weights for the notebook
huggingface-cli download 'Qwen/Qwen2.5-0.5B-Instruct'

# Download ollama
curl -fsSL https://ollama.com/install.sh | sh

# Get the ollama model
ollama pull qwen2.5-0.5b
ollama pull qwen2.5-1.5b

# To get other models, you can just do
# ollama run <model_name>
# and the model will be downloaded automatically.