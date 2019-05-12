mov = VideoReader('img/car.mp4'); 
imgRgb = imread('result.jpg');
imgRgb1 = im2double(imgRgb);
%  w=fspecial('laplacian',0);
% imgRgb1 = imfilter(imgRgb1,w,'replicate');
for ii =1: 2 :mov.NumberOfFrames
    zhen = read(mov,ii);
    subplot(221)
    title('vision');
    imshow(zhen);
    drawnow; 
    zhen1 = im2double(zhen);
    cha = zhen1 - 1*imgRgb1; 
    cha1=im2bw(cha,0.15);
    cha1=bwareaopen(cha1,50);
    cha1=imdilate(cha1,strel('disk',2));
    subplot(223);
    imshow(cha1,[]);
    [m,n,img1]=lable(cha1);
    if m>0&&n>0
    dest=drawRect(zhen,[m,n],[70,70],7);
    else
    dest=zhen;
    end
    subplot(222);
    imshow(dest);
    
    subplot(224);
    imshow(img1);
    
%     cha4=im2bw(cha4,0.15);%经过滤波处理后的效果比未经过滤波处理的效果要差
%     cha4=bwareaopen(cha4,50);
%     cha4=imdilate(cha4,strel('disk',2));
%     subplot(224);
%     imshow(cha4,[]);
    
end