# How to run [GAP Benchmark Suite](https://github.com/sbeamer/gapbs) on [Scarab](https://github.com/hpsresearchgroup/scarab).

### Step 1: Configure the script.
Set the `scarab` and `checkpoint` varaibles inside the [run-gapbs.sh](./run-gapbs.sh) script. 

The `scarab` variable is the absolute path to your Scarab repository.

The `checkpoint` variable is the location you would like the checkpoints to end up in.

### Step 2: Checkout the Gap Benchmark Suite

First checkout the code for the Gap Benchmark Suite. You can do this by either
checking it out manually [here](https://github.com/sbeamer/gapbs) or by running
the following command to check it out a submodule to this repository.

Initialize the submodule:
```
git submodule update --init --recursive
```

or if you have already initialized the submodule and want to update it to a newer commit:
```
git submodule update --recursive
```

### Step 3: Apply patches to the Gap Benchmark Suite (Optional)

There is some code in the Gap Benchmark Suite that does not play nice with
Scarab. Although it is not necessary to remove this code, things may run more
smoothly if you do. Feel free to skip this step if you would rather keep the
code as is. 

Note: this patch also changes the GAP Makefile to compile SERIAL by default,
which is required for simulating with Scarab. 

To apply patch file:
```
cd gapbs
git apply --reject --whitespace=fix ../gapbs.patch
```

### Step 4: Build Gap Benchmark Suite

Build tested on g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44). 

```
cd gapbs
make clean
make -j SERIAL=1 > make.out     # SERIAL needed to produce single threaded code
```

### Step 5: Run Scarab checkpoint scripts

Make sure you set the variables in Step 1.

```
./run-gapbs.sh
```

