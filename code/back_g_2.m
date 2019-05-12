video=VideoReader('car.mp4');
BackGU = read(video,10);
imshow(BackGU,[]);
imwrite(BackGU,'D:\Documents\MATLAB\carPart\car1.jpg','jpg');