# hm-tools

Dieses Addon funktioniert nur mit **RaspberryMatic**.

Unterstützte Architekturen:

- ARM 32 Bit (`armv6l`, `armv7l`, `armv8l`)
- ARM 64 Bit (`aarch64` / `arm64`)
- x86 (`i386` bis `i686`, `x86_64` / `amd64`)

## Raspberry Pi 5 und Compute Module 5

Raspberry Pi 5 und Compute Module 5 werden unterstützt. Beide Plattformen verwenden mit RaspberryMatic den 64-Bit-ARM-Pfad `aarch64`.

Die Installation erkennt die Architektur über `uname -m`. Unbekannte Architekturen werden nicht mehr stillschweigend als ARM behandelt, sondern mit einer Fehlermeldung abgebrochen. Das verhindert die Installation eines falschen Binärpakets.

Getestete bzw. vorgesehene Raspberry-Pi-Familien:

- Raspberry Pi 2
- Raspberry Pi 3
- Raspberry Pi 4 / Compute Module 4
- Raspberry Pi 5 / Compute Module 5

Außerdem bleibt die x86-Variante für entsprechende RaspberryMatic-Installationen erhalten.

## Unterstützte CCU-Modelle

- [RaspberryMatic](https://github.com/OpenCCU/OpenCCU)

## Beschreibung

Dieses Addon erweitert RaspberryMatic um Konsolen-Programme, die im Standard-System nicht enthalten sind.

### Enthaltene Konsolen-Tools

- midnight commander 4.8.29
- nano 7.2
- htop 3.2.2
- bash 5.2.15
- imagemagick 6.9.11-60 (aarch64; private runtime)
- sshpass 1.09
- oathtoolkit 2.6.7
- iostat / sysstat 12.6.1

### Hinweis

Dieses Addon schreibt nicht in den schreibgeschützten Bereich des Dateisystems.

Nach der Installation ist ein Neustart erforderlich.

### Ihr braucht nicht alle Pakete

Siehe `Anleitung Paketauswahl.txt`.

### Anmerkung zu mc

Wenn der Midnight Commander unter PuTTY die Ränder nicht als Linien, sondern als Buchstaben darstellt, muss unter

`Windows -> Translation -> Remote character set`

`ISO-8859-1-1998 (Latin-1, West Europe)`

eingestellt und die Session anschließend gespeichert werden.

## Licenses

All binaries are compiled from the buildroot system source code.
The source code of the compiled binaries was not modified.

The source code of the binaries is subject to the following licenses:

| Package | License |
| --- | --- |
| mc | GNU General Public License |
| expect | Public Domain |
| nano | GNU General Public License |
| htop | GNU General Public License |
| bash | GNU General Public License |
| imagemagick | GNU General Public License |
| sshpass | GNU General Public License |
| oathtool | GNU General Public License |
| iostat | GNU General Public License |

### Ursprung

2020 Frank Hettrich

Pi-5/CM5-Anpassungen im Fork von WolfHenk.

### RaspberryMatic / OpenCCU

- https://github.com/OpenCCU/OpenCCU

Ich hafte nicht für Schäden, die an Hard- oder Software durch die Verwendung dieses Addons entstehen.
Verwendung des Addons auf eigene Gefahr.

I'm not responsible for any hardware or software damage.
Use this addon at your own risk.

### Raspberry Pi 5 / Compute Module 5 (aarch64)

Version 0.8.1 updates the aarch64 runtime for 16 KiB page-size kernels used by current OpenCCU/RaspberryMatic on Raspberry Pi 5 and Compute Module 5. The bundled ELF binaries and private runtime libraries use 64 KiB segment alignment. Midnight Commander, nano, htop, bash, sshpass, oathtool, iostat and ImageMagick were tested on a Compute Module 5 running OpenCCU 3.89.11.20260919. The aarch64 ImageMagick runtime is based on Debian 12 ImageMagick 6.9.11-60 and is isolated from the OpenCCU system libraries.
