#!/bin/sh



# This is a collection of simple patchs
#
# The repos are not forked because most of the bugs are quite small 
# and i'm not going to fork things just because googles QA team
# was on holidays. (= i still have hope that google may fix this)

CWD=`pwd`

cd ../../../../

patch -d system/core     -f -p1 < $CWD/01-mkbootimage.diff

(
	cd hardware/qcom/bt
	git cherry-pick 5a6037f1c8b5ff0cf263c9e63777444ba239a056

	cd ../display
	git cherry-pick e9e1e3a16144a2410e592f67bab8e24c60df52ea
	git revert 0fdae193307fb17bb537598ab62682edd5138b72

	cd ../../../external/libnfc-nci/
	git fetch https://android.googlesource.com/platform/external/libnfc-nci refs/changes/42/103142/1 && git cherry-pick FETCH_HEAD

	cd ../..
)
