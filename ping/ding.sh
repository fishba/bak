date=`date +%Y-%m-%d" "%H:%M:%S"   "`
curl 'https://oapi.dingtalk.com/robot/send?access_token=5702c1cbb9d705d8666563b9950de45dfc800e009e879de35ed90dfee4f0d855' \
	-H 'Content-Type: application/json' \
	-d '
	{
		"msgtype": "text",
		"text": {
		"content": "'"${date}${1}"'"
	},
"isAtAll": false

}'
