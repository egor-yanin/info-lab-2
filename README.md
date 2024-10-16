# Отчёт по лабораторной работе №2

Чтобы переводить числа из десятичной системы счисления в двоиную, я написал функцию binary. Пока число больше 0, алгоритм делит его на 2 и остаток от деления записывает в массив. Затем в обратном порядке он записывает остатки из массива и возвращает полученную таким образом двоичную запись числа.

```bash
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
```

Затем я реализовал функцию func, которая превращает десятичный IP-адрес в двоичный. Алгоритм заменяет точки в адресе пробелами и проходится по значениям в цикле for. Каждое число переводится в двоичную систему счисления с помощью функции binary и записыввается в массив, а затем все числа в двоичной записи выводятся через точку в stdout.

```bash
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
```

Результат выполнения скрипта:  
![](https://i.ibb.co/NY7pcYZ/image.png)
