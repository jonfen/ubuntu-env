# my n00b notes for after [all the stuff is installed](https://raw.githubusercontent.com/jonfen/ubuntu-env/master/cryptocurrency.sh)

## Education ##

* [MIT Blockchain Course](https://executive.mit.edu/openenrollment/program/blockchain-technologies-business-innovation-and-application-self-paced-online/)
* [Udemy Crypto Trading Course](https://www.udemy.com/cryptocurrency-algorithmic-trading-the-revolution/)

### Basics ###

This is how I would explain it to a non-technical person.

**What is cryptocurrency?**

We don't know all the prime numbers, at best we only know [the last one that people found](https://en.wikipedia.org/wiki/Largest_known_prime_number), thanks to the combined efforts of people across the internet.  Think of cryptocurrency mining in the same way; where people with computers who don't know each other work together solving math problems on the internet which might yield the next piece of digital gold, like Bitcoin (BTC) or Ethereum (ETH).

**Is it worth anything?**

Sadly, Gold is just a rock, and like your car, your education, your stocks, or the piece(s) of paper in your wallet -- all these commodities have a *preceived value*.  Simply put, something is worth $5 only when someone else is willing to pay $5 for it.  That same thing is only worth $4 if that is the most someone will buy it for.  Or if it is rare, and multiple people want it, the highest bidder might drive the price to $6.

Everything is subject to inflation, deflation and the laws of supply and demand.  Cryptocurrency is no different.  These different forms of electronic currency have, or don't have, value based on the number of people who agree on its value.   

**What the hell is it?**

If you go to the bank and ask to see the specific paper money you deposited there -- they might think you are crazy.  The money you gave to the bank was converted into a promise, an agreement that the bank will give you that same amount of money back when you decide to withdraw it.  What does the bank get out of the deal?  They can invest your money while you aren't using it and keep the interest.

For simplicity's sake, imagine if there was only one bank in the world, and it had a public record/ledger of every deposit and withdrawl ever made by everyone in the history of money.  Because it was a public record, you can imagine that people would want to keep an up to date personal copy to (1) prove they deposited money, (2) to verify if someone else has money, and (3) [mutually assured destruction](https://en.wikipedia.org/wiki/Mutual_assured_destruction).  This long ledger is called a blockchain.  Everytime new cryptocurrency is found, it is added to someone's account in the blockchain.  Everytime cryptocurrency is exchanged for goods, services, or withdrawn -- it is transferred to someone else's account in the blockchain.  New crypto currency can only be mined, and a transfer can only be initiated by the seller, which makes it impossible to fake.

**How do you mine cryptocurrency?**

Groups of people digging for digital gold are called Mining Pools (see below) and they trade their processing power (CPU, GPU, FPGA, and/or ASIC) in exchange for a percentage, the administrator(s) of the mining pool usually take a percentage, aka fee, too.

The pool keeps a tab for each miner based on their geth account key (ETH WALLET) and when someone's tab hits a certain amount.  

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
