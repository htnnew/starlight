data1<-read.csv(file.choose(),header = TRUE)
data2<-read.csv(file.choose(),header = TRUE)
k<-1
data1<-na.omit(data1)
row(data1)
for(i in 1:3554)#连接操作
{
  for(m in 1:3554)
    {
    if(data1[m,1]==data1[i,1])
    {data2[k,]$ID<-data1[i,]$ID;
    data2[k,]$Key<-as.character(data1[i,]$Key);
    data2[k,]$Key1<-as.character(data1[m,]$Key);
    k=k+1}
  }
}
data2<-na.omit(data2)
for(t in 1:28396)#删除重复的key
{
  if(data2[t,2]==data2[t,3])
    data2<-data2[-t,]
}
write.xlsx(data2, file = "spiltwrite.xlsx", row.names = TRUE, sheetName = "Sheet1")

