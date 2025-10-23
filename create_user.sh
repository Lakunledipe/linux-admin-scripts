#!/bin/bash
# ^ This first line is called a "shebang". It tells Linux to use Bash to run this script.

# --- Welcome Message ---
echo "--- User Onboarding Script ---"
echo ""

# --- Get Username ---
echo "Please enter the username for the new user:"
read new_username
echo ""
# --- Check if user already exists ---
if id "$new_username" &>/dev/null; then
    echo "Error: User '$new_username' already exists."
    echo "Exiting script."
    exit 1
fi
echo ""
# --- Get Group Name ---
echo "Please enter the group they should join (e.g., developers, web, data):"
read user_group
echo ""

# --- Check if Group Exists, Create if Not ---
# We check the /etc/group file. If the group isn't there, we create it.
if ! grep -q "^$user_group:" /etc/group; then
    echo "Group '$user_group' does not exist. Creating it now..."
    groupadd $user_group
    echo "Group '$user_group' created."
fi

# --- Create the User ---
echo "Creating user '$new_username' with home directory and bash shell..."
# -m creates the home directory (/home/new_username)
# -s /bin/bash sets the default shell (so they get the nice prompt!)
useradd -m -s /bin/bash $new_username
echo ""

# --- Add User to Group ---
echo "Adding '$new_username' to the group '$user_group'..."
# -aG means "append" to a "Group"
usermod -aG $user_group $new_username
echo ""

# --- Set Initial Password ---
echo "Finally, please set the initial password for '$new_username':"
# This will pause the script and run the passwd command for you
passwd $new_username

# --- Success Message ---
echo ""
echo "--- All Done! ---"
echo "User '$new_username' was created and added to the '$user_group' group."
echo "You can check their setup by running: id $new_username"
