#!/bin/sh 

command=$1 

if [ -z "$command" ]; then 
    echo "Chua nhap chuc nang" 
    exit 1
fi 

if [ "$command" = "list" ]; then 
    crontab -l 
    exit 0
fi 

if [ "$command" = "create" ]; then 
    echo "Xin hay nhap doan lenh ban muon lap lich" 
    read order 
    echo "Gio ban se nhap gio va phut de chay." 
    echo "Hay nhap gio" 
    read hour 
    echo "Hay nhap phut" 
    read min 
    echo "Gio ban can nhap ngay tac vu chay hang thang." 
    echo "Neu ban muon chay tac vu hang ngay, hay nhap *" 
    echo "Neu ban muon chon ngay rieng le, hay nhap cac ngay ban mong muon, phan cach boi dau \",\"" 
    read day 
    echo "Gio ban can nhap thang tac vu ma tac vu chay." 
    echo "Neu ban muon tac vu chay hang thang, hay nhap *" 
    echo "Neu ban muon chon thang rieng le, hay nhap cac thang ban mong muon, phan cach boi dau \",\"" 
    read month 
    echo "Gio ban can nhap ngay tac vu chay hang tuan." 
    echo "Neu ban muon chay tac vu hang ngay, hay nhap *" 
    echo "Neu ban muon chon thu rieng le, hay nhap cac thu ban mong muon, phan cach boi dau \",\"" 
    echo "Xin nho rang gia tri 0 la Chu nhat" 
    read dow 
    echo "Ban co chac la ban muon thuc hien thao tac nay khong?" 
    read confirmation 
    if [ "$confirmation" = 'Y' ]; then 
        echo "$min $hour $day $month $dow $order" >> "input1.txt" 
        crontab -l -u "$LOGNAME" | cat - "input1.txt" | crontab -u "$LOGNAME" - 
        rm -f "input1.txt" 
    else 
        echo "Aborted\n" 
        exit 1
    fi 
    exit 0
fi 

if [ "$command" = "remove-all" ]; then 
    crontab -r 
    exit 0
fi 

if [ "$command" = "edit" ]; then 
    crontab -e 
    exit 0
fi 

echo "Invalid command" 
exit 1

