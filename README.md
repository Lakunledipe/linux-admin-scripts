# Linux User Onboarding Script

A simple Bash script to automate the process of adding new users on a Linux (Debian/Ubuntu) system. This script ensures new users are created correctly with a home directory, a default `bash` shell, and are added to a specified group.

## Features

* **Interactive:** Prompts the admin for a username and a group name.
* **Smart Group Creation:** Checks if the specified group exists. If not, it creates it automatically.
* **Best Practices:** Creates the user with `useradd -m` (to create a home directory) and `-s /bin/bash` (to set a modern, user-friendly shell).
* **Secure:** Does not handle passwords in plain text. It hands off to the built-in `passwd` command to securely prompt the admin for an initial password.
* **Feedback:** Provides clear "echo" messages to the admin about what it's doing.

## Requirements

* A Linux system (tested on Ubuntu 22.04+).
* Must be run as the **root** user (or with `sudo`).

## How to Use

1.  **Download the script:**
    You can download the script directly from this repository using `curl` or `wget`.
    ```bash
    # Using curl
    curl -O [https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/create_user.sh](https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/create_user.sh)

    # Or using wget
    wget [https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/create_user.sh](https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/create_user.sh)
    ```
    *(**Note:** You must replace `YOUR_USERNAME` and `YOUR_REPO_NAME` with your own details after you upload it!)*

2.  **Make it Executable:**
    ```bash
    chmod +x create_user.sh
    ```

3.  **Run the Script:**
    ```bash
    ./create_user.sh
    ```

4.  **Follow the Prompts:**
    The script will ask you for the new username and group, then prompt you to set their password.
    ```
    --- User Onboarding Script ---

    Please enter the username for the new user:
    lisa
    
    Please enter the group they should join (e.g., developers, web, data):
    developers
    
    ...
    ```
