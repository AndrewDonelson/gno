# Gno

At first, there was Bitcoin, out of entropy soup of the greater All.
Then, there was Ethereum, which was created in the likeness of Bitcoin,
but made Turing complete.

Among these were Tendermint and Cosmos to engineer robust PoS and IBC.
Then came Gno upon Cosmos and there spring forth Gnoland,
simulated by the Gnomes of the Greater Resistance.

## Getting Started

Also, see the [quickstart guide](https://test2.gno.land/r/boards:testboard/5).

### Build `gnokey`, create your account, and interact with Gno.

`gnokey` is a tool for managing https://gno.land accounts and interact with instances.

NOTE: Where you see `--remote gno.land:36657` here, that flag can be replaced
with `--remote localhost:26657` for local testnets.

#### Build/Install

```bash
git clone git@github.com:gnolang/gno.git
cd ./gno
make install
```

#### Generate a seed/mnemonic code.

```bash
./build/gnokey generate
```

NOTE: You can generate 24 words with any good bip39 generator.

#### Create a new account using your mnemonic.

```bash
./build/gnokey add --recover KEYNAME
```

NOTE: `KEYNAME` is your key identifier, and should be changed. think of it as a name for an account or wallet. You will be prompted to enter your mnemonic.

#### Verify that you can see your account locally.

```bash
./build/gnokey list
```

## Language Features

 * Like interpreted Go, but more ambitious.
 * Completely deterministic, for complete accountability.
 * Transactional persistence across data realms.
 * Designed for concurrent blockchain smart contracts systems.

## Contact

 * Discord: https://discord.gg/YFtMjWwUN7 <-- join now
 * Gnoland: https://gno.land/r/demo/boards:testboard
 * Telegram: https://t.me/gnoland
 * Twitter: https://twitter.com/_gnoland
