
%no of categories 
class=20;

% no of vocabularies
vb=61188;

%size of our training data
trainsize=11269;

%matrix to read the train.data file
traininput=dlmread('train.data');

%matrix to read the train.label file 
trainl=dlmread('train.label');

%read vocabulary

vocabs=textread('vocabulary.txt','%s');

%matrix vc is the vocabulary frequency for each word belonging to each label
vc=zeros(class,vb);
[n,~]=size(traininput);
% sums up total no of frequency for each word vector and assigns to their
% label
for(i=1:n)
  vc(trainl(traininput(i,1)),traininput(i,2))=vc(trainl(traininput(i,1)),traininput(i,2))+traininput(i,3);
end



%set beta-value
beta=1/vb;

%sum of total words for label
sumvc=sum(vc,2)+beta*vb;


%matrix vp is probability of all words given the label P(Xi|Yk)  MAP Estimation

vp=zeros(class,vb);
for i=1:class
  vp(i,:)=(vc(i,:)+beta)./sumvc(i);
end


%keep an array of stopping words to track it
fw={'as','an','so','for','on','are''the','if','to','and','of','from','in','it','is','can'};
fwIndex=[388,139,99,81,48,27,29,473,33,23,12,16,30,42,60,72];

sumword=sum(vc);


for i=1:16
    c=fwIndex(i);
    
    %give the stopping words score=0
    sumword(c)=0;
    
end


[sdValue,sdIndex]=sort(sumword,'descend');

%above samples are just to show the way to give score 0 to stopping words
%As it is not possible to list all the words i found that there are about
%300 stopping words in the vocabulary.
%So,print the highest measure words skip first 300 words. These words now
%make sense too.
for i=300:400
    eval('vocabs(sdIndex(i))');
end



 