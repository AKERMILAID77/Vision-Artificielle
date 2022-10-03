clear all
clc

imA = imread('eight.tif');

%imB = imnoise(imA,'salt & pepper', 0.02);
%imB = imnoise(imA,'gaussian',0.02);
%imB = imnoise(imA,'poisson');

N = fix(242*308*0.02); %nombre des grains
imB=imA;
for i=1:N
 x=fix(242*rand)+1;
 y=fix(308*rand)+1;
 imB(x,y)=fix(2*rand)*255;
end


figure(1)
subplot(231)
imshow(imA)
title('Image originale')

subplot(232)
imshow(imB)
title('Image bruitee (salt & papper)')
%title('Image bruitee (gaussian)')
%title('Image bruitee (poisson)')

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
subplot(233)
imshow(imMoy)
title('Image filtree Moy')

%%
subplot(234)
imshow(imGau)
title('Image filtree gaussien')

%%
subplot(235)
imshow(imExp)
title('Image filtree exponentiel')

%%
subplot(236)
imshow(imC)
title('Image filtree median')

%%
%my filter
imD=imB;
for x=3:240
    for y=3:306
        if (imB(x,y)==0) | (imB(x,y)==255);
            myMat=imB(x-2:x+2,y-2:y+2);
            imD(x,y)=uint8(sum(sum(myMat))/25);
        end        
    end
end

figure(2)
subplot(121)
imshow(imB)

subplot(122)
imshow(imD)
