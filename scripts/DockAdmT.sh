#/bin/sh
#Script para administração de container Docker
#Autor: Israel C. Franca
#Data: 02/02/2026
#
clear
#
# BAse naval

testval="(^[a-zA-Z0-9\_\-]{3,15}$)"

#Funções
funcaolistrun() {
			#OPÇÃO 1
			clear
			echo "******************************************************************************"
			echo "                             Administração Docker                             "
	    	echo "******************************************************************************"
			echo 
			
			#Gera lista de containers em execução / Voltar para o teste com cut pois o awk não está funcionando bem
			contnamerun=$(docker ps --filter "status=running" --format "table {{.ID}} \t | \t {{.Status}} \t | \t {{.Names}}" | awk '/Up/ && /([a-zA-Z0-9\_]{3,30})/')
		
		if [ -n "$contnamerun" ]; then
		# if [ -z "$contnamerun" ]
		
			echo "=============================================================================="
			echo "=                         Containeres em execução                            ="
			echo "=============================================================================="
			echo "$contnamerun"
			echo "=============================================================================="
			
			echo "Pressione qualquer tecla para continuar."
			read -r _
			clear
		else
			
			echo "=============================================================================="
			echo "Não há containers em execução."      
			echo "=============================================================================="	
			echo "Pressione qualquer tecla para continuar.                    "
			echo "=============================================================================="
			read -r _
			clear
		fi 
        }

funcaoliststoped () {
	# OPÇÃO 2
	clear

	#Teste se há container parados. 
	contstoped=$(docker ps --filter "status=exited" --format "table {{.ID}} \t | \t {{.Status}} \t | \t {{.Names}}" | awk '/Exited/ && /([a-zA-Z0-9\_]{3,30})/')
	
	if [ -z "$contstoped" ]; then
		echo "Não há containeres parados, pressoine qualquer tecla para voltar ao menu principal." 
		read -r _
		funcaomenu
	else
		echo "******************************************************************************"
		echo "                             Administração Docker                             "
	    echo "******************************************************************************"
		echo 	

		echo "=============================================================================="
		echo "=                            Containeres parados                             ="
		echo "=============================================================================="
		echo "$contstoped"
		echo "=============================================================================="			
			echo "Pressione qualquer tecla para continuar."
			read -r _
			clear
		echo "=============================================================================="
	fi 	
	}

funcaostart () {
		#OPÇÃO 3
		clear
		
		# Lista de containers parados
		
		echo "******************************************************************************"
		echo "                             Administração Docker                             "
	    echo "******************************************************************************"
		echo
		echo "=============================================================================="
		echo "=                            Containeres parados                             ="
		echo "=============================================================================="
		# Gera lista de containers parados para consulta imediata
		docker ps -a  --filter "status=exited" --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}"
		
	while true
		do	
		
		#Cria variavel para checagem de containers parados.
		testcont=$(docker ps -a --filter "status=exited" --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | grep "Exited" | awk '{print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")

		
		# Se os contaneires estão paradaos, volta para o menu principal
		if [ -z "$testcont" ] ; then
		echo "******************************************************************************"
		echo "Não há containeres parados."
		echo "Pressoine qualquer tecla para voltar ao menu principal."
		read -r _
		echo "******************************************************************************"
		clear
		funcaomenu
		
		fi
		
		echo "=============================================================================="
			echo -n "Digite os ID ou nome do Container:  "
			read contidname
		
		echo "=============================================================================="
			if [ -z "$contidname" ] ; then
		echo "Informe a ID ou nome do container. Não pode ser vazio."
		echo "=============================================================================="

			else

				# Testar valoar com expressão regular na variavel global		
				if echo "$contidname" | egrep -q $testval && echo "$testcont" | egrep "$contidname" ; then 

				echo "******************************************************************************"	
					echo "O container será inicado."
					sleep 1
					docker container start "$contidname"
				echo "******************************************************************************"
					echo "Container iniciado, pressione qualquer tecla para continuar."
					read -r _
				echo "******************************************************************************"
				echo
					clear
				echo "=============================================================================="
				echo "Digite uma das opções abaixo:  "
				echo "=============================================================================="
				echo " 1 - Voltar ao menu principal"
				echo "=============================================================================="
				echo " 2 - Iniciar outro cotainer "
				echo "=============================================================================="
				echo " 3 - Sair"
				echo "=============================================================================="

					read opc
						case $opc in
							1 ) 
								echo "Voltar ao menu principal"
								clear
								funcaomenu
								;;
							2 ) 
								echo "Iniciar outro container"
									
									#Teste cont vazio
									testcont=$(docker ps -a --filter "status=exited" --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '/Exited/ {print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")
		
									if [ -z "$testcont" ] ; then
									echo "******************************************************************************"
									echo "Não há containeres parados."
									echo "Pressoine qualquer tecla para voltar ao menu principal."
									read -r _
									echo "******************************************************************************"
									echo
									clear
									funcaomenu
									else
									clear
									funcaostart
									fi
								;;
								
							3 )
								echo "Sair"
								clear
								exit
								;;
								
							* )
								echo "Informe uma opção válida"
								read -n "Pressione qualque tecla para continuar"
								;;
							esac
				
				else

					echo "******************************************************************************"
					echo "Container '$contidname' não existe ou está em execução. Verifique na tabela."
					echo "******************************************************************************"
					
					echo "=============================================================================="
					echo "Digite 1 para tentar novammente"
					echo "=============================================================================="
					echo "Digite 2 para voltar ao menu inicial"
					echo "=============================================================================="
					echo "Pressione qualquer outra tecla para sair"
					echo "=============================================================================="
					

					read opc
					case $opc in
					
					1 )
						echo "Tentar novamente"
						clear
						funcaostart
						;;
					2 ) 
						echo "Voltar ao memu principal"
						clear
						funcaomenu
						;;
					* ) 
						echo "Sair"
						clear
						exit
					;;
					esac
				fi
			fi
		done

	}	

funcaostop(){
		#OPÇÃO 4
		clear

		# Lista de containers em Execução
	
		echo "******************************************************************************"
		echo "                             Administração Docker                             "
	    echo "******************************************************************************"
		echo
		echo "=============================================================================="
		echo "=                          Containeres em execução                           ="
		echo "=============================================================================="
		# Gera lista de containers em execução para consulta imediata
		docker ps --filter "status=running" --format "table {{.ID}} \t | {{.Status}} \t | {{.Names}}"
	
	while true
	do	
		
		#Cria variavel para checagem de containers parados.
		testcont=$(docker ps -a --filter "status=running" --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '/Up/ {print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")

		if [ -z "$testcont" ] ; then
		echo "******************************************************************************"
		echo "Não há containeres em execução."
		echo "Pressoine qualquer tecla para voltar ao menu principal."
		read -r _
		echo "******************************************************************************"
		clear
		funcaomenu
		fi
		
		echo "=============================================================================="
			echo "Digite os ID ou nome do Container:  "
			read contidname
		
		echo "******************************************************************************"
			if [ -z "$contidname" ] ; then
		echo "Informe a ID ou nome do container. Não pode ser vazio. Ctrl+c para sair."
		echo "******************************************************************************"

			else

			#VARIAVEL PARA PEMITIR QUE SEJA RECONHECIDO TANTO CONTAINER ID QUANDO NOME
			
				# Testar valoar com expressão regular na variavel global		
				if echo "$contidname" | egrep $testval && echo "$testcont" | egrep "$contidname" ; then 
										
				echo "=============================================================================="	
				echo "Inciando container..."
				sleep 1
				docker container stop $contidname
				echo "******************************************************************************"
				echo "Container parado, pressione qualquer tecla para continuar."
				read -r _
				echo				
				clear
				echo "******************************************************************************"
				echo "Digite uma das opções abaixo:  "
				echo "=============================================================================="
				echo " 1 - Voltar ao menu principal"
				echo "=============================================================================="
				echo " 2 - Parar outro container "
				echo "=============================================================================="
				echo " 3 - Sair"
				echo "=============================================================================="
				
					read opc
						case $opc in
							1 ) 
								echo "Voltar ao menu principal"
								clear
								funcaomenu
								;;
							2 ) 
								echo "Iniciar outro container"
									
									#Teste cont vazio
									testcont=$(docker ps -a --filter "status=running" --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '/Up/ {print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")
		
									if [ -z "$testcont" ] ; then
									echo "******************************************************************************"
									echo "Não há containeres em execução."
									echo "Pressoine qualquer tecla para voltar ao menu principal."
									read -r _
									echo "******************************************************************************"
									clear
									funcaomenu
									else
									clear
									funcaostop
									fi
								;;
								
							3 )
								echo "Sair"
								clear
								exit
								;;
								
							* )
								echo "Informe uma opção válida"
								echo "Pressione qualque tecla para continuar"
								read -r _
								;;
							esac
										
				else
					echo "******************************************************************************"
					echo "Container '$contidname' não existe ou está parado. Pressione qualquer tecla para voltar."
					read -r _
					clear
					funcaostop
					echo "******************************************************************************"
				fi
			fi
	done

	}	


funcaoremove (){
		#OPÇÃO 5
		clear

		# Lista de containers do Docker
	
		echo "******************************************************************************"
		echo "                             Administração Docker                             "
	    echo "******************************************************************************"
		echo
		echo "=============================================================================="
		echo "=                           Containeres existes                              ="
		echo "=============================================================================="
		# Gera lista de containers para remoção
		docker ps -a --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" 
	
	while true
	do	
		
		#Cria variavel para remoção dos containers | Verificar a variável zerar a entrada
		validacontainer=$(docker ps -a --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | wc -l)
		# testcont=$(docker ps -a --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | grep  "Exited" | cut -f1-12 -d " " | egrep "([a-zA-Z0-9\_]{3,30})")
		testcont=$(docker ps -a --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '/Exited/ {print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")
		containeron=$(docker ps --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '/Up/ {print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")

		if [ $validacontainer -le 1 ]; then

		echo "******************************************************************************"
		echo "Não existe containers."
		echo "Pressoine qualquer tecla para voltar ao menu principal."
		read -r _
		echo "******************************************************************************"
		clear
		funcaomenu
		else
			
			echo "=============================================================================="
				echo "Digite o ID ou nome do Container:  "
				read contidname
			
			if [ -n "$containeron" ] && echo "$contidname" | egrep $testval && echo "$containeron" | egrep "$contidname" ; then 

						echo "=============================================================================="
						echo 						"Container está em execução"
						echo "=============================================================================="				
						echo " 1 - Forçar a remoção"
						echo " 2 - Voltar ao menu anterior"
						echo " 3 - Voltar ao menu inicial"
						echo "=============================================================================="
							read opc
							case $opc in

								1 )
									echo "Apagando container $contidname"
									sleep 3
									docker container rm -f "$contidname" 
									echo "Container foi removido, pressione qualquer tecla para voltar ao menu anterior."
									read -r _
									funcaoremove
									;;
								2 ) 
									funcaoremove
									;;
								3 )
									funcaomenu
									;;
								* ) 
									echo "Digite um valor válido"
									;;
								esac
			else
			echo "******************************************************************************"
				if [ -z "$contidname" ] ; then
			echo "Informe a ID ou nome do container. Não pode ser vazio. Ctrl+c para sair."
			echo "******************************************************************************"
			
				else

				#VARIAVEL PARA PEMITIR QUE SEJA RECONHECIDO TANTO CONTAINER ID QUANDO NOME
				
					#Testar valoar com expressão regular na variavel global		
						if echo "$contidname" | egrep $testval && echo "$testcont" | egrep "$contidname" ; then 
							
						echo "=============================================================================="	
						echo "Apagando  container..."
						sleep 1
						docker container rm $contidname
						echo "******************************************************************************"
						echo "Container removido, pressione qualquer tecla para continuar."
						read -r _
						echo	
						clear
						echo "******************************************************************************"
						echo "Digite uma das opções abaixo:  "
						echo "=============================================================================="
						echo " 1 - Voltar ao menu principal"
						echo "=============================================================================="
						echo " 2 - Remover outro container "
						echo "=============================================================================="
						echo " 3 - Sair"
						echo "=============================================================================="
						
							read opc
								case $opc in
									1 ) 
										echo "Voltar ao menu principal"
										clear
										funcaomenu
										;;
									2 ) 
										echo "Iniciar outro container"
											
											#Teste cont vazio
											testcont=$(docker ps -a --format "table {{.ID}} \t | {{.Names}} \t | {{.Status}}" | awk '{print $1}' | egrep "([a-zA-Z0-9\_]{3,30})")
				
											if [ -z "$testcont" ] ; then
											echo "******************************************************************************"
											echo "Não há containeres."
											echo "Pressoine qualquer tecla para voltar ao menu principal."
											read -r _
											echo "******************************************************************************"
											clear
											funcaomenu
											else
											clear
											funcaoremove
											fi
										;;
										
									3 )
										echo "Sair"
										clear
										exit
										;;
										
									* )
										echo "Informe uma opção válida"
										read -n "Pressione qualque tecla para continuar"
										;;
									esac
												
						else
							echo "******************************************************************************"
							echo "Container '$contidname' não existe ou está parado. Pressione qualquer tecla para voltar."
							read -r _
							clear
							funcaoremove
							echo "******************************************************************************"
						fi
					fi
				fi
			fi
	done


		}



funcaoprune (){}
funcaobuild (){}
funcaopull(){}
funcaorun (){}
funcaolistimg(){}
funcaormimg(){}
funcaopruneimg(){}
funccaolistvol(){}
funcaolistnetw(){}
funcaocreatenet(){}
funcaocreavevol(){}

#MENU PRINCIPAL
funcaomenu(){

while true
do

echo "**************************************************************"
echo "*  ADMINSTRAÇÃO DE CONTAINERS, IMAGENS, REDE, VOLUMES        *"
echo "**************************************************************"
echo "*               ESCOLHA UMA DAS OPÇÕES ABAIXO                *"
echo "**************************************************************"
echo "*  1 - Listar containers em execução                         *"
echo "*  2 - Listar containers parado                              *"
echo "*  3 - Iniciar container                                     *"
echo "*  4 - Parar um container                                    *"
echo "*  5 - Remover container                                     *"
echo "*  6 - Sair                                                  *"
echo "**************************************************************"

echo -n "Digite uma opção do menu...:"
read opc
case $opc in

	1 )
	 # Listar containers "--format "table {{.ID}}\t{{.Image}}\t{{.Names}}"
	
		funcaolistrun
		
		;;
	2 ) 
	# Listar containers parados
		
		funcaoliststoped
		;;
	 3 )
	  # Iniciar um container

		funcaostart
		;;
		
	4 )
	# Parar um container
		
		funcaostop
		;;
	
	5 )
	# Remover container

		funcaoremove	
		;;
	
	6 )
		echo "Bye"
		sleep 1
		clear
		exit ;;

	* ) 
		echo "Digite uma opção válida"
		clear
		sleep 1 ;;
esac
done
}
funcaomenu
