%Channel Capacity via Iteration algoritm
fprintf("Your Input should be a matrix, e.g., [0.5 0.5;0.5 0.5]\n")
q=input("Please Input P: ");
error_tolerance=1e-6;
[R,S]=size(q);
p=ones(1,R)/R;
z=ones(1,R);
C_temp=-inf;
C=0.0;
k=0;
F=zeros(R,S);
while abs(C_temp-C)>=error_tolerance
    k=k+1;
    C_temp=C;
    for j=1:S
        x=0.0;
        for i=1:R
            x=x+p(i)*(q(i,j));
        end
        if x>0
            for i=1:R
                F(i,j)=p(i)*q(i,j)/x;
            end
        else
            for i=1:R
                F(i,j)=0;
            end
        end            
    end
    
    y=0.0;
    for i=1:R
        z(i)=0.0;
        for j=1:S
            if F(i,j)>0
                z(i)=z(i)+(q(i,j)*(log(F(i,j)) / log(2.0)));
            end
        end
        z(i)=pow2(z(i));
        y=y+z(i);
    end
    for i=1:R
        p(i)=z(i)/y;
    end
    C=(log(y)/log(2));
end
fprintf('\n***************************\n')
fprintf('Total Iteration times: %d\n', k);
fprintf('Channel Capacity is: %f\n',C)
fprintf('The optimal Distribuation:\n')
disp(mat2str(p))
