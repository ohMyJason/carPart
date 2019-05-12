function map=buildMap(img1,img2)

% img1=imread('img/imgn_1.jpg');
% img2=imread('img/imgn_2.jpg');
img1=im2double(img1);
img2=im2double(img2);
% subplot(221);
% imshow(img2);
% subplot(222);
% imshow(img1);

img2_2=zeros(228,232);
for m=1:239
    for n=1:336
        if m>=12 && m<=240 && n>=89 &&n<=321
            img2_2(m-11,n-87)=img2(m,n);
        end
    end
end

img1_1=zeros(125,158);
for m=1:164
    for n=1:236
        if m>26 && m<151 && n>27 &&n<185
            img1_1(m-26,n-27)=img1(m,n);
        end
    end
end


% subplot(224);
% imshow(img1_1);

img2_2=imresize(img2_2,[106,123]);

img2_3=zeros(106,86);
for m=1:106
    for n=1:123
        if  n<86
            img2_3(m,n)=img2_2(m,n);
        end
    end
end



ansImg=zeros(125,244);
for m=1:125
    for n=1:244
        if n<=86
            if m<=106;
            ansImg(m,n)=img2_3(m,n);
            end
        else
            ansImg(m,n)=img1_1(m,n-86);
        end
    end
end

% subplot(223);
% imshow(ansImg);

map=ansImg;
end




