# Link Rate

These scripts monitor the speed of an ethernet interface and send a message to a Telegram chat if the speed is ideal.

To monitor a single interface, use the [simple](./simple.rsc) script:

```routeros
# Author: Henrique Sebastião
# Description: This script monitors the speed of an interface and sends a message to a Telegram chat if the speed is 10Mbps
# Change the values of the variables botToken, chatId and hostName to your needs

:local botToken "YOUR_BOT_TOKEN_HERE";
:local chatId "YOUR_CHAT_ID_HERE";
:local hostName [/system identity get name];

# Change the name of the interface that will be monitored to your needs

/interface ethernet monitor ether1 once do={
    :if ($"rate" = "10Mbps") do={

        # Change the message to your needs
        # You can encode the message to URL on the following website:
        # https://www.urlencoder.io/
        :local message "WARNING%3A%20The%20ether1%20on%20$hostName%20interface%20is%20connected%20at%2010Mbps";
        :log error "ether1 speed at 10Mbps"
        /tool fetch url="https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=$message" keep-result=no;
    };
}
```
