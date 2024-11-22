#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
NC='\033[0m'  # No Color (reset)

# Install dependencies
echo -e "${GREEN}Updating system packages...${NC}"
sudo apt-get update && sudo apt-get upgrade -y

echo -e "${GREEN}Installing required dependencies...${NC}"
sudo apt install curl git jq lz4 build-essential unzip screen -y
sudo apt install ca-certificates -y

# Download the setup script
echo -e "${GREEN}Downloading setup script...${NC}"
curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/setup_linux.sh > ~/setup_linux.sh

# Prompt the user for their wallet address
echo -e "${GREEN}Please enter your EVM (0x) wallet address:${NC}"
read wallet_address

# Replace the placeholder in the script with the provided wallet address
echo -e "${GREEN}Running setup script with your wallet address...${NC}"
bash ~/setup_linux.sh $wallet_address

# Run the setup script with the updated wallet address
echo -e "${GREEN}Running setup script...${NC}"
bash ~/setup_linux.sh

# Execute the start.sh script inside ~/cysic-verifier/
echo -e "${GREEN}Executing start.sh script...${NC}"
cd ~/cysic-verifier/ && bash start.sh

echo -e "${GREEN}Setup complete!${NC}"
