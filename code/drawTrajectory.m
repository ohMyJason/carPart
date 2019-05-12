function ansImg=drawTrajectory(pt)
x1=pt(1);
y1=pt(2);

x2=pt(1)-1;
y2=pt(2)-1;

x3=pt(1)-1;
y3=pt(2);

x4=pt(1)-1;
y4=pt(2)+1;

x5=pt(1);
y5=pt(2)-1;

x6=pt(1);
y6=pt(2)+1;

x7=pt(1)+1;
y7=pt(2)-1;

x8=pt(1)+1;
y8=pt(2);

x9=pt(1)+1;
y9=pt(2)+1;
ansImg=zeros(544,960);

ansImg(x1,y1)=1;
ansImg(x2,y2)=1;
ansImg(x3,y3)=1;
ansImg(x4,y4)=1;
ansImg(x5,y5)=1;
ansImg(x6,y6)=1;
ansImg(x7,y7)=1;
ansImg(x8,y8)=1;
ansImg(x9,y9)=1;
imshow(ansImg);
end
