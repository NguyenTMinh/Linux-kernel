#!/bin/sh 

 command=$1 

 if [ -z "$command" ] 

     then echo "chua nhap chuc nang" 

 fi 

 # file management 

 if [ $command = "list" ] 

     then 

         ls -la 

 fi 

 if [ $command = "create" ] 

     then 

         if [ -z $2 ] 

             then echo "chua co ten file" 

             else cat > "$2" 

         fi 

 fi 

 if [ $command = "remove" ] 

     then 

         if [ -z $2 ] 

             then echo "chua co ten file" 

             else unlink "$2" 

         fi 

 fi 

 if [ $command = "show" ] 

     then 

         if [ -z $2 ] 

             then echo "chua co ten file" 

             else cat "$2" 

         fi 

 fi 

if [ $command = "edit" ] 

     then 

         if [ -z $2 ] 

             then echo "chua co ten file" 

             else nano "$2" 

         fi 

 fi 

  

 if [ $command = "rename" ] 

     then 

         if [ -z $2 -o -z $3 ] 

             then echo "chua nhap ten file va ten file moi" 

             else mv "$2" "$3" 

         fi 

 fi 

  

 if [ $command = "copy" ] 

     then 

         if [ -z $2 -o -z $3 ] 

             then echo "chua nhap ten file va file dich" 

             else cp "$2" "$3" 

         fi 

 fi 
