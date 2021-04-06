rm -rf dist && // && 表示上一步运行成功了，再运行下一步
yarn build &&
cd dist
git init &&
git add . &&
git commit -m "update" &&
git branch -M master &&
git remote add origin git@github.com:A-aronYang/pang-ui-website.git 
git push -f -u origin master &&
cd .. // 返回到上一层目录 或者 cd -
echo https://a-aronyang.github.io/pang-ui-website/#/ // 运行完显示网址