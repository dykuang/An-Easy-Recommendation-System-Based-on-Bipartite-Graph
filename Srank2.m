function [Sch_rank] = Srank2()

M = load('LG_C1.csv','-ascii');%load the source file

%size of the matrix
R = length(M(:,1));
C = length(M(1,:));

Investment=ones(R,1); %decision of initial investment

Sch_rank=zeros(R,2);
D_sch=zeros(R,1);
D_lev=zeros(C,1);

Rate_lev=zeros(1,C); %assing rate level
Rate_lev(1,1)=-2;
Rate_lev(1,2)=0;
Rate_lev(1,3)=1;
Rate_lev(1,4)=2;
Rate_lev(1,5)=4;

D_sch=sum(M,2);
D_lev=sum(M);

W=zeros(R,R);
W1=zeros(R,C);
W2=zeros(R,C);

weight=Rate_lev./D_lev;

%A difference if approaching from column
for i=1:R
    W1(i,:)= (M(i,:))/D_sch(i);
    W2(i,:)= W1(i,:).*weight;
end;  

% for i=1:R
%     W1(i,:)= (M(i,:)).*weight;
%     W2(i,:)= M(i,:)/D_sch(i);
% end;    

 W=W1*(W2');

[Sch_rank(:,1),Sch_rank(:,2)]= sort(W*Investment,'descend');
  


end

