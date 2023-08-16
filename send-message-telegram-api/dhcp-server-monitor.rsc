# Este script envia uma mensagem para um grupo do Telegram (por meio da api do Telegram) quando um cliente recebe um IP do servidor DHCP
# O script deve ser adicionado no DHCP Server na aba "Lease Script"
# Informações enviadas sobre o cliente: MAC, IP e Hostname

# Substituir {ID_DO_BOT} e {ID_DO_GRUPO} pelos valores do seu bot e grupo do Telegram

:local custLeaseHost;

:set custLeaseHost [/ip dhcp-server lease get value-name=host-name  [/ip dhcp-server lease find active-address="$leaseActIP"]];

:if ($leaseBound = 1) do={
/tool fetch url="https://api.telegram.org/bot{ID_DO_BOT}:/sendMessage?chat_id={ID_DO_GRUPO}&text=DHCP LEASE UP \F0\9F\94\B5 MAC=$leaseActMAC IP=$leaseActIP hostname=$custLeaseHost";
} else={
/tool fetch url="https://api.telegram.org/bot{ID_DO_BOT}:/sendMessage?chat_id={ID_DO_GRUPO}&text=DHCP LEASE DOWN \F0\9F\94\B4 MAC=$leaseActMAC IP=$leaseActIP hostname=$custLeaseHost";
}