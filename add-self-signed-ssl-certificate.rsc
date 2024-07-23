/certificate add name=local-cert common-name=local-cert key-usage=key-cert-sign,crl-sign
/certificate sign local-cert
/certificate add name=webfig common-name=LAN-IP
/certificate sign webfig
/ip/service/set www-ssl disabled=no certificate=webfig port=443