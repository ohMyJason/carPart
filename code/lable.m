function  [m,n,img1]=lable(img)
% se = strel('disk',2);
% openbw=imopen(img,se);%�԰�ɫ�����
% imshow(openbw)%,title('��������Ч��ͼ')            
%  stats = regionprops(openbw, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %ͳ�ư�ɫ����ͨ����
% centroids = cat(1, stats.Centroid);

imLabel =bwlabel(img);        %�Ը���ͨ����б��
stats = regionprops(imLabel,'Area');    %�����ͨ��Ĵ�С
area = cat(1,stats.Area);
index = find(area == max(area));        %�������ͨ�������
img1 = ismember(imLabel,index);          %��ȡ�����ͨ��ͼ��
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
