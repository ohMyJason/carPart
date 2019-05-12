mov = VideoReader('img/3.mp4'); 
imgRgb = imread('img/result_1.jpg');
imgRgb1 = im2double(imgRgb);
%  w=fspecial('laplacian',0);
% imgRgb1 = imfilter(imgRgb1,w,'replicate');
% trajectImg=zeros(544,960);
img1_1=zeros(544,960);
img2_2=zeros(544,960);

for ii =1: 8 :mov.NumberOfFrames
    zhen = read(mov,ii);    
    subplot(241)
    title('vision');
    imshow(zhen);
%     drawnow; 
    zhen1 = im2double(zhen);
    cha = zhen1 - 1*imgRgb1; 
    cha1=im2bw(cha,0.15);
%     cha1=bwareaopen(cha1,50);
%     cha1=imdilate(cha1,strel('disk',2));
    subplot(243);
    imshow(cha1,[]);
    [m,n,img1]=lable(cha1);
    if m>0&&n>0
    dest=drawRect(zhen,[m,n],[70,70],7);
    else
    dest=zhen;
    end
    subplot(242);
    imshow(dest);
    
    subplot(244);
    img1_1=img1_1+img1;
    imshow(img1_1);
    imwrite(img1_1,'D:\Documents\MATLAB\carPart\img\img1_1_1.jpg','jpg');
%     if m<544&&n<960
%     currectPositionImg=drawTrajectory([m,n]);
%     trajectImg=trajectImg+currectPositionImg;
%     end
%     imshow(trajectImg);
    
%     cha4=im2bw(cha4,0.15);%经过滤波处理后的效果比未经过滤波处理的效果要差
%     cha4=bwareaopen(cha4,50);
%     cha4=imdilate(cha4,strel('disk',2));
%     subplot(224);
%     imshow(cha4,[]);
    
end



mov = VideoReader('img/11.mp4'); 
imgRgb = imread('img/result_2.jpg');
imgRgb1 = im2double(imgRgb);
%  w=fspecial('laplacian',0);
% imgRgb1 = imfilter(imgRgb1,w,'replicate');
for ii =1: 8 :mov.NumberOfFrames
    zhen = read(mov,ii);
    subplot(245)
    title('vision');
    imshow(zhen);
%     drawnow; 
    zhen1 = im2double(zhen);
    cha = zhen1 - 1*imgRgb1; 
    cha1=im2bw(cha,0.15);
%     cha1=bwareaopen(cha1,50);
%     cha1=imdilate(cha1,strel('disk',2));
    subplot(247);
    imshow(cha1,[]);
    [m,n,img1]=lable(cha1);
    if m>0&&n>0
    dest=drawRect(zhen,[m,n],[70,70],7);
    else
    dest=zhen;
    end
    subplot(246);
    imshow(dest);
    
    subplot(248);
    img2_2=img2_2+img1;
    imshow(img2_2);
    imwrite(img2_2,'D:\Documents\MATLAB\carPart\img\img2_2_2.jpg','jpg');
%     cha4=im2bw(cha4,0.15);%经过滤波处理后的效果比未经过滤波处理的效果要差
%     cha4=bwareaopen(cha4,50);
%     cha4=imdilate(cha4,strel('disk',2));
%     subplot(224);
%     imshow(cha4,[]);
    
end

img111=imread('img/img1_1_1.jpg');
img222=imread('img/img2_2_2.jpg');
ansImg=drawMapTraject(img111,img222);

