function  ansImg=drawMapTraject(img1,img2)
[~,~,img1]=lable(img1);
[~,~,img2]=lable(img2);

 img1=im2uint8(img1);
img2=im2uint8(img2);

img1=reshape_1(img1);
img2=reshape_2(img2);
% subplot(121);
% imshow(img1);
% subplot(122);
% imshow(img2);
ansImg=buildMap(img1,img2);
map=imread('img/map.jpg');
ansImg=im2uint8(ansImg);
ansImg=ind2rgb(ansImg,map);
map=imresize(map,[125,244]);
map=im2double(map);
ansImg=map-ansImg;
imshow(ansImg);
end