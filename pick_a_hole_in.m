clear;
clc;
close all;
% camera=webcam; %connect to camera
% flag1=0;
% flag2=0;
count=0;
while true
clc;
close all;
pause(0.1);
t = java.awt.Toolkit.getDefaultToolkit();
rec = java.awt.Rectangle(t.getScreenSize());
robo = java.awt.Robot;
% t = java.awt.Toolkit.getDefaultToolkit();
rec = java.awt.Rectangle(t.getScreenSize());
image = robo.createScreenCapture(rec);
filehandle = java.io.File('xxx.png');
javax.imageio.ImageIO.write(image,'png',filehandle);
a=imread('xxx.png');
imshow(a),hold on
hight=size(a,1);
width=size(a,2);
b=imcrop(a,[1,1,width/3,hight]);

    imgA=imcrop(b,[92,67,470-92,445-67]);
    imgB=imcrop(b,[92,478,470-92,855-477]);

    
T=imsubtract(imgA,imgB);
D=imsubtract(imgB,imgA);0

T=T+D;
    for i=1:size(T,1)
        for j=1:size(T,2)
            if(T(i,j,1)>50||T(i,j,2)>50||T(i,j,3)>50)
                T(i,j,1)=255;
                T(i,j,2)=255;
                T(i,j,3)=255;
            end
            
            if(T(i,j,1)>20&&T(i,j,2)>20&&T(i,j,3)>20)
                T(i,j,1)=255;
                T(i,j,2)=255;
                T(i,j,3)=255;
            end
        end
    end
    figure(3)
    T=imresize(T,5);
    imshow(T)
prompt = 'right is 0?';
x = input(prompt)
if(x==0)
    count=count+1;
else
    break
end

end




% while true
%     picture=camera.snapshot;
% %     picture=imresize(picture,[227,227]);%resize picture
%     
%     
% %     image(picture);
%     figure(1)
%     imshow(picture);
%     hold on
%     size(picture);
%     x=size(picture,1);
%     y=size(picture,2);
%     
%     plot([2*y/5,y*3/5],[x/2,x/2],'g')
%     plot([y/2,y/2],[3*x/7,4*x/7],'r')
%     
% 
% %     background=picture(x/2,y/2);
% %     
% %     for find=x/2+50:x
% %         if(picture(find,y/2)==background&&(picture(find,y/2+5)==background||picture(find,y/2-5)==background))
% %             bottom2=find;
% %             break;
% %         end
% %     end
% %     
% %     for find=y/2:-1:1
% %         if(picture(x/2+50,find)==background&&(picture(x/2+80,find)==background||picture(x/2+30,find)==background))
% %             left=find;
% %             break;
% %         end
% %     end
% %     
% %     for find=y/2:y
% %         if(picture(x/2+50,find)==background&&(picture(x/2+80,find)==background||picture(x/2+30,find)==background))
% %             right=find;
% %             break;
% %         end
% %     end
% %     
% %     imgA=picture(x+1-bottom2:x/2,left:right,:);
% %     imgB=picture(x/2+1:bottom2,left:right,:);
% %     
% %     if(abs(size(imgA,1)-size(imgA,2))<10)
% %         A=imgA;
% %         flag1=1;
% %     end
% %     
% %     if(abs(size(imgB,1)-size(imgB,2))<10)
% %         B=imgB;
% %         flag2=1;
% %     end
% %     
% %     if(flag1&&flag2)
% %         break;
% %     end
% %     figure(2)
% %     subplot(2,1,1);
% %     imshow(imgA);
% %     subplot(2,1,2);
% %     imshow(imgB);
% 
% end
% 
% 
% %     figure(3)
% %     imgMIN=imsubtract(B,A);
% %     imshow(imgMIN)