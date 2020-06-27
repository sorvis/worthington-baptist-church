#!/bin/sh

#git add -A && \
#git reset --hard && \
git checkout master && \
git pull && \

# argument
#ARCHIVE_LINK="https://archive.org/details/sm-6-7-2020" && \
ARCHIVE_LINK=$1 && \

POST_MONTH=`echo $ARCHIVE_LINK | awk -F "-" '{print $2}'` && \
POST_DAY=`echo $ARCHIVE_LINK | awk -F "-" '{print $3}'` && \
POST_YEAR=`echo $ARCHIVE_LINK | awk -F "-" '{print $4}'` && \

BRANCH_NAME="add_audio_$(echo $POST_MONTH)_$(echo $POST_DAY)_$(echo $POST_YEAR)" && \

git branch -D $BRANCH_NAME && \
git checkout -b $BRANCH_NAME && \

FILE_NAME="$(echo $POST_YEAR)-$(printf "%02d\n" $POST_MONTH)-$(printf "%02d\n" $POST_DAY)-online-service.md" && \
FILE_PATH="_posts/$FILE_NAME" && \

echo '---' > $FILE_PATH 
echo 'title: "'$POST_MONTH'/'$POST_DAY'/'$POST_YEAR' Online Service"' >> $FILE_PATH
echo 'published: true' >> $FILE_PATH
echo 'thumbnail: "/assets/J93hxt0rFsAmq.jpg"' >> $FILE_PATH
echo 'audio: "https://archive.org/download/sm-'$POST_MONTH'-'$POST_DAY'-'$POST_YEAR'/SM%20'$POST_MONTH'-'$POST_DAY'-'$POST_YEAR'.mp3"' >> $FILE_PATH
echo '---' >> $FILE_PATH

