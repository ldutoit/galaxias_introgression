#module load Dsuite

import os, filecmp

#record all pops asnd all inds
pops =set()
inds= []

###DH1 DH2, DN1, DN2, Vl1, VL2, VL3 excluded as xxx in popmap
with open("popmap.txt") as f:
	for line in f:
		pops.add(line.split()[1])
		inds.append(line.split()[0])

comps=set()
with open("sets2.txt") as f:
	for line in f:
		if not line.startswith("comp"):
			comp_num,sp1,sp2,sp3,outgroup,typecomp=line.strip().split()
			#print(comp_num)
			assert all(item in pops for item in [sp1,sp2,sp3,outgroup] )# make sure each pop exist as inds in the comparison
			comps.add( str(sorted([sp1,sp2,sp3]))) # rcording the comps as a character to make sure they are all independent
			print(len(comps))
			#print(comps)
			###MAKE THE TEST
			output_folder = "comp"+comp_num
			if not os.path.exists("comp"+comp_num):os.mkdir(output_folder)
			sets_file = open(output_folder+"/sets.txt","w")
			for ind in inds:
				#print(ind)
				sp = ind.split("_")[1]
				if ind in ["DH1_galtev", "DH2_galtev", "DN1_galtev", "DN2_galtev", "Vl1_galspn", "VL2_galspn", "VL3_galspn"]: sp = "xxx"
				if sp in [sp1,sp2,sp3]:
					sets_file.write(ind+"\t"+sp+"\n")
				elif sp==outgroup:
					sets_file.write(ind.split()[0]+"\tOutgroup\n")
				else:		
					sets_file.write(ind.split()[0]+"\txxx\n")
			sets_file.close()
			#run the test
			os.system("Dsuite Dtrios populations.snps.vcf "+output_folder+"/sets.txt")
			#check both outputs are the same
			if not filecmp.cmp(output_folder+'/sets_Dmin.txt', output_folder+'/sets_BBAA.txt'):
				print("THE TWO OUTPUT FILES ARE DIFFERENT")
			###parse_output
# check all comps are different
assert int(comp_num)==len(comps) # all comps are different?


import os
os.system("head -n 1 comp1/sets_BBAA.txt > summary_BBAA2.txt" )
for i in range(1,len(comps)+1):
	print(i)
	os.system("tail -n 1 comp"+str(i)+"/sets_BBAA.txt >>  summary_BBAA.txt" )

os.system("paste sets2.txt summary_BBAA2.txt > allBBAA2.txt")

#12 and 15, 18  Dmin are different for sets2.txt

#or the first, in a file with the “BBAA.txt” suffix, Dtrios attempts to infer the population or species relationships: it orders each trio assuming that the correct tree is the one where the BBAA pattern is more common than the discordant ABBA and BABA patterns, which are assumed to result from incomplete lineage sorting or from introgression. The second type of output is the Dmin score, the minimum D for each trio regardless of any assumptions about the tree topology. There is no attempt to infer the true tree; instead, the trio is ordered so that the difference between nABBA and nBABA is minimized. This output is in a file with the “Dmin.txt” suffix and can be used to set a lower bound on the amount of “nontreeness” in the data set when the true phylogeny is uncertain, as in Malinsky et al. (2018). 
