function [Sch_rank,W] = Srank0()

M = load('SG1.csv','-ascii');

%size of the matrix
R = length(M(:,1));
C = length(M(1,:));

Investment=ones(R,1); %decision of initial investment

Sch_rank=zeros(R,2);
D_sch=zeros(R,1);
D_lev=zeros(C,1);

Rate_lev=zeros(1,C); %assing rate level
Rate_lev(1,1)=-1;
Rate_lev(1,2)=1;

D_sch=sum(M,2);
D_lev=sum(M);

W=zeros(R,R);


%A difference if approaching from column

for i=1:R
    for j=1:R
       W(i,j)=(M(i,:).*Rate_lev)*(M(j,:)./D_lev)'/(D_sch(j)*D_sch(i));
    end;
end;



[Sch_rank(:,1),Sch_rank(:,2)]= sort(W*Investment,'descend');
  


end

