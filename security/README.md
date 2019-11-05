### Using your keys for ssh
Instead of typing a username and password -- **use the keys!**  Here is an example of adding keys to the docker servers:
1. Copy your public key (private key remains on your computer) to the servers using `ssh-copy-id` where there is a `jonfen` user on each of the machines listed.
    ```bash
    $ ssh-copy-id jonfen@machinename_or_ip
    ```

2. Add the following to `~/.ssh/config` (create the file if it doesn't exist).
    ```bash
    Host friendlyname 
      Hostname machinename_or_ip
      IdentityFile ~/.ssh/id_ed25519
    ```

3. **Easily** connect to machinename_or_ip:
    ```bash
    $ ssh friendlyname 
    ```
