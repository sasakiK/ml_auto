#!/bin/bash

# 実行時の年月日時間を取得
current_time=`date +\%Y%m%d_%H`

# 出力先のフォルダを作成 --

# 1時間以内に2回以上実験した場合、current_timeを分単位にする
if [ -e output/experiment_${current_time} ]; then
  current_time=`date +\%Y%m%d_%H_%M`
fi

# resultのフォルダを空にする
mkdir output/experiment_${current_time}


# 分析を実行 --
Rscript knit_experiment.R "八幡" ${today} >> ${log_file_path}