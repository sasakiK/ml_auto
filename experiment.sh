#!/bin/bash

# 実行時の年月日時間を取得
current_time=`date +\%Y%m%d_%H`

# 1時間以内に2回以上実験した場合、current_timeを分単位にする
if [ -e output/experiment_${current_time} ]; then
  current_time=`date +\%Y%m%d_%H_%M`
fi

# output先のフォルダを作成
mkdir output/experiment_${current_time}


# グループごとに実行 --
for group_name in group1 group2 group3 group4 group5 group6
do 
Rscript knit_rmd.R ${group_name} ${current_time}
done

# output先のフォルダを圧縮
# tar czf output/experiment_${current_time}.tar.gz output/experiment_${current_time}
# メールで送信
# Rscript send_to_home.R output/experiment_${current_time}.tar.gz
# echo "this is body" | sudo mail -s MailSubject -c k.coobb@gmail.com -- -f user@hogehoge.com
