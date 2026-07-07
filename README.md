# DevOps Environment Setup — SysAdmin Starter Pack

## Overview
This repository contains a Bash script that automates the setup of a basic
project folder structure for storing logs, configuration files, and scripts —
a common task for DevOps and SysAdmin work.

The script:
- Creates `logs/`, `configs/`, and `scripts/` directories
- Creates `logs/system.log`, `configs/app.conf`, and `scripts/backup.sh` with
  sample content
- Sets correct permissions on each file using `chmod`
- Displays the resulting directory structure and permissions
- Skips recreating directories that already exist (idempotent — safe to
  re-run)
- Checks whether `tree` is installed, installs it if missing, and falls back
  to `ls -R` if installation fails

## Files
| File | Description |
|------|-------------|
| `setup_environment.sh` | Main automation script |
| `screenshots/` | Screenshots of the script running (see below) |

## Requirements
- A Linux system with Bash
- `sudo` privileges (only needed if `tree` is not already installed)

## Usage
```bash
git clone <this-repo-url>
cd <this-repo-folder>
chmod +x setup_environment.sh
./setup_environment.sh
```

Run it a second time to see the script gracefully handle directories that
already exist, printing `Directory already exists: <name>` instead of
throwing an error.

## Permissions applied
| File | Permission | chmod value |
|------|------------|--------------|
| `logs/system.log` | Owner read/write, group read, others read | `644` |
| `configs/app.conf` | Read-only for all | `444` |
| `scripts/backup.sh` | Owner read/write/execute, group/others read/execute | `755` |

## Expected output

**Directory structure:**
```
.
├── configs
│   └── app.conf
├── logs
│   └── system.log
└── scripts
    └── backup.sh
```

**Permissions overview:**
```
-rw-r--r-- 1 user user 22 Oct 27 21:15 logs/system.log
-r--r--r-- 1 user user 24 Oct 27 21:15 configs/app.conf
-rwxr-xr-x 1 user user 48 Oct 27 21:15 scripts/backup.sh
```

## Screenshots
See the `screenshots/` folder for evidence of the script running, including:
1. First run — directories and files created, permissions set
2. Second run — showing `Directory already exists` messages
3. System clock / date visible on screen for both runs

## Author
Celse —  DevOps track
