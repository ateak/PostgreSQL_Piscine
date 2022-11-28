#!/bin/bash
echo "Введите путь:"
read add_dir
echo "Название дня:"
read add_day
echo "Количество ex__"
read add_iter
for i in $(seq 0 $add_iter)
do
	if [[ $i -lt 10 ]];
	then
		mkdir $add_dir/ex0$i
		touch $add_dir/ex0"$i"/"$add_day"_ex0$i.sql
	else
		mkdir $add_dir/ex$i
		touch $add_dir/ex"$i"/"$add_day"_ex$i.sql
	fi
done
