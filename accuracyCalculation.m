function [ accuracy ] = accuracyCalculation( beta )
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


%matrix vc is the vocabulary frequency for each word belonging to each label
vc=zeros(class,vb);
[n,~]=size(traininput);
% sums up total no of frequency for each word vector and assigns to their
% label
for(i=1:n)
  vc(trainl(traininput(i,1)),traininput(i,2))=vc(trainl(traininput(i,1)),traininput(i,2))+traininput(i,3);
end

%sum of total words for label
sumvc=sum(vc,2)+beta*vb;


%matrix vp is probability of all words given the label P(Xi|Yk)  MAP Estimation

vp=zeros(class,vb);
for i=1:class
  vp(i,:)=(vc(i,:)+beta)./sumvc(i);
end

%vector ycount is total documents counts for all labels
ycount=zeros(class,1);
for i=1:trainsize
  ycount(trainl(i))=ycount(trainl(i))+1;
end

%vector yp is probability of all priors - MLE Estimation
yp=ycount./trainsize;


%total number of test document
testsize=7505;

%read the test.data file in matrix form
testinput=dlmread('test.data');

%read the test.label file in matrix form
testl=dlmread('test.label');

%store the rows and colums information
[testn,~]=size(testinput);

%matrix to store classes probability corresponding to each
%labels
probdisTest=zeros(class,testsize);

%matrix to store word count  for each word belonging to each label
wc=zeros(testsize,vb);

        for (j=1:testn)
    wc(testinput(j,1),testinput(j,2))=wc(testinput(j,1),testinput(j,2))+ testinput(j,3);
        end
   

 %calculation of probability for all classes for each label 
        
for i=1:testsize
  
    for k=(1:class)
        
            likelihood=wc(i,:) .* log2(vp(k,:));
       
         probdisTest(k,i)=sum(likelihood,2) +log2(yp(k));
    end
end

%extract the class with maximum probability
[~,maxValueLabel]=max(probdisTest);

%confusion matrix
cm=zeros(class,class);

%check the correct documents given all the documents in test.data
correct=0;

for i=1:testn 
    if(testl(testinput(i,1))==maxValueLabel(testinput(i,1)))
        correct=correct+1;
    else
        %build confusion matrix 
        cm(maxValueLabel(testinput(i,1)),testl(testinput(i,1)))=cm(maxValueLabel(testinput(i,1)),testl(testinput(i,1)))+1;
    end
end

%calculate the accuracy
accuracy=correct/testn;
eval('accuracy');




end

