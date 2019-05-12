function  [m,n,img1]=lable(img)
% se = strel('disk',2);
% openbw=imopen(img,se);%对白色点而言
% imshow(openbw)%,title('开运算后的效果图')            
%  stats = regionprops(openbw, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %统计白色的连通区域
% centroids = cat(1, stats.Centroid);

imLabel =bwlabel(img);        %对各连通域进行标记
stats = regionprops(imLabel,'Area');    %求各连通域的大小
area = cat(1,stats.Area);
index = find(area == max(area));        %求最大连通域的索引
img1 = ismember(imLabel,index);          %获取最大连通域图像
imLabel2 = bwlabel(img1);
stats2 = regionprops(imLabel2,'Centroid');
temp=sum(img1(:));
if temp~=0
    m=round(stats2.Centroid(1));
    n=round(stats2.Centroid(2));
else
    m=0;
    n=0;
end

% siz=size(img1);
% temp=1;
% for m=1:siz(1)
%     for n=1:siz(2)
%         if img(m,n)==1
%             temp=0;
%             break;
%         end
%     end
%     if temp==0
%         break;
%     end
% end


end
