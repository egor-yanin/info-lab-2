#!/bin/bash
binary () {
declare -a temp
j=0
num=$1
result=""
while (( num>0 )); do
    temp[$j]=$((num%2))
    num=$((num/2))
    ((j++))
done
j=7
while (( j>=0 )); do
    if [[ ${temp[$j]} -eq "" ]]
    then
        result="${result}0"
    else
        result="${result}${temp[$j]}"
    fi
    ((j--))
done
echo $result
}

func () {
count=0
declare -a answer
for i in ${1//./ } ; do
    if [ $i -lt 256 ] && [ $i -ge 0 ]
    then
        answer[$count]=$( binary $i)
        ((count++))
    else
        return 1
    fi
done
echo "${answer[0]}.${answer[1]}.${answer[2]}.${answer[3]}"
}

ip=$( func $1)
if [ $? -eq 1 ]
then
    echo "Неверный IP-адрес"
else
    echo $ip
fi
