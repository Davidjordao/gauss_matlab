%professor terminei em cima da hora e testei algumas matrizes, não gerou
%erro, se der algum b.o. com alguma matriz foi pq deixei passar batido, me desulpe.

%david jordao mesquita bellini dos santos 1602450021
%diogo munho
clc
clear
l=input('entre com a matriz de coeficientes:\n');
b=input('entre com a matriz de constantes:\n');
l_size=size(l);
b_size=size(b);
b_controle=b_size(1,2)+1;
while(l_size(1,1)~=l_size(1,2) || l_size(1,1)~=b_size(1,2))
    clc
    disp('numero de colunas diferente do numero de linhas \n digite uma matriz quadrada \n')
    l=input('entre com a matriz a:\n');
    b=input('entre com a matriz b:\n');
    l_size=size(l);
    b_size=size(b);
end

for linha=1:l_size(1,1)
    l(linha,l_size(1,2)+1)=b(linha);
end
x=1;
m=0;
temp=zeros(l_size(1,1));
v1=zeros(l_size+1);
%não esquecer de fazer a conferencia ,se a(1,1)=0 muito importante.
if(l(1,1)==0)
    for i1=1:l_size(1,1)
        temp(1,i1)=l(i1,1);
        temp(2,i1)=i1;
    end
    for i1=1:l_size(1,1)%metodo bolha para ordenar de forma crecente
        for i2=i1+1:l_size(1,1)%onde temp(1,2) vai mostrar a linha que deve ser trocada pela primeira
            if(temp(1,i1)<temp(1,i2))%deu dor de cabeça pra montar haha mas usei a base do metodo bolha de vetor so que pra matriz
                trade(1,1)=temp(1,i1);
                trade(2,1)=temp(2,i1);
                temp(1,i1)=temp(1,i2);
                temp(2,i1)=temp(2,i2);
                temp(1,i2)=trade(1,1);
                temp(2,i2)=trade(2,1);
            end
        end
    end
    ar=temp(2,1);%armazeno o indice de referencia de pos. para troca 
    for i=1:l_size(1,1)+1%faço a troca das linhas amazendo na linha de destino
        v1(i)=l(ar,i);
        l(ar,i)=l(1,i);
    end
    for i=1:l_size(1,1)+1%termino de trocar as linhas
        l(1,i)=v1(i);
    end
end
for acoluna=1:l_size(1,1)-1
    for alinha=x:l_size(1,1)-1%ir a menos -1 pois senão excede no alinha +1 como trabalho com um vetor sempre a frente, ele tem que para um antes
    m1=l(alinha,acoluna);

        if(alinha==acoluna && acoluna~=l_size(1,1) && alinha~=l_size(1,1))%só é usado para gerar 1 no item a(1,1)   
            for indice=1:l_size(1,1)+1%ele vai pegar a(1,1) e dividir por toda a linha
                l(alinha,indice)=l(alinha,indice)/m1;%termina o for com ponteiro em a(1,3) p/ caso do ex.
            end
        end

    m=l(alinha+1,acoluna)/l(x,acoluna);%to fazendo m(n,1)=an1/a11 p/ caso ex.
    for indice=1:l_size(1,1)+1
        l(alinha+1,indice)=l(alinha+1,indice)-( m*l(x,indice));%fazendo l2-m(2,1)*l1
    end
    end
    x=x+1;
end