# -*- coding=utf-8 -*-

import re
import requests

def get_hosts(url):
    res = requests.get(url).text
    #ip = re.search(r'IP Addresses.*(([01]{0,1}\d{0,1}\d|2[0-4]\d|25[0-5])\.){3}([01]{0,1}\d{0,1}\d|2[0-4]\d|25[0-5])',res).group()
    pattern = re.compile(r'(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)')
    print(pattern.search(res))

    #return ip

#with open('/etc/hosts','w') as f:
#    nu = ''
#    f.write(nu)

ua = "https://ipaddress.com/website/cdn.steampowered.com"
ub = "https://ipaddress.com/website/cdn.store.steampowered.com"
uc = "https://ipaddress.com/website/cdn.steamcommunity.com"
ud = "https://ipaddress.com/website/media.steampowered.com"


da = 'cdn.steampowered.com'           
db = 'cdn.store.steampowered.com'
dc = 'cdn.steamcommunity.com'
dd = 'media.steampowered.com'


ip_a = get_hosts(ua)
ip_b = get_hosts(ub)
ip_c = get_hosts(uc)
ip_d = get_hosts(ud)


host_a = '{}  {}'.format(ip_a,da)
host_b = '{}  {}'.format(ip_b,db)
host_c = '{}  {}'.format(ip_c,dc)
host_d = '{}  {}'.format(ip_d,dd)


#hosts = [host_a,host_b,host_c,host_d]
#print(hosts)
#for host in hosts:
#    with open('/etc/hosts','a') as f:
#        #print(host)
#        f.write(host+'\n')
