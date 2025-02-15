## SSH Key
- Go to [https://github.com/settings/keys](https://github.com/settings/keys)
- Open git bash
- ssh-keygen -t ed25519 -C "fireknights318@gmail.com"
- clip < ~/.ssh/id_ed25519.pub

## GPG Key
- Open git bash
- `gpg --full-generate-key`
- `gpg --list-secret-keys --keyid-format=long`
- From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this example, the GPG key ID is 3AA5C34371567BD2:
```
$ gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot <hubot@example.com>
ssb   4096R/4BB6D45482678BE3 2016-03-10
```
- gpg --armor --export KEY_ID
