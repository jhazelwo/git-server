# jhazelwo/gitd

* Put your public key(s) in spool/authorized_keys
* `./container.sh build`
* `./container.sh ./run`
* `git remote add origin ssh://git@remote-host:2222/git/repo.git`

### Optional

* Use `-v` to map /git/repo.git to permanent storage on the Docker
host. See `$volumes` in `container.sh`
