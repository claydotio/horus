#!/bin/bash

mkdir -p $LOG_DIR/horus

while read -d $'\0' -r file; do
  COLUMNS=`head -n 1 $file`
  DATA_SET=`basename $file | sed s/_horus\.tsv$//g`
  OUTPUT_NAME=`date --date="1 hour ago" +"%Y%m%d.%H.tsv"`

  echo "COLUMNS"
  echo $COLUMNS
  echo "DATA SET"
  echo $DATA_SET
  echo "OUTPUT NAME"
  echo $OUTPUT_NAME

  cp $file $LOG_DIR/horus/tmp
  echo $COLUMNS > $file
  aws s3 cp $LOG_DIR/horus/tmp s3://$BUILD_BUCKET/iupload/tsvtoindex/$DATA_SET/$OUTPUT_NAME
  rm $LOG_DIR/horus/tmp
done < <(find $LOG_DIR -iname '*_horus.tsv' -print0)
