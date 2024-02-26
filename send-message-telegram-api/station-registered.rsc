# Check if a given station is connected to the AP and send a message to the group informing the status
# Verifica se uma determinada estação está conectada ao AP e envia uma mensagem ao grupo informando o status

:local wirelessdetected false
:local botid "YOUR-BOT-ID" # Change to your bot ID
:local chatid "YOUR-CHAT-ID" # Change to your chat ID
:while (true) do={
    :do {
        :local detect ([/interface/wireless/registration-table get [find where mac-address=STATION-MAC-ADDRESS]]) # Change `STATION-MAC-ADDRESS` to the MAC address of the station you want to monitor
        :if (([:len $detect]) > 0) do={ 
            :if ($wirelessdetected = false) do={ 
                # Send a message in chat if the station is connected
                /tool fetch url="https://api.telegram.org/bot$botid/sendMessage?chat_id=$chatid&text=YOUR-MESSAGE"
                :set wirelessdetected true
            }
         }
    } on-error={
        :if ($wirelessdetected = true) do={
            # Send a message in chat if the station is not connected
            /tool fetch url="https://api.telegram.org/bot$botid/sendMessage?chat_id=$chatid&text=YOUR-MESSAGE"
            :set wirelessdetected false
        }
    }
    :delay 1
}