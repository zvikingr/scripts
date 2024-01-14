#! /bin/bash

set -x
for v in *.mp4
do
    #将 mp4 文件封装为 ts 格式
    ffmpeg -i $v -vcodec copy -acodec copy -vbsf h264_mp4toannexb $v.ts
done

str="concat:"
for v in *.mp4.ts
do
    str="$str$v|"
done

# 去除末尾的竖线
str=${str%|}
echo $str
ffmpeg -i "$str" -acodec copy -vcodec copy -absf aac_adtstoasc output.mp4

# 删除过程中生成的 ts 文件
rm *.ts
