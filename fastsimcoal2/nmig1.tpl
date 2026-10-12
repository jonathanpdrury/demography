//Parameters for the coalescence simulation program : simcoal.exe
3 samples to simulate :
//Population effective sizes (number of genes)
$Npop0$
$Npop1$
$Npop2$
//Samples sizes and samples age
16
6
24
//Growth rates: negative growth implies population expansion
0
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0
0 MIG001$ 0
MIG010$ 0 0
0 0 0
//Migration matrix 1
0 0 0
0 0 MIG112$
0 MIG121$ 0
//Migration matrix 2
0 0 0
0 0 0
0 0 0
//historical event: time, source, sink, migrants, new deme size, growth rate, migr mat index
2 historical event
$TSB$ 0 1 1 $RSSB$ 0 1
$TLB$ 1 2 1 $RSLB$ 0 2
//Number of independent loci [chromosome]
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 2.8e-9 OUTEXP
