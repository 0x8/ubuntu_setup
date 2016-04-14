nullp0inter's ubuntu setup scripts
==================================



About
-----
I have set up this repo to house scripts to make changes to Ubuntu 16.04 based on my needs.
Being that I am currently toying around with a lot of binary, some of the things I have made this script do are:

Install radare2 from the github page,
Install peda from the github page,
Install python2 and python3,
Install pip, python requests
Install zsh - because it's sexy and we know that is important,
Install some stuff needed to make zsh's agnoster theme work (in the future it will auto switch but for now it is manual),

You can simply read the scripts first if you don't trust them. I don't guarantee it works with every version of Ubuntu however, as I am only really trying it out at all on 16.04 LTS (64-bit beta, x86). Feel free to add other scripts to do stuff for the Ubuntu configuration.

I will update this as I do more.

Installation:
-------------
Because you will pull this from here you must first install git
- `sudo apt-get install git`

Clone the directory 
- `git clone https://github.com/0x8/ubuntu_setup.git`

To run first do
- `chmod +x ubuntu_setup_part*`
then run
- `./ubuntu_setup_part1.sh`
and follow any prompts. Once it finishes (you should be in zsh at this point), run
- `./ubuntu_setup_part2.sh`

TIP: Remember that tab completion is your friend in bash


Current Known Issues:
---------------------
- Script had to be split into two parts. 
    - This is because part of the installation of oh-my-zsh changes the shell which interrupts the script execution.
- Fonts do not work properly in Ubuntu Server 16.04 beta
    - Whether this is due to graphics support issues in server, I'm unsure
- Script does not automatically change theme to agnoster
    - I believe fixing this requires some fancy sed stuff which I know nothing about at the moment so bear with me on this one. I'll try to fix it eventually.
- Does not include the following: ~~pwntools~~, capstone, ropgadget
    - For some reason pip is a royal bastard when it comes to trying to install these and every single one of them fails. Requests on the other hand is fine
    - **FIXED pwntools** it was related to a dependency issue due to 16.04 using python3. Script now installs some python2.7 stuff so pwntools will work. Remember to head pwntools scripts with `#!/usr/bin/env python2` instead of `#!/usr/bin/env python` because as I stated above, 16.04 uses python3 in which pwntools won't work.
