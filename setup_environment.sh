#!/bin/bash

SEPARATOR="**************************************"
echo ""
echo ""
echo "=========================================="
echo " Starting DevOps Environment Setup"
echo "=========================================="

# --- Create logs directory ---
if [ -d "logs" ]; then
    echo "Directory already exists: logs"
else
    mkdir logs
    echo "Created directory: logs"
fi

# --- Create configs directory ---
if [ -d "configs" ]; then
    echo "Directory already exists: configs"
else
    mkdir configs
    echo "Created directory: configs"
fi

# --- Create scripts directory ---
if [ -d "scripts" ]; then
    echo "Directory already exists: scripts"
else
    mkdir scripts
    echo "Created directory: scripts"
fi

echo -e "\n$SEPARATOR\n"

# --- Create files with sample content ---
echo "System started successfully." > logs/system.log
echo "app_name=DevOpsApp" > configs/app.conf
echo "#!/bin/bash" > scripts/backup.sh
echo "echo Backup running..." >> scripts/backup.sh

echo "Created logs/system.log, configs/app.conf, scripts/backup.sh with sample content."

echo -e "\n$SEPARATOR\n"

# --- Set permissions ---
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

echo "File permissions set successfully."

echo -e "\n$SEPARATOR\n"

# --- Check for tree, install if missing ---
echo "Checking for 'tree' command..."

if command -v tree >/dev/null 2>&1; then
    echo "'tree' is already installed."
else
    echo "'tree' not found. Installing now..."
    sudo apt update && sudo apt install -y tree

    if command -v tree >/dev/null 2>&1; then
        echo "'tree' installed successfully."
    else
        echo "Installation failed. Falling back to 'ls -R' command instead."
    fi
fi

echo -e "\n$SEPARATOR\n"

# --- Show directory structure ---
echo "Directory structure:"
if command -v tree >/dev/null 2>&1; then
    tree
else
    ls -R
fi

echo -e "\n$SEPARATOR\n"

# --- Show permissions ---
echo "Permission overview:"
echo "...................."
echo ""
ls -lR

echo -e "\n$SEPARATOR\n"
echo "Setup complete!"
