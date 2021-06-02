#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests
import bs4
import json
import time

#要抓取的目标页码地址
url = 'https://api-flash.zczc.cz/flashes'

#抓取页码内容，返回响应对象
response = requests.get(url)

#查看响应状态码
status_code = response.status_code

#使用BeautifulSoup解析代码,并锁定页码指定标签内容
data = response.content

#使用JSON解析获取的数据
flashes = json.loads(data.decode("utf-8"))

#收集文件链接、名称、作者
urls    = [item["url"] for item in flashes]
names   = [item["name"] for item in flashes]
authors = [item["author"] for item in flashes]

#print(len(urls))
#print(len(names))
#print(len(authors))

for i in range(len(urls)):
  if( i >= 509):
    time.sleep(10)
    print(i)
    url = urls[i]
    response = requests.get(url)
    if response.status_code == 200:
       names[i] = str(names[i]).replace("*","_")
       authors[i] = str(authors[i]).replace("*", "_")
       with open(names[i]+"_"+authors[i]+".swf", "wb") as file:
            for chunk in response:
                file.write(chunk)
# print(data)
# content = bs4.BeautifulSoup(response.content.decode("utf-8"), "lxml")

#print(status_code)
