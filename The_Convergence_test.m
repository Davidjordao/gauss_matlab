clc;
clear;
%recebendo os valores da matriz
l=input('entre com a matriz de coeficientes:\n');
b=input('entre com a matriz de constantes:\n');
l_size=size(l);
b_size=size(b);
b_controle=b_size(1,2)+1;
trade=0;
clc;
%caso a matriz não seja quadrada
while(l_size(1,1)~=l_size(1,2) || l_size(1,1)~=b_size(1,2))
    disp('numero de colunas diferente do numero de linhas \n digite uma matriz quadrada \n')
    l=input('entre com a matriz a:\n');
    b=input('entre com a matriz b:\n');
    l_size=size(l);
    b_size=size(b);
    clc;
end

beta=ones(b_size);%preciso preencher com 1 esssa matriz para garantir que não gere erro nas funções posteriores
%for indice=1:l_size(1,1)aparentemente o matlab tem um comando para criar
%matriz de zeros
%    beta(indice)=1;
%end

%fazendo uma matriz expandida 
for linha=1:l_size(1,1)
    l(linha,l_size(1,2)+1)=b(linha);
end

%calculo da convergencia da matriz
for fixo=1:l_size(1,1)
    betax=0;
    for indice=1:l_size(1,1) %efetuo a mult. dos termos
        temp(indice)=beta(indice)*abs(l(fixo,indice));
    end
    for indice=1:l_size(1,1)%efetuo a soma dos termo.
        betax=betax+temp(indice);
    end
    betax=betax-abs(l(fixo,fixo));
    beta(fixo)=betax/abs(l(fixo,fixo));
end

%ordenando o beta , para saber quem é o beta maximo
for i1=1:l_size(1,1)
    for i2=i1+1:l_size(1,1)
        if(beta(i1)<beta(i2))
            trade=beta(i1);
            beta(i1)=beta(i2);
            beta(i2)=trade;
        end
    end
end
if(beta(1)>1)
    disp('Matriz converge= Fail');
    break;
else
    disp('matriz converge = ok');
end


