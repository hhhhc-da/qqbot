## QQbot README.md
Help you easily create a bot with 3 repository.

# Prepare a bot's source code
Such as mai-bot:

root@user:/home/user/bot/maibot# 

{
git clone https://github.com/Diving-Fish/mai-bot.git
}

(or open link 'https://github.com/Diving-Fish/mai-bot' in Chrome, 'Code' -> 'Download Zip')

To start 'bot.py',you need a python interpreter first.

Use Chrome to open this link & download Anaconda and install.

{
https://www.anaconda.com/download#downloads
}

(My OS is Debian aarch64(ARM64), please check your OS)

In shell/powershell/cmd:

('Ctrl+Alt+T' on Linux or 'menu+R' -> 'cmd' -> 'Enter' on Windows)

{
  root@user:/home/user/# conda create -n qqbot python=3.9
}

(If you cannot use 'conda',please 'source ~/.bashrc' on Linux or check your Environment variable set on Windows)

Start python environment ( version: 3.9.x ).

{
  root@user:/home/user/# conda activate qqbot
}

Now ,your shell become this:

{
  (qqbot)root@user:/home/user/# 
}

Install python libs by using 'pip':

{
  (qqbot)root@user:/home/user/# pip install -r requirment.txt
}

OK, we can use it by this command:

{
  (qqbot)root@user:/home/user/bot/maibot# python bot.py
}

# Get qsign to set up a sign server
In this README, qsign version is 1.1.9 

('qsign' & 'go-cqhttp' version must be matching!!! Otherwise you will return 'Code: 45')

Download qsign with this link:

{
 - plan A:

    https://github.com/fuqiuluo/unidbg-fetch-qsign/releases/tag/1.1.9

    Download 'unidbg-fetch-qsign.3.zip' and unpatch it with 'winrar' or other software.

 - plan B:

      root@user:/home/user/bot/qsign# git clone https://github.com/fuqiuluo/unidbg-fetch-qsign.git

    (or open link 'https://github.com/fuqiuluo/unidbg-fetch-qsign' in Chrome, 'Code' -> 'Download Zip')

      root@user:/home/user/bot/qsign# ./gradlew build
}


After this step, it become easy.

{
  root@user:/home/user/bot/qsign# vim ./txlib/8.9.63/config.json
}

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

{
  root@user:/home/user/bot/qsign# echo "bash bin/unidbg-fetch-qsign --basePath=txlib/8.9.63" > start.sh && chmod -R 755 start.sh
}

(or make a new 'txt' file and write 'start bin/unidbg-fetch-qsign.bat --basePath=txlib/8.9.63' then change filename to 'start.bat' on Windows, and you can execute it by double click it)

OKK, we can use it by this command:

{
  root@user:/home/user/bot/qsign# bash start.sh
}

(It's okay with graphic interface, try double click it.)

# Download go-cqhttp

{
https://github.com/1umine/go-cqhttp/actions/runs/5861714722
}

choose one fit your OS and unpatch it.

{
    root@user:/home/user/bot/gocq# chmod -R 755 gocq && ./gocq
}

choose 'ws-socket' (code: 3)

Edit your config.yml
{
    account: # 账号相关
      uin: 350XXXXYYY # QQ账号                      # Here need to fix with your QQ account
      password: 'password' # 密码为空时使用扫码登录    # Here need to fix with your QQ password
      ... 
      # 服务器可使用docker在本地搭建或者使用他人开放的服务
      sign-server: 'http://127.0.0.1:8080'          # Here need to fix by your qsign config
      # 签名服务器认证 Bearer Token
      # 使用开放的服务可能需要提供此 Token 进行认证
      sign-server-bearer: '-'
      # 如果签名服务器的版本在1.1.0及以下, 请将下面的参数改成true
      is-below-110: false
      # 签名服务器所需要的apikey, 如果签名服务器的版本在1.1.0及以下则此项无效
      # 本地部署的默认为114514
      key: '114514'
      ...
    message:
      # 上报数据类型
      # 可选: string,array
      post-format: array                            # Here need to fix by your bot's README
      ...
    servers:
      # 添加方式，同一连接方式可添加多个，具体配置说明请查看文档
      #- http: # http 通信
      #- ws:   # 正向 Websocket
      #- ws-reverse: # 反向 Websocket
      #- pprof: #性能分析服务器
      # 反向WS设置
      - ws-reverse:
          # 反向WS Universal 地址
          # 注意 设置了此项地址后下面两项将会被忽略
          universal: ws://127.0.0.1:10219/onebot/v11/ws    # Here need to fix by your bot's README
          # 反向WS API 地址
          api: ws://your_websocket_api.server
          # 反向WS Event 地址
          event: ws://your_websocket_event.server
          # 重连间隔 单位毫秒
          reconnect-interval: 3000
          middlewares:
            <<: *default # 引用默认中间件
}

OKKK, we can use it by this command:

{
  root@user:/home/user/bot/gocq# ./gocq
}

# Start your bot

First, start qsign

Second, start bot

Last, start go-cqhttp

# OKKKK!!!!!
