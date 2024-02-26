# This script removes all "garbage" files generated in storage by fetch in the Telegram API.

# Sets the variable with the file prefix
:local prefixo "sendMessage"

# Gets the list of files in the directory
:local files [/file find]

# Loop through each file
:foreach file in=$files do={
    # Gets the file name
    :local fileName [/file get $file name]

    # Checks if the file name starts with the prefix
    :if ([:typeof $fileName] = "str" && [:find $fileName $prefixo] = 0) do={
        # Remove the file
        /file remove $file
    }
}
