video=VideoReader('img/11.mp4');
imgRgb = read(video,1);
imgRgb1 = im2double(imgRgb);
R1 = imgRgb1(:,:,1);       
G1 = imgRgb1(:,:,2);
B1 = imgRgb1(:,:,3);
i = 1;
for t=2: 20 :video.NumberOfFrames
imgRgb = read(video,t);
subplot(221);
imshow(imgRgb);
drawnow;
       imgRgb1 = im2double(imgRgb);
       R = imgRgb1(:,:,1);       
       G = imgRgb1(:,:,2);
       B = imgRgb1(:,:,3);
       R1 = R + R1;
       G1 = G + G1;
       B1 = B + B1;
       subplot(222);
       BackGU = cat(3,R1,G1,B1);
       imshow(BackGU,[]);
       i = i+1;
       R2 = R1*1/i;
       G2 = G1*1/i;
       B2 = B1*1/i;
       subplot(222);
       BackGU = cat(3,R2,G2,B2);
       imshow(BackGU,[]);
end
BackGU = cat(3,R2,G2,B2);
subplot(223);
imshow(BackGU,[]);
imwrite(BackGU,'D:\Documents\MATLAB\carPart\img\result_2.jpg','jpg');