#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de criação: 31/05/2016
# Data de atualização: 21/11/2016
# Versão: 0.7
# Testado e homologado para a versão do Ubuntu Server 16.04 LTS x64
# Kernel >= 4.4.x
#
# Instalação dos pacotes principais para a primeira etapa, indicado para a distribuição GNU/Linux Ubuntu Server 16.04 LTS x64
#
# Atualização das listas do Apt-Get
# Atualização dos Aplicativos Instalados
# Atualização da Distribuição Ubuntu Server (Kernel)
# Auto-Limpeza do Apt-Get
# Limpando o repositório Local do Apt-Get
# Reiniciando o Servidor
#
# Utilizar o comando: sudo -i para executar o script
#
# Caminho para o Log do Script-00.sh
LOG="/var/log/script-00.log"
#
# Variável da Data Inicial para calcular tempo de execução do Script
DATAINICIAL=`date +%s`
#
# Validando o ambiente, verificando se o usuário e "root"
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`

if [ "$USUARIO" == "0" ]
then
	if [ "$UBUNTU" == "16.04" ]
		then
			if [ "$KERNEL" == "4.4" ]
				then
					 clear
					 echo -e "Usuário é `whoami`, continuando a executar o Script-00.sh"
					 echo
					 echo -e "01. Atualização das listas do Apt-Get"
					 echo -e "02. Atualização dos Aplicativos Instalados"
					 echo -e "03. Atualização da Distribuição Ubuntu Server (Kernel)"
					 echo -e "04. Autoremoção dos Aplicativos do Apt-Get"
					 echo -e "05. Limpando o repositório Local do Apt-Get (Cache)"
					 echo
					 echo -e "Após o término o Servidor será reinicializado"
					 echo -e "Aguarde..."
					 echo
					 echo -e "Rodando o Script-00.sh em: `date`" > $LOG
					 echo  ============================================================ >> $LOG
					 echo -e "Atualizando as Listas do Apt-Get" >> $LOG
					 echo -e "Atualizando as Listas do Apt-Get"
					 #Exportando a variável do Debian Frontend Noninteractive para não solicitar interação com o usuário
					 export DEBIAN_FRONTEND=noninteractive
					 #Atualizando as listas do apt-get
					 apt-get update &>> $LOG
					 echo -e "Listas Atualizadas com Sucesso!!!"
					 echo
					 echo -e "Listas Atualizadas com Sucesso!!!" >> $LOG
					 echo  ============================================================ >> $LOG

					 echo -e "Atualização dos Aplicativos Instalados" >> $LOG
					 echo -e "Atualização dos Aplicativos Instalados"
					 echo  >> $LOG
					 #Fazendo a atualização de todos os pacotes instalados no servidor
					 apt-get -o Dpkg::Options::="--force-confold" upgrade -q -y --force-yes &>> $LOG
					 echo -e "Sistema Atualizado com Sucesso!!!"
					 echo
					 echo -e "Sistema Atualizado com Sucesso!!!" >> $LOG
					 echo  ============================================================ >> $LOG

					 echo -e "Atualização da Distribuição Ubuntu Server (Kernel)" >> $LOG
					 echo -e "Atualização da Distribuição Ubuntu Server (Kernel)"
					 echo  >> $LOG
					 echo -e "Kernel atual: `uname -r`" >> $LOG
					 echo -e "Versão do Kernel atual: `uname -r`"
					 #Fazendo a atualização do Kernel
					 apt-get -o Dpkg::Options::="--force-confold" dist-upgrade -q -y --force-yes &>> $LOG
					 echo -e "Kernel Atualizado com Sucesso!!!"
					 echo -e "Listando os Kernel instalados"
					 #Listando as imagens dos Kernel instalados
					 dpkg --list | grep linux-image
					 echo
					 echo -e "Kernel Atualizado com Sucesso!!!" >> $LOG
					 echo ============================================================ >> $LOG

					 echo -e "Autoremoção dos Aplicativos desnecessários" >> $LOG
					 echo -e "Autoremoção dos Aplicativos desnecessários"
					 #Removendo aplicativos que não estão sendo mais usados
					 apt-get -y autoremove &>> $LOG
					 echo -e "Remoção feita com Sucesso!!!"
					 echo
					 echo -e "Remoção feita com Sucesso!!!" >> $LOG
					 echo ============================================================ >> $LOG
					 echo >> $LOG
					 
					 echo -e "Limpando o Cache do Apt-Get" >> $LOG
					 echo -e "Limpando o Cache do Apt-Get"
					 #Limpando o diretório de cache do apt-get
					 apt-get clean &>> $LOG
					 echo -e "Cache Limpo com Sucesso!!!"
					 echo
					 echo -e "Cache Limpo com Sucesso!!!" >> $LOG
					 echo ============================================================ >> $LOG
					 echo >> $LOG
					 
					 echo -e "Fim do Script-00.sh em: `date`" >> $LOG

					 echo
					 echo -e "Atualização das Listas do Apt-Get, Atualização dos Aplicativos e Atualização do Kernel Feito com Sucesso!!!!!"
					 echo
					 # Script para calcular o tempo gasto para a execução do script-00.sh
						 DATAFINAL=`date +%s`
						 SOMA=`expr $DATAFINAL - $DATAINICIAL`
						 RESULTADO=`expr 10800 + $SOMA`
						 TEMPO=`date -d @$RESULTADO +%H:%M:%S`
					 echo -e "Tempo gasto para execução do script-00.sh: $TEMPO"
					 echo -e "Pressione <Enter> para reinicializar o servidor: `hostname`"
					 read
					 sleep 2
					 reboot
					 else
						 echo -e "Versão do Kernel: $KERNEL não homologada para esse script, versão: >= 4.4 "
						 echo -e "Pressione <Enter> para finalizar o script"
						 read
			fi
	 	 else
			 echo -e "Distribuição GNU/Linux: `lsb_release -is` não homologada para esse script, versão: $UBUNTU"
			 echo -e "Pressione <Enter> para finalizar o script"
			 read
	fi
else
	 echo -e "Usuário não é ROOT, execute o comando com a opção: sudo -i <Enter> depois digite a senha do usuário `whoami`"
	 echo -e "Pressione <Enter> para finalizar o script"
	read
fi
