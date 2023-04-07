#!/bin/bash

# Update package list
sudo apt update
sudo apt upgrade -y

# Install Git
sudo apt install -y git
sudo apt autoremove -y

# Set up Git with your personal access token
read -p "Enter your GitHub username: " github_username
read -p "Enter your Github Token " github_pat

# Configure Git to use your token for authentication
git config --global credential.helper store
echo "https://${github_username}:${github_pat}@github.com" > ~/.git-credentials

# Set up Git with your name and email
read -p "Enter your full name: " full_name
read -p "Enter your email address: " email_address
git config --global user.name "${full_name}"
git config --global user.email "${email_address}"

# Verify Git installation and configuration
git --version
git config --list

echo "Git installation and configuration complete!"
