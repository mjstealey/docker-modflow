# docker-modflow
Docker implementation of [MODFLOW-2005-v.1.11.00](http://water.usgs.gov/ogw/modflow/MODFLOW.html)

Based on [source code](http://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.11.00/mf2005v1_11_00_unix.zip) for Unix file structure

## Pull the precompiled image from Docker Hub

The [docker image](https://hub.docker.com/r/mjstealey/docker-modflow/) is automatically built on commit to this repository at Docker hub. Docker Hub is a cloud hosted service from Docker that provides registry capabilities for public and private content. Learn more about [Docker](https://docs.docker.com) and [Docker Hub](https://hub.docker.com).

```bash
docker pull mjstealey/docker-modflow
```

## Usage:

Invoke **mf2005 MYFILE.nam** execution where `MYFILE.nam` = name of the MODFLOW name file for the simulation. 
This is achieved by sharing your local MODFLOW input files from a directory on the host that we'll call `/LOCALPATH`, and the docker-modflow instance will mount this as `/workspace` internally. The resulting output **.lst** file will be written to the shared `/LOCALPATH` directory.
```bash
docker run --rm -v /LOCALPATH:/workspace mjstealey/docker-modflow mf2005 MYFILE.nam 
```

**Example 1:** Say we want to run a set of input files where the name file is **bcf2ss.nam** and it's located within our local directory **/mydirectory**. 
```bash
$ ls /mydirectory/ -1
bcf2ss.ba6
bcf2ss.bc6
bcf2ss.dis
bcf2ss.nam
bcf2ss.oc
bcf2ss.pcg
bcf2ss.rch
bcf2ss.riv
bcf2ss.wel
```

We can invoke the call by mapping the shared volume as `-v /mydirectory:/workspace` and specify the execution of MODFLOW on our **bcf2ss.nam** as `mf2005 bcf2ss.nam` in the following way:
```bash
$ docker run --rm -v /mydirectory:/workspace mjstealey/docker-modflow mf2005 bcf2ss.nam

                                  MODFLOW-2005
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013

 Using NAME file: bcf2ss.nam
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/27 18:29:16

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     1    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/27 18:29:16
 Elapsed run time:  0.013 Seconds

  Normal termination of simulation
```
Upon successful completion the user will now find the resultant **bcf2ss.lst** output file in their local **/mydirectory**.
```bash
$ ls /mydirectory/ -1
bcf2ss.ba6
bcf2ss.bc6
bcf2ss.dis
bcf2ss.lst    <-- Output file
bcf2ss.nam
bcf2ss.oc
bcf2ss.pcg
bcf2ss.rch
bcf2ss.riv
bcf2ss.wel
```
---

**Example 2:** Say we want to run a set of input files where the name file is **UZFtest2.nam** and it's located within our local directory **/mydirectory**. 
```bash
$ ls /mydirectory/ -1
UZFtest2.ba6
UZFtest2.dis
UZFtest2.gag
UZFtest2.ghb
UZFtest2.lpf
UZFtest2.nam
UZFtest2.oc
UZFtest2.sfr
UZFtest2.sip
UZFtest2.uzf
UZFtest2.wel
```
We can invoke the call by mapping the shared volume as `-v /mydirectory:/workspace` and specify the execution of MODFLOW on our **UZFtest2.nam** as `mf2005 UZFtest2.nam` in the following way:
```bash
$ docker run --rm -v /mydirectory:/workspace mjstealey/docker-modflow mf2005 UZFtest2.nam

                                  MODFLOW-2005
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013

 Using NAME file: UZFtest2.nam
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/27 18:20:26

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     4    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     5    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     6    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     7    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     8    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     9    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:    10    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:    11    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:    12    Time step:    15    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/27 18:20:33
 Elapsed run time:  7.625 Seconds

  Normal termination of simulation
```

Upon successful completion the user will now find the resultant output files in their local **/mydirectory**.
```bash
$ ls /mydirectory/ -1
UZFtest2.ba6
UZFtest2.dis
UZFtest2dv.sg9  <-- Output file
UZFtest2.flw    <-- Output file
UZFtest2.gag
UZFtest2.ghb
UZFtest2hd.out  <-- Output file
UZFtest2.lpf
UZFtest2.lst    <-- Output file
UZFtest2.nam
UZFtest2.oc
UZFtest2.sfr
UZFtest2.sg1    <-- Output file
UZFtest2.sg2    <-- Output file
UZFtest2.sg3    <-- Output file
UZFtest2.sg4    <-- Output file
UZFtest2.sg5    <-- Output file
UZFtest2.sg6    <-- Output file
UZFtest2.sg7    <-- Output file
UZFtest2.sg8    <-- Output file
UZFtest2.sip
UZFtest2.uzf
UZFtest2.uzf1   <-- Output file
UZFtest2.uzf2   <-- Output file
UZFtest2.uzf3   <-- Output file
UZFtest2.uzf4   <-- Output file
UZFtest2.uzfot  <-- Output file
UZFtest2.wel
```
---
**Validation of the model:**
To test the validity of the model we will iterate over all **.nam** files found in the **test-run** directory If the container is run without any additional parameters. Samples of the expected output **.lst** files are found in the **test-out** directory and can be used for comparison as needed.
```bash
docker run --rm mjstealey/docker-modflow
```

**Example 3:** This is the output that would be recieved by the user in the console if the docker-modflow container were invoked without any additional parameters.
```bash
$ docker run --rm mjstealey/docker-modflow

### RUNNING TESTS ###
RUN: MNW2-Fig28.nam

                                  MODFLOW-2005     
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013                        

 Using NAME file: MNW2-Fig28.nam 
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 21:54:45

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:    12    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:00:00
 Elapsed run time:  5 Minutes, 14.424 Seconds

  Normal termination of simulation
RUN: UZFtest2.nam

                                  MODFLOW-2005     
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013                        

 Using NAME file: UZFtest2.nam 
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:00:00

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     4    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     5    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     6    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     7    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     8    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:     9    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    10    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    11    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    12    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    13    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    14    Ground-Water Flow Eqn.
 Solving:  Stress period:     2    Time step:    15    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     1    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     2    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     3    Ground-Water Flow Eqn.
 Solving:  Stress period:     3    Time step:     4    Ground-Water Flow Eqn.
...
...
RUN: twri.nam

                                  MODFLOW-2005     
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013                        

 Using NAME file: twri.nam 
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13
 Elapsed run time:  0.005 Seconds

  Normal termination of simulation
RUN: twrihfb.nam

                                  MODFLOW-2005     
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013                        

 Using NAME file: twrihfb.nam 
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13
 Elapsed run time:  0.005 Seconds

  Normal termination of simulation
RUN: twrip.nam

                                  MODFLOW-2005     
    U.S. GEOLOGICAL SURVEY MODULAR FINITE-DIFFERENCE GROUND-WATER FLOW MODEL
                             Version 1.11.00 8/8/2013                        

 Using NAME file: twrip.nam 
 Run start date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13

 Solving:  Stress period:     1    Time step:     1    Ground-Water Flow Eqn.
 Run end date and time (yyyy/mm/dd hh:mm:ss): 2016/09/23 22:02:13
 Elapsed run time:  0.005 Seconds

  Normal termination of simulation

```
In this example the output files are not stored to the host because there was no directory shared with the docker container. The generated output files would only be visibile within the container, and would be destroyed when the container process is terminated.
