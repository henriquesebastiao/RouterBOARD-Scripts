# Este script envia (por meio da API do Telegram) informações do seu dispositivo Mikrotik para um grupo do Telegram.
# Informações enviadas: Nome do dispositivo, plataforma, nome da placa, versão do RouterOS, temperatura, voltagem, carga da CPU e tempo de atividade.

# Substituir {ID_DO_BOT} e {ID_DO_GRUPO} pelos valores do seu bot e grupo do Telegram

:local nomerb;
:set nomerb [/system identity get name];

:local platform;
:set platform [/system resource get platform];

:local boardname;
:set boardname [/system resource get board-name];

:local version;
:set version [/system resource get version];

:local temperatura;
:set temperatura [/system health get temperature];

:local voltagem;
:set voltagem [/system health get voltage];

:local cpuload;
:set cpuload [/system resource get cpu-load];

:local uptime;
:set uptime [/system resource get uptime];

/tool fetch url="https://api.telegram.org/bot{ID_DO_BOT}/sendMessage?chat_id={ID_DO_GRUPO}&text=DISPOSITIVO=$nomerb PLATAFORMA=$platform BOARD_NAME=$boardname VERSION=$version TEMPERATURA=$temperatura C VOLTAGEM=$voltagem CPU_LOAD=$cpuload% UPTIME=$uptime"