#!/bin/bash

file=$1
nhanthongtin(){
	touch ${file}
	echo "Nhap thong tin vao file$1"
	while true
	do
		read line
		if [ "$line" == "finished" ]; then
			break;
		else
			echo ${line} >> ${file}
		fi
	done
}
#nhanthongtin
xuatthongtin(){
	while read line
	do
		echo ${line}
		
	done < ${file}
}
#xuatthongtin
getIPfromOS(){
	echo "Nhap vao he dieu hanh: "
	read hdh
	while read line
	do
		ip=$(echo ${line} | awk 'BEGIN{FS=" "}{print $3}')
		if [ "$hdh" == "$ip" ]; then
			rs=$(echo ${line} | awk 'BEGIN{ FS=" "}{print $2}')
			echo $rs

		fi		

	done < ${file}
	
}

#getIPfromOS
getIPfromProtocol(){
	echo "Nhap vao ten giao thuc: "
	read protocol
	while read line
	do
		ip=$(echo ${line} | awk 'BEGIN{FS=" "}{print $1}')
		rs=$(echo ${line} | awk 'BEGIN{FS=" "}{print $2}')
		if [ "$protocol" == "$ip" ]; then
			
		echo $rs
		fi
	done < ${file}

}

#getIPfromProtocol

CountProtocol(){
	echo "Nhap vao ten giao thuc: "
	read protocol
	count=0
	while read line
	do
		pro=$(echo ${line} | awk 'BEGIN{FS=" "}{print $1}')
		if [ "$protocol" == "$pro" ]; then
			((count++))
		fi
	done < ${file}
	echo "So lan ket noi cua giao thuc $protocol la: $count"	
}
#CountProtocol

findOS(){
	i=0
	while read line
	do
		os=$(echo ${line} | awk 'BEGIN{FS=" "}{print $3}')
		a[i]=$os
		((i++))
	done < ${file}
	echo "He dieu hanh truy cap la:"
	echo "${a[*]}"
	
}
#findOS
Info(){
	touch thongke.txt
	Windows=0
	MACOS=0
	Linux=0
	

	for i in ${a[*]}
	do
		if [ "$i" == "Windows" ]; then
			((Windows++))
		elif [ "$i" == "Linux" ]; then
			((Linux++))
		else
			((MACOS++))
				
		fi
		
	done 
		echo " Windows $Windows" >> thongke.txt
		echo "Linux $Linux" >> thongke.txt
		echo "MACOS $MACOS" >> thongke.txt
		echo "Thong ke thanh cong!"
	
}
#findOS
#echo "Thong ke he dieu hanh"
#	Info

chuongtrinhchinh(){
	echo "DO THI THANH MUI – 3118410275"

	echo "Hay thuc hien lua chon:"
	echo "1. Nhap thong tin vao file data"
	echo "2. Xuat toan bo thong tin trong file data"
	echo "3. Nhap vao he dieu hanh de biet dia chi IP"
	echo "4. Nhap vao giao thuc de biet IP"
	echo "5. Nhap vao giao thuc de biet so lan ket noi"
	echo "6. Thuc hien thong ke"
	echo "7. Ket thuc"
	
	while true
	do
		echo "Nhap lua chon: "	
		read option
		case $option in
			1 ) nhanthongtin ;;
			2 ) xuatthongtin ;;
			3 ) getIPfromOS ;;
			4 ) getIPfromProtocol ;;
			5 ) CountProtocol ;;
			6 ) findOS
				Info
				;;
			* ) echo "Ket thuc"
				exit 0 ;;
		esac
	done
	
}
chuongtrinhchinh













