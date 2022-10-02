%clear all
%pack load image
clc

imA = imread('eight.tif');
%imB = imnoise(imA,'salt & pepper', 0.02);

N = fix(242*308*0.02); %nombre des grains
imB=imA;

%im=[];
for i=1:N
 x=fix(242*rand)+1;
 y=fix(308*rand)+1;
 imB(x,y)=fix(2*rand)*255;
 %im=[im, imB(x,y)];
end
%im

figure(1)
subplot(121)
imshow(imA)
title('Image originale')

subplot(122)
imshow(imB)
title('Image bruitée')

fMoy=1/25*ones(5,5);
imMoy=uint8(conv2(imB,fMoy));

fGau=1/864*[11, 23, 29, 23, 11;
            23, 48, 62, 48, 23;
            29, 62, 80, 62, 29;
            23, 48, 62, 48, 23;
            11, 23, 29, 23, 11
            ];
imGau=uint8(conv2(imB,fGau));

fExp=1/80*[1, 1,  3, 1, 1;
           1, 3,  7, 3, 1;
           3, 7, 16, 7, 3;
           1, 3,  7, 3, 1;
           1, 1,  3, 1, 1;
           ];
imExp=uint8(conv2(imB,fExp));

imC=medfilt2(imB);

%%
figure(2)
subplot(121)
imshow(imB)
title('Image bruitée')
subplot(122)
imshow(imMoy)
title('Image filtrée Moy')

%%
figure(3)
subplot(121)
imshow(imB)
title('Image bruitée')
subplot(122)
imshow(imGau)
title('Image filtrée gaussien')

%%
figure(4)
subplot(121)
imshow(imB)
title('Image bruitée')
subplot(122)
imshow(imExp)
title('Image filtrée exponentiel')

%%
figure(5)
subplot(121)
imshow(imB)
title('Image bruitée')
subplot(122)
imshow(imC)
title('Image filtrée median')
