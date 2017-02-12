function [Sch_rank,W] = Srankt()

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
W1=zeros(R,C);

weight=sqrt(Rate_lev./D_lev);

%A difference if approaching from column
for i=1:R
    W1(i,:)= (M(i,:).*weight)/D_sch(i);
end;  

% for j=1:C
%     W1(:,j)= W1(:,j)*sqrt(Rate_lev(j)/D_lev(j));
% end;

% for i=1:R
%     for j=1:R
%        W(i,j)=(M(i,:).*Rate_lev)*(M(j,:)./D_lev)'/(D_sch(j)*D_sch(i));
%     end;
% end;

 W=W1*(W1');

[Sch_rank(:,1),Sch_rank(:,2)]= sort(W*Investment,'descend');
  


end

