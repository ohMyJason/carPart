
clc;clear all;close all
%% 清空变量，读取图像，并显示其属性
clear;close all
src = imread('cha1.jpg');
%显示原始图像
figure,
subplot(2,2,1),imshow(src),title('原图')
 
%用ostu方法获取二值化阈值，进行二值化并进行显示
level=graythresh(src);
bw=im2bw(src,level);
subplot(2,2,2),imshow(bw),title('二值图像')
 
%运用开操作消去噪点
se = strel('disk',2);
openbw=imopen(bw,se);%对白色点而言
subplot(2,2,3),imshow(openbw),title('开运算后的效果图')
 
%获取连通区域，并进行显示
% L = bwlabel(openbw,8);
[L,num] = bwlabel(openbw,8);
RGB = label2rgb(L);
subplot(2,2,4),imshow(RGB),title('用rgb颜色标记不同区域')
 
%获取区域的'basic'属性， 'Area', 'Centroid', and 'BoundingBox' 
% stats = regionprops(openbw, 'basic');
 stats = regionprops(openbw, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %统计白色的连通区域
centroids = cat(1, stats.Centroid);
 
%%
noiseArea=10;
figure,imshow(openbw),title('2')  
hold on
for i=1:size(stats)
    imshow(openbw)
    rectangle('Position',[stats(i).BoundingBox],'LineWidth',2,'LineStyle','--','EdgeColor','r'),
    plot(centroids(i,1), centroids(i,2), 'b*');             %每个连通区域的重心位置
    area = stats(i).Area;                                   %连通区域的面积
    if area<noiseArea                                       %若当前连通区域面积小于噪声点的面积，则该区域设置为0
        pointList = stats(i).PixelList;                     %每个连通区域的像素位置
        rIndex=pointList(:,2);cIndex=pointList(:,1);
        pointList = stats(i).PixelList;                     %连通区域的像素坐标
        openbw(rIndex,cIndex)=0;                            %连通区域的面积不足100，置为背景颜色
    end
    pause(1);
    saveas(gcf,sprintf('%d',i),'jpg')                   %保存图片
end

