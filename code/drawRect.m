function [ dest ] = drawRect( src, pt, wSize,  lineSize, color )
%��飺
% %��ͼ��������ɫ�Ŀ�ͼ����������ǻҶ�ͼ����ת��Ϊ��ɫͼ���ٻ���ͼ
% ͼ�����
% ����������  ��  y
% ����������  ��  x
%----------------------------------------------------------------------
%���룺
% src��        ԭʼͼ�񣬿���Ϊ�Ҷ�ͼ����Ϊ��ɫͼ
% pt��         ���Ͻ�����   [x1, y1]
% wSize��   ��Ĵ�С      [wx, wy]
% lineSize�� �ߵĿ��
% color��     �ߵ���ɫ      [r,  g,  b] 
%----------------------------------------------------------------------
%�����
% dest��           �����˵�ͼ��
%----------------------------------------------------------------------
 
%flag=1: ��ȱ�ڵĿ�
%flag=2: ��ȱ�ڵĿ�
flag = 1;
 
 
%�ж������������
if nargin < 5
    color = [255 255 0];
end
 
if nargin < 4
    lineSize = 1;
end
 
if nargin < 3
    disp('����������� !!!');
    return;
end
 
 
 
 
 
%�жϿ�ı߽�����
[yA, xA, z] = size(src);
x1 = pt(1)-30;
y1 = pt(2)-30;
wx = wSize(1);
wy = wSize(2);
% if  x1>xA || ...
%         y1>yA||...
%         (x1+wx)>xA||...
%         (y1+wy)>yA
%  
%     disp('���Ŀ򽫳���ͼ�� !!!');
%     return;
% end
 
%����ǵ�ͨ���ĻҶ�ͼ��ת��3ͨ����ͼ��
if 1==z
    dest(:, : ,1) = src;
    dest(:, : ,2) = src;
    dest(:, : ,3) = src;
else
    dest = src;
end
 
%��ʼ����ͼ
if x1>8&&y1>8
for c = 1 : 3                 %3��ͨ����r��g��b�ֱ�
    for dl = 1 : lineSize   %�ߵĿ�ȣ���������������չ��
        d = dl - 1;
        if  1==flag %��ȱ�ڵĿ�
            dest(  y1-d , x1:(x1+wx) ,  c  ) =  color(c); %�Ϸ�����
            dest(  y1+wy+d ,   x1:(x1+wx) , c ) =  color(c); %�·�����
            dest(  y1:(y1+wy) ,   x1-d ,   c  ) =  color(c); %������
            dest(  y1:(y1+wy) ,   x1+wx+d ,    c  ) =  color(c); %������
        elseif 2==flag %��ȱ�ڵĿ�
            dest(  y1-d ,  (x1-d):(x1+wx+d) ,  c  ) =  color(c); %�Ϸ�����
            dest(  y1+wy+d ,  (x1-d):(x1+wx+d) ,  c  ) =  color(c); %�·�����
            dest(  (y1-d):(y1+wy+d) ,  x1-d ,   c  ) =  color(c); %������
            dest(  (y1-d):(y1+wy+d) ,  x1+wx+d , c  ) =  color(c); %������
        end
    end    
end %��ѭ��β
end
 
end %����β
