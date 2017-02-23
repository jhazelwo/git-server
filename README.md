# A simple 1 repo git server

### Remote server:

* Put your public key(s) in `spool/authorized_keys`
* `./container.sh build`
* `./container.sh run`
    * (optional) Use `-v` to map `/git/repo.git/` to permanent storage on
    the Docker host. See `$volumes` in `container.sh`

### Workstation:

* `git remote add origin ssh://git@remote-server:2222/git/repo.git`
