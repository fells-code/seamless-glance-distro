# Seamless Glance distribution

This repository holds the original `install.sh` for
[Seamless Glance](https://github.com/fells-code/seamless-glance), a
terminal-native, read-only dashboard for AWS, and the early `v0.x` and `v1.0.0`
release binaries.

Releases are now published from
[fells-code/seamless-glance](https://github.com/fells-code/seamless-glance/releases),
which is also where the source, the full documentation and the issue tracker
live. Start there.

## Install

Homebrew (macOS, Linux):

```bash
brew install fells-code/seamless/seamless-glance
```

Installer script (macOS, Linux), latest release:

```bash
curl -fsSL https://raw.githubusercontent.com/fells-code/seamless-glance/main/install.sh | bash
```

Pin a version with `SEAMLESS_GLANCE_VERSION=1.2.3`. Windows, Cargo and every
other option are in the
[Seamless Glance README](https://github.com/fells-code/seamless-glance#installation).

The `install.sh` in this repository is kept identical to that installer, so
existing links to it keep working and install the latest release.

## Verifying what you install

- Homebrew checks every download against the SHA-256 pinned in the
  [tap formula](https://github.com/fells-code/homebrew-seamless/blob/main/Formula/seamless-glance.rb)
  and refuses to install a binary that does not match.
- The installer script downloads the `SHA256SUMS.txt` published with the
  release and refuses to install unless the binary matches its entry.
- For a manual download, compare the binary's checksum with the
  `SHA256SUMS.txt` attached to the same release, for example
  `shasum -a 256 seamless-glance-1.3.0-aarch64-apple-darwin`.

## License

Seamless Glance is free and open source under the
[Apache License, Version 2.0](https://github.com/fells-code/seamless-glance/blob/main/LICENSE).
There is no trial and no license key. This repository is licensed under
Apache-2.0 as well, see [LICENSE](LICENSE).

## Issues

Report bugs and feature requests on
[fells-code/seamless-glance](https://github.com/fells-code/seamless-glance/issues).
