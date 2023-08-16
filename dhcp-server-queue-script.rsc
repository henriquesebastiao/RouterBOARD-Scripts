# Este script é executado quando um cliente recebe um IP do servidor DHCP
# O script cria uma queue automaticamente para o cliente e remove a queue quando o cliente libera o IP
# O script também emite uma mensagem de log com o MAC, IP e hostname do cliente sempre que o cliente recebe ou libera o IP

# Os valores para Download e Upload são definidos na linha 17 (max-limit=2M/5M)
# Você pode alterar os valores de acordo com a sua necessidade

:local custLeaseHost;

# Obtém o hostname do dispositivo
:set custLeaseHost [/ip dhcp-server lease get value-name=host-name  [/ip dhcp-server lease find active-address="$leaseActIP"]];

:if ($leaseBound = 1) do={
# Emite uma mensagem de log
/log warning message="DHCP LEASE UP MAC=$leaseActMAC IP=$leaseActIP hostname=$custLeaseHost";

# Cria uma queue para o cliente
/queue simple add comment=$leaseActMAC target=$leaseActIP max-limit=2M/5M;
} else={
/log warning message="DHCP LEASE DOWN MAC=$leaseActMAC IP=$leaseActIP hostname=$custLeaseHost";

# Remove a queue criada para o cliente
/queue simple remove [find comment=$leaseActMAC];
}