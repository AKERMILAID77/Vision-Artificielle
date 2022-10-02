clear all
clc

A = imread('route.png');
B = imread('sat.png');

figure(1)
subplot(221)
imshow(A)

subplot(222)
imshow(B)

subplot(223)
imhist(A);

subplot(224)
imhist(B);

A2 = histeq(A);
B2 = histeq(B);

figure(2)
subplot(221)
imshow(A2)

subplot(222)
imshow(B2)

subplot(223)
imhist(A2);

subplot(224)
imhist(B2);

%% Histogrammes cumules Avant
Ah = imhist(A);
Bh = imhist(B);

Acum = Ah;
Bcum = Bh;
for i=2:256
    Acum(i)= Acum(i) + Acum(i-1);
    Bcum(i)= Bcum(i) + Bcum(i-1);
end

figure(3)
subplot(221)
plot(Acum, 'b-')

subplot(222)
plot(Bcum, 'r-')

%% Histogrammes cumules Apres
A2h = imhist(A2);
B2h = imhist(B2);
A2cum = A2h;
B2cum = B2h;
for i=2:256
    A2cum(i)= A2cum(i) + A2cum(i-1);
    B2cum(i)= B2cum(i) + B2cum(i-1);
end

subplot(223)
plot(A2cum, 'b-')

subplot(224)
plot(B2cum, 'r-')

%% Mon essai
S=208*208;
An=A;
for j=1:208
    for k=1:208
        An(j,k)=fix(Acum(A(j,k)+1)*255/S);         
    end
end
figure(4)
subplot(221)
imshow(A)
subplot(222)
imshow(An)
subplot(223)
imhist(A)
subplot(224)
imhist(An)

