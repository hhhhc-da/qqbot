# aarch64(ARM64)�汾�ο�
mkdir bot && cd bot
wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-aarch64.sh

bash Anaconda3-2023.07-2-Linux-aarch64.sh
conda create -n qqbot python=3.9 && conda activate qqbot
pip install -r requirement.txt

mkdir maibot && cd maibot
git clone https://github.com/Diving-Fish/mai-bot.git

cd ..
wget https://github.com/fuqiuluo/unidbg-fetch-qsign/releases/download/1.1.9/unidbg-fetch-qsign.3.zip
unzip unidbg-fetch-qsign.3.zip && unzip unidbg-fetch-qsign-1.1.9.zip && mv unidbg-fetch-qsign-1.1.9 qsign
rm unidbg-fetch-qsign.3.zip unidbg-fetch-qsign-1.1.9.zip

cd qsign
echo "{\
    "server": {\
        "host": "127.0.0.1",\
        "port": 8080\
    },\
    "key": "114514",\
    "auto_register": true,\
    "protocol": {\
        "package_name": "com.tencent.mobileqq",\
        "qua": "V1_AND_SQ_8.9.63_4194_YYB_D",\
        "version": "8.9.63",\
        "code": "4194"\
    },\
    "unidbg": {\
        "dynarmic": false,\
        "unicorn": true,\
        "debug": false\
    }\
}" > txlib/8.9.63/config.json

echo "bash bin/unidbg-fetch-qsign --basePath=txlib/8.9.63" > start.sh && chmod -R 755 start.sh

cd ..
wget https://github.com/1umine/go-cqhttp/suites/15092026034/artifacts/862161359

unzip linux_arm64.zip && mv linux_arm64 gocq && cd gocq
mv go-cqhttp_linux_arm64 gocq && chmod -R 755 gocq && ./gocq

# ������Լ�Ū��
vim config.yml