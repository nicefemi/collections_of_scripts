#!/bin/bash






#=========================================================================
#
#    Configure Iptables rules on Redhat/CentOS 6.x
#
#    Author: Femi Amosu
#
#    Modified by: Serge K
#
#===========================================================================



#----------------------------------------------------------------------------


# Usage ./iptables.sh port protocol   Example: ./iptables.sh 80 tcp

#----------------------------------------------------------------------------






function usage
{
     echo -e "\n====================================================================\n"
     echo "              Usage -- ${0} "
     echo -e "\n--------------------------------------------------------------------\n"
     echo -e "\nPlease provide the port number and the protocol you want to configure\n"
     echo "  ${0} <port> <protocol>"
     echo " Example: ${0} 80 tcp"
     echo -e "\n======================================================================\n"
     exit 1
}


    ##Check if we have 2 arguments


    [[ ${#} -lt 2 ]] || [[ ${#} -gt 2 ]]  && usage


    ## Check if the port provided is a digit

    ## echo "${1}" | grep -E ^\-?[0-9]*\.?[0-9]+$  || [[ ${PORT} -gt 10000 ]] || echo -e "\nInvalid port number...\n";sleep 3;usage

    echo $ | grep -Eq '^()?[0-9]+$'

    if
     [[ ${?} -ne 0 ]]
    then
    echo -e "\nInvalid port number...\n"
    usage
    fi


   ## Variables



   PORT=${1}
   PROT=${2}
   PROT2=$( grep ${PORT}  iptables| awk '{print $4}' )



        ##Check if protocol provided is TCP/UDP


        if

               [[ ${PROT} != tcp ]] && [[ ${PROT} != udp ]];

        then
           echo -e "\nYou have entered: ${PROT} , Please provide a valid protocol (tcp/udp)\n"
           exit 1
        fi




       ## Check if the protocol provided is already configured


       if

            [[ ${PROT} == ${PROT2} ]];

       then
       echo -e "\nThe choosen port number is already configured with the ${PROT} protocol please chose a different port number or protocol\n"
       else
       echo -e "\nYour port is already configure with ${PROT2}, do you want to configure the same port with ${PROT} as well? (y/n) \n"
       read answer
       fi


       if
           [[ ${answer} == y ]];

       then

 sed -i "0,/.*-A INPUT -m state --state NEW.*/s/.*-A INPUT -m state --state NEW.*/-A INPUT -m state --state NEW -m $PROT -p $PROT --dport $PORT -j ACCEPT\n&/" /tmp/iptables
      else

      echo -e "\nThank you, nothing else to do, have a nice day!!\n"
      fi
