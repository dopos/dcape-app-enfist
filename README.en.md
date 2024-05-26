<p align="center">
  <span>English</span> |
  <a href="README.md#readme">Pусский</a>
</p>

---

# enfist

> Core [dcape](https://github.com/dopos/dcape) application for config storage.

[![GitHub Release][1]][2] [![GitHub code size in bytes][3]]() [![GitHub license][4]][5]

[1]: https://img.shields.io/github/release/dopos/dcape-app-enfist.svg
[2]: https://github.com/dopos/dcape-app-enfist/releases
[3]: https://img.shields.io/github/languages/code-size/dopos/dcape-app-enfist.svg
[4]: https://img.shields.io/github/license/dopos/dcape-app-enfist.svg
[5]: LICENSE

 Dcape role | Service | Docker image
 --- | --- | ---
 config | [enfist](https://github.com/apisite/app-enfist) | [app-enfist](https://github.com/apisite/app-enfist/pkgs/container/app-enfist)

## Requirements

* linux 64bit with git, make, sed installed
* [docker](http://docker.io)
* [dcape](https://github.com/dopos/dcape) v3
* VCS service like [Gitea](https://gitea.io)
* CI/CD service like [Woodpecker CI](https://woodpecker-ci.org/)

## Install

### Via CI/CD

* VCS: Fork or mirror this repo in your Git service
* CI/CD: Activate repo
* VCS: "Test delivery", config sample will be saved to config service (enfist in dcape)
* Config: Edit config vars and remove .sample from config name
* VCS: "Test delivery" again (or Drone: "Restart") - app will be installed and started on CI/CD host
* After that just change source and do `git push` - app will be reinstalled and restarted on CI/CD host

### Via terminal

Run commands on deploy host with [dcape](https://github.com/dopos/dcape) installed:
```bash
git clone https://github.com/dopos/dcape-app-enfist.git
cd dcape-app-enfist
make config-if
... <edit .env.sample>
make up
```

## License

The MIT License (MIT), see [LICENSE](LICENSE).

Copyright (c) 2023-2024 Aleksei Kovrizhkin <lekovr+dopos@gmail.com>
