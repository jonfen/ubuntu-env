# my n00b notes for after [all the stuff is installed](https://raw.githubusercontent.com/jonfen/ubuntu-env/master/cryptocurrency.sh)

## Education ##

* [MIT Blockchain Course](https://executive.mit.edu/openenrollment/program/blockchain-technologies-business-innovation-and-application-self-paced-online/)
* [Udemy Crypto Trading Course](https://www.udemy.com/cryptocurrency-algorithmic-trading-the-revolution/)

## [Screen](http://aperiodic.net/screen/quick_reference) ##

Remote into computer and be able to resume a session
```
$ screen # Start screen for the first time
$ screen -ls
$ screen -x # Attach to an existing screen
```
* Create a new window: __Ctrl-a c__
* Show all windows: __Ctrl-a__ " 

## [Create ETH_WALLET](https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts) ##
**DO NOT FORGET THE PASSWORD YOU USE** -- password manager?
```
$ geth account new
$ geth account list
```
cp ~/.ethereum/keystore/* > password manager?
 
## [Pools](https://github.com/ethereum-mining/ethminer/blob/master/docs/POOL_EXAMPLES_ETH.md) ##
As opposed to solo mining, you can join a pool and trade a ~1% fee for a shared cut of distributed computing with others.  ethpool.org and ethermine.org seem to have the same interface, but different payout structures.  ethpool.org uses credits (https://ethpool.org/credits) which seem to be in favor of larger operations

### Pool: ethermine.org ###
```
$ ethminer -G -R -P stratum1+ssl://ETH_WALLET.WORKERNAME@us2.ethermine.org:5555
```
[Script to run ethminer as a daemon](https://gist.github.com/bmatthewshea/9a062c092fd673318f8d208ce44f4f51)

* status: https://ethermine.org/miners/ETH_WALLET/dashboard
* estimated earnings: https://ethermine.org/miners/ETH_WALLET/payouts
..* ethermine.org pays out once every 24 hours therefore the minimum payout should be close to what your miner produces in 24 hours
* settings: https://ethermine.org/miners/ETH_WALLET/settings
..* register your email, minimum payout amount and validate using your [public IP address](https://www.google.com/search?q=what+is+my+ip):

## Blockchain Nodes ##
You don't need your own node unless you are starting your own pool or solo mining.  However it is a good thing to do for the community.  Instead of creating a local node you can use a remote one sign up on bittrex and get a eth address from there.

```$ geth --rpc``` downloads a local node of the full ethereum blockchain, use: http://bc.daniel.net.nz/ to determine the necessary hard drive size.

## [Overclocking RX 570 on Ubuntu](http://centosquestions.com/overclocking-radeon-rx-570-ubuntu/) ##

* **VCLK** and **DCLK** are two **UVD** internal clocks.
* **SCLK** is the Engine clock, depends on the current power level.
* **MCLK** is the Memory clock, depends on the current power level.
* **VDDC** (mV) is the GPU core voltage
* **VDDCI** (mV) is the I/O bus voltage (between memory and GPU core) and comes from the PCI-Express slot.

Card Info
```
$ sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info
$ sudo cat /sys/kernel/debug/dri/1/amdgpu_pm_info
$ sudo cat /sys/kernel/debug/dri/2/amdgpu_pm_info
$ sudo cat /sys/kernel/debug/dri/3/amdgpu_pm_info
```

Engine Clock / Core Frequency (0 means no overclocking)
```
$ sudo cat /sys/class/drm/card0/device/pp_sclk_od
$ sudo cat /sys/class/drm/card1/device/pp_sclk_od
$ sudo cat /sys/class/drm/card2/device/pp_sclk_od
$ sudo cat /sys/class/drm/card3/device/pp_sclk_od
```

Overclock Core Frequency 5%
```
$ sudo -i
$ echo 5 | sudo tee > /sys/class/drm/card0/device/pp_sclk_od
$ echo 5 | sudo tee > /sys/class/drm/card1/device/pp_sclk_od
$ echo 5 | sudo tee > /sys/class/drm/card2/device/pp_sclk_od
$ echo 5 | sudo tee > /sys/class/drm/card3/device/pp_sclk_od
```

Memory Clock (0 means no overclocking)
```
$ sudo cat /sys/class/drm/card0/device/pp_mclk_od
$ sudo cat /sys/class/drm/card1/device/pp_mclk_od
$ sudo cat /sys/class/drm/card2/device/pp_mclk_od
$ sudo cat /sys/class/drm/card3/device/pp_mclk_od
```

Overclock Memory 5%
```
$ sudo -i
$ echo 5 | sudo tee > /sys/class/drm/card0/device/pp_mclk_od
$ echo 5 | sudo tee > /sys/class/drm/card1/device/pp_mclk_od
$ echo 5 | sudo tee > /sys/class/drm/card2/device/pp_mclk_od
$ echo 5 | sudo tee > /sys/class/drm/card3/device/pp_mclk_od
```

```
$ sudo cat /sys/class/drm/card0/device/pp_dpm_sclk
$ sudo cat /sys/class/drm/card1/device/pp_dpm_sclk
$ sudo cat /sys/class/drm/card2/device/pp_dpm_sclk
$ sudo cat /sys/class/drm/card3/device/pp_dpm_sclk
```
