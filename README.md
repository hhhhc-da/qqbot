## QQbot README.md
Help you easily create a bot with 3 repository.

# Prepare a bot's source code
Such as mai-bot:

root@user:/home/user/bot/maibot# git clone https://github.com/Diving-Fish/mai-bot.git

(or open link 'https://github.com/Diving-Fish/mai-bot' in Chrome, 'Code' -> 'Download Zip')

To start 'bot.py',you need a python interpreter first.

Use Chrome to open this link & download Anaconda and install.

https://www.anaconda.com/download#downloads

(My OS is Debian aarch64(ARM64), please check your OS)

In shell/powershell/cmd:

('Ctrl+Alt+T' on Linux or 'menu+R' -> 'cmd' -> 'Enter' on Windows)

root@user:/home/user/# conda create -n qqbot python=3.9

(If you cannot use 'conda',please 'source ~/.bashrc' on Linux or check your Environment variable set on Windows)

Start python environment ( version: 3.9.x ).

root@user:/home/user/# conda activate qqbot

Now ,your shell become this:

(qqbot)root@user:/home/user/# 

Install python libs by using 'pip':

(qqbot)root@user:/home/user/# pip install -r requirment.txt

OK, we can use it by this command:

(qqbot)root@user:/home/user/bot/maibot# python bot.py

# Get qsign to set up a sign server
In this README, qsign version is 1.1.9 

('qsign' & 'go-cqhttp' version must be matching!!! Otherwise you will return 'Code: 45')

Download qsign with this link:

 - plan A:

    https://github.com/fuqiuluo/unidbg-fetch-qsign/releases/tag/1.1.9

    Download 'unidbg-fetch-qsign.3.zip' and unpatch it with 'winrar' or other software.

 - plan B:

    root@user:/home/user/bot/qsign# git clone https://github.com/fuqiuluo/unidbg-fetch-qsign.git

    (or open link 'https://github.com/fuqiuluo/unidbg-fetch-qsign' in Chrome, 'Code' -> 'Download Zip')

    root@user:/home/user/bot/qsign# ./gradlew build

After this step, it become easy.

root@user:/home/user/bot/qsign# vim ./txlib/8.9.63/config.json

It's look like:

    {
      "server": {
        "host": "0.0.0.0",
        "port": 8080
      },
      "key": "114514",
      "auto_register": true,
      "protocol": {
        "package_name": "com.tencent.mobileqq",
        "qua": "V1_AND_SQ_8.9.63_4194_YYB_D",
        "version": "8.9.63",
        "code": "4194"
      },
      "unidbg": {
        "dynarmic": false,
        "unicorn": true,
        "debug": false
      }
    }

Change host, such as ' "host": "127.0.0.1", ' to protect your server.

Write a start shell program like:

root@user:/home/user/bot/qsign# echo "bash bin/unidbg-fetch-qsign --basePath=txlib/8.9.63" > start.sh && chmod -R 755 start.sh

(Or make a new 'txt' file and write 'start bin/unidbg-fetch-qsign.bat --basePath=txlib/8.9.63' then change filename to 'start.bat' on Windows, and you can execute it by double click it)

OKK, we can use it by this command:

root@user:/home/user/bot/qsign# bash start.sh

(It's okay with graphic interface, try double click it.)

# Get qsign to set up a sign server


















