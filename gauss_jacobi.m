clc;
clear;
%teste organização com variveis apenas como letras
a=input('Entre com a matriz de coeficientes>>\n');
b=input('Entre com a matriz de constantes>>\n');
A=size(a);
B=size(b);
%caso a matriz não seja quadrada
while(A(1,1)~=A(1,2) || A(1,1)~=B(1,2))
    disp('Numero de colunas diferente do numero de linhas\n digite uma matriz quadrada\n')
    a=input('Entre com a matriz a>>\n');
    b=input('Entre com a matriz b>>\n');
    A=size(a);
    B=size(b);
    clc;
end

%fazendo uma matriz expandida 
for i=1:A(1,1)
    a(i,A(1,2)+1)=b(i);
end

%calculo da convergencia da matriz junto com teste de diagonal
w=zeros(B);
l=zeros(B);
for f=1:A(1,1)
    for i=1:A(1,1)
        w(f)=w(f)+abs(a(f,i));
    end
        l(f)=w(f)-a(f,f);%strictlly 
        w(f)=(w(f)/abs(a(f,f)))-1;% se w={[|w|-|a(f,f)|]/|a(f,f)|}.:.w=[|w|/|a(f,f)|]-1
end
%ordenando o beta , para saber quem é o beta maximo
for i=1:A(1,1)
    for y=i+1:A(1,1)
        if(w(i)<w(y))
            trade=w(i);
            w(i)=w(y);
            w(y)=trade;
        end
    end
end
if(w(1)>1)
    disp('Matriz não converge\n');
    break;
end
%diagonal dominante
for i=1:A(1,1)
    if(abs(A(i,i))<=l(i))
        disp('diagonal não é dominante, matriz não converge');
        return;
    end
end
%recebendo os valores de x0 e comparando, entre em loop caso valor
%incorreto
X=input('Entre com os valores para X>>\n');
t=size(X);
while(t(2)~=B)
    disp('Tamanho de X não correspode ao valor de variaveis\n');
    X=input('Por favor entre novamente com os valores para X>>\n');
    t=size(X);
    clc;
end
x=X;
E=input('Entre com a tolerancia(erro)>>\n');
e=zeros(B);
e(1)=E+1;
c=0;

%jacobi 
while e(1)>=E
    if(c>0)
        X=x;
    end
    t=zeros(B);
        for f=1:A(1,1)
            for i=1:A(1,1)
                t(f)=t(f)+(a(f,i)*X(i));%na operação ele troca o sinal pela logica que o programa usa
            end
            t(f)=t(f)-(a(f,f)*X(f));%como eu inclu a matriz principal no primeiro for, agora eu tiro ela 
            x(f)=(b(f)-t(f))/a(f,f);
        end    
for i=1:A(1,1)
    e(i)=(abs(((x(i)-X(i))/x(i)))*100);
end
for i=1:A(1,1)
    for y=i+1:A(1,1)
        if(e(i)<e(y))
            trade=e(i);
            e(i)=e(y);
            e(y)=trade;
        end
    end
end
c=c+1;
end

clc;
formatSepc='Interações necessaria>>%9.1f  Erro encontrado>> %3.4f\n\n';
fprintf(formatSepc,c-1,e(1))
disp('Soluções encontradas>>')
x
disp('Matriz de entrada>>');
a