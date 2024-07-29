:global nome [/system identity get name]
:global data [/system clock get date]
:global hora [/system clock get time]
/system backup save name=BACKUP-NAME.backup;
/tool e-mail send to="your-email@email.com" subject="Mikrotik: Backup BACKUP-NAME" file="BACKUP-NAME.backup" body="Segue em anexo o arquivo de backup da $nome realizado em $data as $hora";
:log warning message="Backup e-mail sent.”;