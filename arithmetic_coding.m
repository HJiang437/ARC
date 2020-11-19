%Arithematic Coding
%by Hao Jiang
fprintf('Here is An Example for Source Encoding(Arithmetic Coding)\n by Hao Jiang\n')
fprintf('****************************************\n')
fprintf('To successfully Generate your Information Source, your input should be a matrix with demension 2*M\n Here is an example:\n')
fprintf(mat2str([1,2,3,4;0.5 0.25 0.125 0.125]))
fprintf('\n****************************************\n')
U=input('\nPlease input U:');
fprintf('Your source is:\n')
fprintf(mat2str(U))
fprintf('\n****************************************\n')
fprintf('An example for sequence is:\n')
fprintf(mat2str([1,2,3,2,1]))
b=input('\nPlease input your sequence:');
fprintf('Your sequence is:\n')
fprintf(mat2str(b))
fprintf('\n****************************************\n')
fprintf('Results are:\n')

%a=source_generation();
code=encoding(U,b);
code_1=DecToBin(code,10);
fprintf('Binary Sequence:\n')
disp(mat2str(code_1))
num=BinToDec(code_1,10);
fprintf('After Bin to Dec:\n')
disp(num)
fprintf('Decoding results:')
array=decoding(code,length(b),U);
disp(mat2str(array))
function U=source_generation(matrix)
    if nargin==0
        U=[1,2,3,4;0.5,0.25,0.125,0.125];
    else
        U=matrix;
    end
end
function code=encoding(U,array)
    high=1.0;
    low=0.0;
    for i=1:length(array)
        len=high-low;
        L=0;
        for ii=1:size(U,2)
            if array(i)==U(1,ii)
                low=low+len*L;
                high=low+len*U(2,ii);
                break
            else
                L=L+U(2,ii);
            end
                
        end
    end
    fprintf('Left Bound: %d\n',low)
    fprintf('Right Bound: %d\n',high)
    fprintf('Ecoding: %d\n',(high+low)/2) 
    code=(high+low)/2;
end
function bin_code=DecToBin(dec,N)
    bin_code=zeros(1,N);
    for i=1:N
        dec=dec*2;
        bin_code(i)=floor(dec);
        dec=dec-bin_code(i);
    end
end
function num=BinToDec(bin,N)
    num=0;
    for i=1:N
        num=num+bin(i)*power(2,-i);
    end
end
function array=decoding(num,array_len,U)
    High=1.0;
    Low=0.0;
    low=0.0;
    array=[];
    for i=1:array_len
        k=High-Low;
        for ii=1:size(U,2)
            high=low+k*U(2,ii);
            if (num>=low) && (num<high)
                array(end+1)=U(1,ii);
                Low=low;
                High=high;
                break
            else
                low=low+k*U(2,ii);  
            end 
        end
    end
end
