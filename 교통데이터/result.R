install.packages('dplyr') 
library(dplyr) 

data_link <- read.csv(file="C:/jtp/link_info.CSV", header=T)
data_link
a <- read.csv(file="C:/jtp/node_info_node_name.CSV", header=T) #열 분리 
a
b <- read.csv(file="C:/jtp/node_info_1.CSV", header=T) 
b
node_info1 <- cbind(b,a) # node_name열 결합
node_info1

st_full = full_join(node_info1,data_link,by='f_node')
head(st_full)
write.csv(st_full,"C:/jtp/st_full.csv") #결측값 존재
str <- st_full[1:8671,] #결측값 제거
write.csv(str,"C:/jtp/str.csv")


#출발지 위치를 기준으로 잡고 inner join >> 모든 데이터 출력됨
#st = inner_join(node_info1,data_link,by='f_node')
#head(st)
#st
#write.csv(st,"C:/jtp/st.csv") #start 데이터 csv로 저장

c <- read.csv(file="C:/jtp/node_info_2.CSV", header=T) #c열을 t_node로 변환
c
node_info2 <- cbind(c,a) #node_name열 결합
head(node_info2)
#start csv을 기준으로 t_node 열에 left join
arr = left_join(str,node_info2,by='t_node')
head(arr)
write.csv(arr,"C:/jtp/arr.csv") #arrive 데이터 csv로 저장

write.csv(arr,"C:/jtp/arr1.csv") #arrive 데이터 csv로 저장
