
clc;clear all;close all
%% ��ձ�������ȡͼ�񣬲���ʾ������
clear;close all
src = imread('cha1.jpg');
%��ʾԭʼͼ��
figure,
subplot(2,2,1),imshow(src),title('ԭͼ')
 
%��ostu������ȡ��ֵ����ֵ�����ж�ֵ����������ʾ
level=graythresh(src);
bw=im2bw(src,level);
subplot(2,2,2),imshow(bw),title('��ֵͼ��')
 
%���ÿ�������ȥ���
se = strel('disk',2);
openbw=imopen(bw,se);%�԰�ɫ�����
subplot(2,2,3),imshow(openbw),title('��������Ч��ͼ')
 
%��ȡ��ͨ���򣬲�������ʾ
% L = bwlabel(openbw,8);
[L,num] = bwlabel(openbw,8);
RGB = label2rgb(L);
subplot(2,2,4),imshow(RGB),title('��rgb��ɫ��ǲ�ͬ����')
 
%��ȡ�����'basic'���ԣ� 'Area', 'Centroid', and 'BoundingBox' 
% stats = regionprops(openbw, 'basic');
 stats = regionprops(openbw, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %ͳ�ư�ɫ����ͨ����
centroids = cat(1, stats.Centroid);
 
%%
noiseArea=10;
figure,imshow(openbw),title('2')  
hold on
for i=1:size(stats)
    imshow(openbw)
    rectangle('Position',[stats(i).BoundingBox],'LineWidth',2,'LineStyle','--','EdgeColor','r'),
    plot(centroids(i,1), centroids(i,2), 'b*');             %ÿ����ͨ���������λ��
    area = stats(i).Area;                                   %��ͨ��������
    if area<noiseArea                                       %����ǰ��ͨ�������С�������������������������Ϊ0
        pointList = stats(i).PixelList;                     %ÿ����ͨ���������λ��
        rIndex=pointList(:,2);cIndex=pointList(:,1);
        pointList = stats(i).PixelList;                     %��ͨ�������������
        openbw(rIndex,cIndex)=0;                            %��ͨ������������100����Ϊ������ɫ
    end
    pause(1);
    saveas(gcf,sprintf('%d',i),'jpg')                   %����ͼƬ
end

