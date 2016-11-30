
reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end

img = imread('celebs.jpg');

detector = buildDetector();
[bbox bbimg faces bbfaces] = detectFaceParts(detector,img,2);
%% My Code
face_box = bbox(:,1:4);
for f = 1:size(face_box,1)
    img2Bswpd = imresize(imread('heresJohnny.jpg'),[face_box(f,3),face_box(f,4)]);
    points = bbox2points(face_box(f,:));

    m=1;
    n=1;
    for i=points(1,1):points(2,1)
        for j=points(1,2):points(3,2)
            if(m<size(img2Bswpd,1) && n< size(img2Bswpd,2)) 
                img(j,i,:) = img2Bswpd(m,n,:);
            end
            m = m+1;
        end
       m=1;
       n=n+1;
    end
end
figure;imshow(img);
%%
figure;imshow(bbimg);
% for i=1:size(bbfaces,1)
%  figure;imshow(bbfaces{i});
% end
% 
% edgeImage = edge(rgb2gray(img),'canny');
% figure;imshow(edgeImage);

% Please uncoment to run demonstration of detectRotFaceParts

%  img = imrotate(img,180);
%  detector = buildDetector(2,2);
%  [fp bbimg faces bbfaces] = detectRotFaceParts(detector,img,2,15);
% 
%  figure;imshow(bbimg);
%  for i=1:size(bbfaces,1)
%   figure;imshow(bbfaces{i});
%  end
