test-all:
	ls -lh examples
	tclsh $(OOMMFTCL) boxsi +fg examples/isolated_sk_DMI_D2d.mif -exitondone 1
	ls -lh examples
	tclsh $(OOMMFTCL) boxsi +fg examples/sk_lattice_DMI_D2d_PBCs.mif -exitondone 1
	ls -lh examples

travis-build:
	docker build --no-cache -t dockertestimage .
	docker run -ti -d --name testcontainer dockertestimage
	docker exec testcontainer make test-all
	docker stop testcontainer
	docker rm testcontainer
