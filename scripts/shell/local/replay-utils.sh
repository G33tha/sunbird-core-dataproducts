#!/bin/bash

rollback() {
	bucket_name=$1
	prefix=$2
	backup_dir=$3

	src="s3://$bucket_name/$prefix/"
	dst="s3://$bucket_name/$backup_dir/"
	echo "Copy back the $prefix files to source directory $src from backup directory $dst"
	#aws s3 cp $dst $src --recursive --include "*"
}

delete() {
	bucket_name=$1
	backup_dir=$2

	path="s3://$bucket_name/$backup_dir/"
	echo "Deleting the back-up files from $path"
	#aws s3 rm $path --recursive
}

backup() {
	dt_start=$1
	dt_end=$2
	prefix=$4
	bucket_name=$3
	backup_dir=$5

	ts_start=$(date -d $dt_start +%s)
	ts_end=$(date -d $dt_end +%s)
	src="s3://$bucket_name/$prefix/"
	dst="s3://$bucket_name/$backup_dir/"


	echo "Backing up the files from $src to $dst for the date range - ($dt_start, $dt_end)"
	#while [ $ts_start -le $ts_end ] 
	#do
	#	date=`date -d @$ts_start +%F`
	#    aws s3 mv $src $dst --recursive --exclude "*" --include "$date-*"
	#    let ts_start+=86400
	#done
}