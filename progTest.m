title1='Progreso general ';
title2='Subproceso 1 ';
title3='Subproceso 2 ';
indent1=0;
indent2=1;
indent3=2;

h1=progress(indent1,title1,0);
for i=1:10
    prctg1=i/10;
    h2=progress(indent2,title2,0);
    for j=1:10
        prctg2=j/10;
        h3=progress(indent3,title3,0);
        for k=1:10
            prctg3=k/10;
            pause(0.1);
            h3=progress(indent3,title3,h3,prctg3);
        end
        h2=progress(indent2,title2,h2,prctg2);
    end
     h1=progress(indent1,title1,h1,prctg1);
end