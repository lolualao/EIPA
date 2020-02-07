% Alao Obaloluwa Siimeon 
% 100977279

nx = 50;
ny = 50;
G = sparse(nx*ny,ny*nx);


for i=1:nx
    for j=1:ny
        n = j + (i-1)*ny;
        if i==1||i==nx||j==1||j==ny
            G(n,:)=0;
            G(n,n)=1;
        else
       
        nxm = (i-2)*ny + j;
        nxp = i*ny + j;
        nym = (i-1)*ny + j-1;
        nyp = (i-1)*ny + j+1;
       
        G(n,n) = -4;
        G(n, nxm) = 1;
        G(n, nxp) = 1;
        G(n, nym) = 1;
        G(n, nyp) = 1;
        
         if i > 10 & i < 20 & j > 10 & j < 20
             G(n,n) = -4;
         end 
        end
    end  
end
figure(1)
spy(G)

figure(2)
[E,D] = eigs(G,9,'SM')
x=diag(D)
plot(x)

for i=1:nx
    for j=1:ny
        n = j + (i-1)*ny;
        for x=1:9
            sMap(i,j,x) = E(n,x);
        end
    end
end

for x=1:9
    figure;
    surf(sMap(:,:,x))
    title(['Surface plot of Eigenvectors, mode = ', num2str(x)]);
end