#!/bin/bash

OKRED=$(tput setaf 1)
OKBLUE=$(tput setaf 4)
RESET=$(tput sgr0) 

echo "${OKRED} ######################################################### ${RESET}"
echo "${OKRED} #                 TOOLS FOR BUG BOUNTY                  # ${RESET}"
echo "${OKRED} ######################################################### ${RESET}"
echo "${OKRED} Tools created by the best people in the InfoSec Community ${RESET}"
echo "${OKRED}                   Thanks to everyone!                     ${RESET}"
echo ""
sleep 2s


echo "${OKRED} Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y apt-transport-https
sudo apt-get install -y libcurl4-openssl-dev 
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y xargs
sudo apt-get install -y npm
sudo apt-get install -y nmap phantomjs 
sudo apt-get install -y gem
sudo apt-get install -y perl 
sudo apt-get install -y golang
sudo apt-get install -y golang-go
sudo apt-get install -y parallel
echo ""
sleep 1s

#installing shell functions/aliases
echo "${OKRED} #### Installing bash_profile aliases #### ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile >> ~/.bash_profile
echo "${OKRED} If it doesn't work do it manually ${RESET}"
echo "done"
echo ""
sleep 1s 

echo "${OKRED} #### Installing Golang #### ${RESET}"
cd ~
wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xvzf go1.14.4.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
rm ~/go1.14.4.linux-amd64.tar.gz 
echo""


#Installing tools

echo "${OKRED} #################### ${RESET}"
echo "${OKRED} # Installing tools # ${RESET}"
echo "${OKRED} #################### ${RESET}"


echo "${OKRED} #### Basic Tools #### ${RESET}"

#install altdns
echo "${OKBLUE} installing altdns ${RESET}"
sudo pip3 install py-altdns
echo "${OKBLUE} done${RESET}"
echo ""

#install nmap
echo "${OKBLUE} installing nmap${RESET}"
sudo apt-get install -y nmap
echo "${OKBLUE} done${RESET}"
echo ""


#install Seclists
echo "${OKBLUE} downloading Seclist${RESET}"
git clone https://github.com/danielmiessler/SecLists.git ~/tools/SecLists
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} downloading virtual host discovery${RESET}"
git clone https://github.com/jobertabma/virtual-host-discovery.git ~/tools/vhd
echo "${OKBLUE} done${RESET}"
echo ""

#install PayloadAllTheThings
echo "${OKBLUE} PayloadAllTheThings${RESET}"
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git ~/tools/PayloadsAllTheThings
echo "${OKBLUE} done${RESET}"
echo ""

#install sqlmap
echo "${OKBLUE} installing sqlmap${RESET}"
sudo apt-get install sqlmap
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} downloading knockpy${RESET}"
git clone https://github.com/guelfoweb/knock.git ~/tools/knockpy
cd ~/tools/knockpy
sudo python setup.py install
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing k2${RESET}"
go get -v github.com/harleo/knockknock
sudo cp $GOPATH/bin/knockknock /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} downloading asnlookup${RESET}"
git clone https://github.com/yassineaboukir/asnlookup.git ~/tools/asnlookup
cd ~/tools/asnlookup
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing metabigor${RESET}"
go get -u github.com/j3ssie/metabigor
sudo cp $GOPATH/bin/metabigor /usr/bin/
echo "${OKBLUE} done${RESET}"

sleep 1
echo ""

echo "${OKRED}#### Installing fuzzing tools ####${RESET}"
#install gobuster
echo "${OKBLUE} installing gobuster${RESET}"
sudo apt-get install gobuster
echo "${OKBLUE} done${RESET}"
echo ""

#install ffuf
echo "${OKBLUE} installing ffuf${RESET}"
go get github.com/ffuf/ffuf
sudo cp $GOPATH/bin/ffuf /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing dirsearch${RESET}"
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s

echo "${OKRED}#### Installing Domain Enum Tools ####${RESET}"

#install aquatone
echo "${OKBLUE} Installing Aquatone ${RESET}"
go get github.com/michenriksen/aquatone 
sudo cp $GOPATH/bin/aquatone /usr/bin/
echo "${OKBLUE} done ${RESET}"
echo ""

#install subDomainizer
echo "${OKBLUE} subdomainizer ${RESET}"
git clone https://github.com/nsonaniya2010/SubDomainizer.git ~/tools/SubDomainizer
cd ~/tools/SubDomainizer && chmod +x SubDomainizer.py
sudo pip3 install -r requirements.txt 
echo "${OKBLUE} done ${RESET}"
echo ""

#install domain_analyzer
echo "${OKBLUE} domain_analyzer ${RESET}"
git clone https://github.com/eldraco/domain_analyzer.git ~/tools/domain_analyzer
echo "${OKBLUE} done ${RESET}"
echo ""

#install massdns
echo "${OKBLUE} Installing massdns ${RESET}"
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns
cd ~/tools/massdns
make
echo "${OKBLUE} done ${RESET}"
echo ""

#install sub.sh
echo "${OKBLUE} sub.sh ${RESET}"
git clone https://github.com/cihanmehmet/sub.sh.git ~/tools/subsh
cd ~/tools/subsh && chmod +x sub.sh
echo "${OKBLUE} done ${RESET}"
echo ""

#install subjack
echo "${OKBLUE} installing subjack ${RESET}"
go get -u github.com/haccer/subjack
sudo cp $GOPATH/bin/subjack /usr/bin/
echo "${OKBLUE} done ${RESET}"
echo ""

echo "${OKBLUE} installing Sublister ${RESET}"
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done ${RESET}"
echo ""

echo "${OKBLUE} installing Subover ${RESET}"
go get github.com/Ice3man543/SubOver
sudo cp $GOPATH/bin/SubOver /usr/bin/subover
echo "${OKBLUE} done ${RESET}"
echo ""

echo "${OKBLUE} installing spyse ${RESET}"
sudo pip3 install spyse.py
echo "${OKBLUE} done ${RESET}"
echo ""
sleep 1s


echo "${OKRED} #### Installing CORS Tools #### ${RESET}"

echo "${OKBLUE} installing corsy ${RESET}"
git clone https://github.com/s0md3v/Corsy.git ~/tools/corsy
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done ${RESET}"
echo ""

echo "${OKBLUE} installing cors-scanner ${RESET}"
git clone https://github.com/chenjj/CORScanner.git ~/tools/corscanner
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done ${RESET}"
echo ""

echo "${OKBLUE} installing another cors scanner${RESET}"
go get -u github.com/Tanmay-N/CORS-Scanner
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s



echo "${OKRED} #### Installing XSS Tools#### ${RESET}"

echo "${OKBLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/tools/dalfox
cd ~/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing XSStrike${RESET}"
git clone https://github.com/s0md3v/XSStrike.git ~/tools/XSStrike 
cd ~/tools/XSStrike
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

#Xspear for XSS
echo "${OKBLUE} installing XSpear${RESET}"
sudo gem install XSpear
sudo gem install colorize
sudo gem install selenium-webdriver
sudo gem install terminal-table
sudo gem install progress_bar
echo "${OKBLUE} done${RESET}"
echo ""

#traxss
echo "${OKBLUE} downloading traxss${RESET}"
git clone https://github.com/M4cs/traxss.git ~/tools/traxss
cd ~/tools/traxss
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s








echo "${OKRED} #### Installing Cloud workflow Tools #### ${RESET}"

echo "${OKBLUE} Instaliing awscli${RESET}"
sudo pip3 install awscli --upgrade --user
echo "${OKBLUE} Don't forget to set up AWS credentials!${RESET}"
echo "${OKBLUE} done${RESET}"
echo ""


#install s3-buckets-finder
echo "${OKBLUE} s3-buckets-finder${RESET}"
git clone https://github.com/gwen001/s3-buckets-finder.git ~/tools/AWS/s3-buckets-finder
echo "${OKBLUE} done${RESET}"
echo ""


#install lazys3
echo "${OKBLUE} lazys3${RESET}"
git clone https://github.com/nahamsec/lazys3.git ~/tools/AWS/lazys3
echo "${OKBLUE} done${RESET}"
echo ""

#install DumpsterDiver
echo "${OKBLUE} DumpsterDiver${RESET}"
git clone https://github.com/securing/DumpsterDiver.git ~/tools/AWS/DumpsterDiver
cd ~/tools/AWS/DumpsterDiver && chmod +x DumpsterDiver.py
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

#install S3Scanner
echo "${OKBLUE} installing S3Scanner${RESET}"
git clone https://github.com/sa7mon/S3Scanner.git ~/tools/AWS/S3Scanner 
cd ~/tools/AWS/S3Scanner
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} installing Cloudflair${RESET}"
git clone https://github.com/christophetd/CloudFlair.git ~/tools/AWS/CloudFlair
cd ~/tools/AWS/CloudFlair && chmod +x cloudflair.py
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} installing Cloudunflare${RESET}"
git clone https://github.com/greycatz/CloudUnflare.git ~/tools/AWS/CloudUnflare
echo "${OKBLUE} done${RESET}"
echo ""


#install GCPBucketBrute
echo "${OKBLUE} installing GCPBucketBrute${RESET}"
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git ~/tools/GCPBucketBrute
cd ~/tools/GCPBucketBrute
sudo python3 -m pip install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s


echo "${OKRED} #### Installing CMS Tools #### ${RESET}" 
#install CMSmap
echo "${OKBLUE} installing CMSmap${RESET}"
git clone https://github.com/Dionach/CMSmap.git ~/tools/CMS/CMSmap
cd ~/tools/CMS/CMSmap
sudo pip3 install .
echo "${OKBLUE} done${RESET}"
echo ""

#install CMSeek
echo "${OKBLUE} installing CMSeek${RESET}"
git clone https://github.com/Tuhinshubhra/CMSeeK.git ~/tools/CMS/CMSeek
cd ~/tools/CMS/CMSeek
sudo python3 -m pip install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

#install Joomscan
echo "${OKBLUE} installing Joomscan${RESET}"
git clone https://github.com/rezasp/joomscan.git ~/tools/CMS/Joomscan
echo "${OKBLUE} done${RESET}"
echo ""

#install wpscan
echo "${OKBLUE} installing wpscan${RESET}"
sudo gem install wpscan
echo "${OKBLUE} done${RESET}"
echo ""

#install droopescan
echo "${OKBLUE} installing droopescan${RESET}"
sudo pip3 install droopescan
echo "${OKBLUE} done${RESET}"
echo ""

#install drupwn
echo "${OKBLUE} installing drupwn${RESET}"
git clone https://github.com/immunIT/drupwn.git ~/tools/CMS/drupwn
cd ~/tools/CMS/drupwn
sudo python3 setup.py install
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} Adobe scanner${RESET}"
git clone https://github.com/0ang3el/aem-hacker.git ~/tools/CMS/aem-hacker
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s

echo "${OKRED}#### Downloading Git tools ####${RESET}"

echo "${OKBLUE} git-scanner${RESET}"
git clone https://github.com/HightechSec/git-scanner ~/tools/GIT/git-scanner
cd ~/tools/GIT/git-scanner && chmod +x gitscanner.sh
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} gitgraber${RESET}"
git clone https://github.com/hisxo/gitGraber.git ~/tools/GIT/gitGraber
cd ~/tools/GIT/gitGraber && chmod +x gitGraber.py
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE}  GitHound${RESET}"
git clone https://github.com/tillson/git-hound.git ~/tools/GIT/git-hound
cd ~/tools/GIT/git-hound
sudo go build main.go && mv main githound
echo "${OKBLUE} Create a ./config.yml or ~/.githound/config.yml${RESET}"
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} gitsearch${RESET}"
git clone https://github.com/gwen001/github-search.git ~/tools/GIT/github-search
cd ~/tools/GIT/github-search 
sudo pip3 install -r  requirements3.txt
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s






echo "${OKRED}#### Downloading Frameworks ####${RESET}"
#install Sn1per
echo "${OKBLUE} Sn1per${RESET}"
git clone https://github.com/1N3/Sn1per.git ~/tools/Frameworks/Sn1per
echo "${OKBLUE} done${RESET}"
echo ""

#install Osmedeus
echo "${OKBLUE} Osmedeus${RESET}"
git clone https://github.com/j3ssie/Osmedeus.git ~/tools/Frameworks/osmedeus
echo "${OKBLUE} done${RESET}"
echo ""

#install Cobra
echo "${OKBLUE} Cobra${RESET}"
git clone https://github.com/WhaleShark-Team/cobra.git ~/tools/Frameworks/Cobra
echo "${OKBLUE} done${RESET}"
echo ""

#install TIDoS-Framework
echo "${OKBLUE} TIDoS-Framework${RESET}"
git clone https://github.com/0xinfection/tidos-framework.git ~/tools/Frameworks/TIDoS-Framework
cd ~/tools/Frameworks/TIDoS-Framework
chmod +x install
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} WAScan${RESET}"
git clone https://github.com/m4ll0k/WAScan.git ~/tools/Frameworks/WAScan
echo "${OKBLUE} done${RESET}"
echo ""

#install Blackwidow#
echo "${OKBLUE} blackwidow${RESET}"
git clone https://github.com/1N3/BlackWidow.git ~/tools/Frameworks/BlackWidow
cd ~/tools/Frameworks/BlackWidow
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing Sudomy${RESET}"
git clone --recursive https://github.com/screetsec/Sudomy.git ~/tools/Sudomy
cd ~/tools/Sudomy
sudo pip3 install -r requirements.txt
sudo npm i -g wappalyzer
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing findomain${RESET}"
cd ~/tools/
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
sudo chmod +x findomain-linux
sudo cp findomain-linux /usr/bin/findomain
echo "${OKBLUE} Add your keys in the config file"
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s

echo "${OKRED}#### Other Tools ####${RESET}"

echo "${OKBLUE} installing SSRFMap ${RESET}"
git clone https://github.com/swisskyrepo/SSRFmap ~/tools/SSRFMap
cd ~/tools/SSRFMap/
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing XSRFProbe${RESET}"
sudo pip3 install xsrfprobe
echo "${OKBLUE} done${RESET}"
echo ""


#install JSParser
echo "${OKBLUE} installing JSParser${RESET}"
git clone https://github.com/nahamsec/JSParser.git ~/tools/JS/JSParser
cd ~/tools/JS/JSParser
sudo python3 setup.py install
echo "${OKBLUE} done${RESET}"
echo ""

#install subjs
echo "${OKBLUE} installing subjs${RESET}"
go get -u github.com/lc/subjs
sudo cp $GOPATH/bin/subjs /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing broken-link-checker${RESET}"
sudo npm install broken-link-checker -g
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing pwncat${RESET}"
sudo pip3 install pwncat
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing Photon${RESET}"
git clone https://github.com/s0md3v/Photon.git ~/tools/Photon
cd ~/tools/Photon
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing hakrawler${RESET}"
git clone https://github.com/hakluke/hakrawler.git ~/tools/hakrawler
cd ~/tools/hakrawler
go build main.go && mv main hakrawler
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing waff00f${RESET}"
git clone https://github.com/EnableSecurity/wafw00f.git ~/tools/waff00f
cd ~/tools/wafw00f
sudo python3 setup.py install
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} jexboss${RESET}"
git clone https://github.com/joaomatosf/jexboss.git ~/tools/jexboss
cd ~/tools/jexboss
sudo pip3 install -r requires.txt
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} goohak${RESET}"
git clone https://github.com/1N3/Goohak.git ~/tools/Goohak
cd ~/tools/Goohak && chmod +x goohak
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing webtech${RESET}"
sudo pip3 install webtech
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing gau${RESET}"
go get -u github.com/lc/gau
sudo cp ~/go/bin/gau /usr/bin/gau
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing wig${RESET}"
git clone https://github.com/jekyc/wig.git ~/tools/wig
cd ~/tools/wig
sudo python3 setup.py install
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} LinkFinder${RESET}"
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} SecretFinder${RESET}"
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
sudo pip3 install -r requirements.txt
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s


echo "${OKRED}#### ProjectDiscovery Pinned Tools ####${RESET}"

echo "${OKBLUE} installing naabu${RESET}"
go get -u github.com/projectdiscovery/naabu/cmd/naabu
sudo cp $GOPATH/bin/naabu /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} installing dnsprobe${RESET}"
go get -u github.com/projectdiscovery/dnsprobe
sudo cp $GOPATH/bin/dnsprobe /usr/bin/
echo  "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing nuclei${RESET}"
go get -u github.com/projectdiscovery/nuclei/cmd/nuclei
sudo cp $GOPATH/bin/nuclei /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing subfinder${RESET}"
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
sudo cp $GOPATH/bin/subfinder /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing httpx${RESET}"
go get -u github.com/projectdiscovery/httpx/cmd/httpx
sudo cp $GOPATH/bin/httpx /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing shuffledns${RESET}"
go get -u github.com/projectdiscovery/shuffledns/cmd/shuffledns
sudo cp $GOPATH/bin/shuffledns /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing chaos-client${RESET}"
go get -u github.com/projectdiscovery/chaos-client/cmd/chaos
sudo cp $GOPATH/bin/chaos /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s





echo "${OKRED} #### Installing tomnomnom tools #### ${RESET}"
echo "${OKRED}    So many tools, thank you man      ${RESET}"
echo "${OKRED}  check out his other tools as well  ${RESET}"

echo "${OKBLUE} installing meg${RESET}"
go get -u github.com/tomnomnom/meg
sudo cp $GOPATH/bin/meg /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing assetfinder${RESET}"
go get -u github.com/tomnomnom/assetfinder
sudo cp $GOPATH/bin/assetfinder /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing waybackurls${RESET}"
go get -u github.com/tomnomnom/waybackurls
sudo cp $GOPATH/bin/waybackurls /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing gf${RESET}"
go get -u github.com/tomnomnom/gf
sudo cp $GOPATH/bin/gf /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing httprobe${RESET}"
go get -u github.com/tomnomnom/httprobe
sudo cp $GOPATH/bin/httprobe /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing concurl${RESET}"
go get -u github.com/tomnomnom/hacks/concurl
sudo cp $GOPATH/bin/concurl /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing unfurl${RESET}"
go get -u github.com/tomnomnom/unfurl
sudo cp $GOPATH/bin/unfurl /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s


echo "${OKRED} #### Other other Tools #### ${RESET}"

echo "${OKBLUE} installing arjun${RESET}"
git clone https://github.com/s0md3v/Arjun.git ~/tools/Arjun
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing cf-check${RESET}"
go get -u github.com/dwisiswant0/cf-check
sudo cp ~/go/bin/cf-check /usr/bin/cfcheck
echo "${OKBLUE} done${RESET}"
echo ""


echo "${OKBLUE} installing Urlprobe${RESET}"
go get -u github.com/1ndianl33t/urlprobe
sudo cp ~/go/bin/urlprobe /usr/bin/
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing amass${RESET}"
sudo apt-get install amass
echo "${OKBLUE} done${RESET}"
echo ""

echo "${OKBLUE} installing impacket${RESET}"
git clone https://github.com/SecureAuthCorp/impacket.git ~/tools/impacket
cd ~/tools/impacket
sudo pip3 install -r requirements.txt
sudo pip3 install .
echo "${OKBLUE} done${RESET}"
echo ""
sleep 1s

echo "${OKRED} use the command 'source ~/.bash_profile' for the shell functions to work ${RESET}"
echo ""
echo "${OKBLUE}  ALL THE TOOLS ARE BROUGHT TO YOU BY THE BEST OF THE INFOSEC COMMUNITY ${RESET}"
