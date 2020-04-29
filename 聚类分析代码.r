#####R  Kmeans聚类#########
data2 <-read.csv(file.choose(), header = TRUE, encoding = 'utf-8')#目标文件
stopwords <- unlist(read.table(file.choose(),quote="",header = F))#停用词表
View(stopwords)#查看停用词表
removewords <- function(target_words,stop_words)#剔除停用词函数
{   target_words = target_words[target_words %in% stop_words == FALSE]
return(target_words)}
removewords(data2,stopwords)#读取英文停用词表
data2.corpus <-Corpus(VectorSource(data2))#向量矩阵
inspect(data2.corpus)#查看语料库
writeCorpus(data2.corpus, path = "C:/Users/dell/Desktop/datamining/",filenames = paste(seq_along(data2.corpus), ".txt", sep = ""))
hlzj.dtm<- DocumentTermMatrix(data2.corpus,control=list(wordLengths=c(1,Inf),weighting = weightTfIdf))

#k-means聚类
k <- 5
kmeansRes <- kmeans(hlzj.matrix,k) #k是聚类数
head(kmeansRes$cluster,10)
kmeansRes$size #每个类别下有多少条数据
hlzj.kmeansRes <- list(content=hlzj,type=kmeansRes$cluster)
write.csv(hlzj.kmeansRes,"hlzj_kmeansRes.csv")
fix(hlzj.kmeansRes)
