cd 
find . -type f | awk '{
   a[++cnt] = $0
}
cnt==1000 {
   subd = "sub_" ++d;
   system("mkdir " subd);
   for (f in a)
      system("mv " a[f] " " subd);
   cnt=0
}'