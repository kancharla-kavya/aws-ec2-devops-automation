#!/bin/bash

echo "Starting DevOps Automation..."

echo "Creating Linux Instances..."
bash create-linux.sh

echo "Creating Windows Instances..."
bash create-windows.sh

echo "All instances created successfully!"