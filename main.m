files = '*.jpg';
dir(files);
prompt = 'which image you want to process? \n';
I = input(prompt,'s');
x=imread(I);
y=rgb2gray(x) ;
z=histeq(y+10);
t=im2bw(z+20);
u=double(t);
[a, b]=size(u);
sz = fix(a*b/50000);
strel=ones(sz, sz);
for i=1:a
    c=1;
 for j=1:b
  if u(i,j)==1
    if (j-c)<=2 
        u(i,c:j)=1;
    end
    c=j;
  end
 end
if (b-c)<=2
    u(i,c:b)=2;
end
end
final=imdilate(u,strel);
imshow(final);
numberOfBPixels = numel(final)- sum(final(:));
if numberOfBPixels ~=0
fid = fopen('result.txt','at');
fprintf(fid, 'There are images in %s \n',I);
fclose('all');
end

            