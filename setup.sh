#!/bin/bash

# Colors for pretty output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print section headers
print_header() {
    echo ""
    echo -e "${CYAN}========================================${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
}

# Function to print status messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Welcome message
echo ""
echo -e "${PURPLE}╔═══════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║           LLMs for Pi Setup           ║${NC}"
echo -e "${PURPLE}║      Sutton Trust Summer School       ║${NC}"
echo -e "${PURPLE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Create and activate virtual environment
print_header "Setting up Python Virtual Environment"
print_status "Creating virtual environment..."
python3 -m venv venv

print_status "Activating virtual environment..."
source venv/bin/activate
print_success "Virtual environment activated!"

# Install requirements
print_header "Installing Python Dependencies"
print_status "Installing packages from requirements.txt..."
pip install -r requirements.txt --no-cache-dir
print_success "Python dependencies installed!"

# Download model weights for the notebook
print_header "Downloading AI Model Weights"
print_status "Downloading Qwen2.5-0.5B-Instruct model from Hugging Face..."
huggingface-cli download 'Qwen/Qwen2.5-0.5B-Instruct'
print_success "Model weights downloaded!"

# Download ollama
print_header "Installing Ollama"
print_status "Ollama installation requires administrator privileges."
print_warning "You may be prompted for your password..."
print_status "Downloading and installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
print_success "Ollama installed!"

# Get the ollama model
print_header "Setting up Ollama Models"
print_status "Downloading Qwen2.5:0.5b model for Ollama..."
ollama pull qwen2.5:0.5b
print_success "Qwen2.5:0.5b model ready!"

# ollama pull qwen2.5:1.5b

# Final instructions
print_header "Setup Complete!"
echo -e "${GREEN}🎉 Everything is ready to go!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Activate the virtual environment:"
echo -e "     ${CYAN}source venv/bin/activate${NC}"
echo ""
echo -e "  2. Start the Jupyter notebook:"
echo -e "     ${CYAN}jupyter notebook intro-to-qwen.ipynb${NC}"
echo ""
echo -e "  3. Or try Ollama in the terminal:"
echo -e "     ${CYAN}ollama run qwen2.5:0.5b${NC}"
echo ""
echo -e "${BLUE}💡 Tip:${NC} To get other models with Ollama, just run:"
echo -e "   ${CYAN}ollama run <model_name>${NC}"
echo -e "   and the model will be downloaded automatically."
echo ""
echo -e "${PURPLE}Happy learning! 🚀${NC}"
echo ""