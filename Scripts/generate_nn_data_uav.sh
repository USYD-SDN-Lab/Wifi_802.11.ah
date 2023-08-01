# rsnn data
# config
CXXFLAGS="-std=c++11 -D__SDN_LAB_PRINT_NN_DATA_AVERAGE -D__SDN_LAB_DEBUG_NN -D__SDN_LAB_RA_MINSTREL_SNN_PLUS" ./waf configure --disable-examples --disable-tests

# compile
./waf

# generate data
# human
for holdtime in 2 3 4 5
do
    # uav
    projectname="rsnn_data_uav"
    for seed in $(seq 5 7)
    do
        curprojectname="$projectname$seed"_"$holdtime"
        ./waf --run "rca --seed=$seed --simulationTime=7200 --payloadSize=100 --BeaconInterval=500000 --rho=250 --pagePeriod=1 --pageSliceLength=1 --pageSliceCount=0 --projectname=$curprojectname --isLocRectangular --isLocRandom --isMobRandomWalk --speedHoldTime=$holdtime --speedMin=83.3333 --speedMax=127.778"
    done
done