from bs4 import BeautifulSoup
import pandas as pd

path = 'C:/Users/Xin/Desktop/pach/savedrecs.html'
htmlfile = open(path, 'r', encoding='utf-8')

htmlhandle = htmlfile.read()
soup = BeautifulSoup(htmlhandle, 'lxml')

txtfile = open('test.txt', 'w', encoding='utf-8')

rt = soup.find_all('td')
Title = ""
Journal = ""
Author = ""
Abstract = ""
Date = ""
flag = 0
# title
for n in range(0, rt.__len__()):
    if flag == 0:
        if rt[n].get_text() == 'TI ':
            Title = rt[n + 1].get_text().replace("\n  ", "")
            continue
        if rt[n].get_text() == 'PD ':
            Date = rt[n + 1].get_text().replace("\n  ", "")
            continue
        if rt[n].get_text() == 'SO ':
            Journal = rt[n + 1].get_text()
            continue
        if rt[n].get_text() == 'AU ':
            Author = rt[n + 1].get_text().replace("\n  ", "")
            continue
        if rt[n].get_text() == 'AB ':
            Abstract = rt[n + 1].get_text().replace("\n  ", "")
            flag = 1
            continue

    if flag == 1:
        t_info = "标题" + Title + "标题" + "\n" + "作者" + Author + "作者" + "\n" + "杂志" + Journal + "杂志" + "\n" + "日期" + Date + "日期" + "\n" + "摘要" + Abstract + "摘要" + "\n"
        txtfile.write(t_info)
        flag = 0
txtfile.close()
