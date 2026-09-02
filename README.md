# TLSAssistant Testbed

The TLSAssistant Testbed is an open source tool for automatically configuring various vulnerable web servers. It is used to test the analysis modules of [TLSAssistant](https://github.com/stfbk/tlsassistant) against a wide range of known TLS vulnerabilities.

## Quick start

The easiest and recommended way to run the testbed is to use the pre-built Docker image published on GitHub Container Registry:

```bash
docker pull ghcr.io/stfbk/tlsassistant-testbed:v2.1.2
docker run -p 9000-9010:9000-9010 ghcr.io/stfbk/tlsassistant-testbed:v2.1.2
```

If you cannot use the released image, the next best option is to [build the Docker image locally](#2-build-the-docker-image-locally). Only [build and run on the host](#3-build-and-run-on-the-host) if Docker is not an option.

## Installation

### 1. Use the released Docker container (recommended)

Pull and run the latest released image from GitHub Container Registry:

```bash
docker pull ghcr.io/stfbk/tlsassistant-testbed:v2.1.2
docker run -p 9000-9010:9000-9010 ghcr.io/stfbk/tlsassistant-testbed:v2.1.2
```

### 2. Build the Docker image locally

If you prefer to build the image yourself, clone the repository and use the provided `Dockerfile` (which runs `prepare.sh` automatically during the build).

<details>
<summary>Docker build and run tutorial</summary>

Clone the repository:

```bash
git clone https://github.com/stfbk/tlsassistant-testbed && cd tlsassistant-testbed
```

Build the docker image:

```bash
docker build -t tlsassistant-testbed .
```

Run the docker image mapping all of the ports:

```bash
docker run -p 9000-9010:9000-9010 -t tlsassistant-testbed
```

</details>

### 3. Build and run on the host

#### One Liner

To run the code, execute the following command:
```bash
sudo apt update && sudo apt-get -y install git && git clone https://github.com/stfbk/tlsassistant-testbed && cd tlsassistant-testbed && chmod +x run.sh && sudo ./run.sh
```
---
#### Step by Step
If you want to download and install by executing every step:
<details>

<summary>Show single steps</summary>

0. Install git
```bash
sudo apt update && sudo apt-get -y install git
```
1. Download the tool by running
```bash
git clone https://github.com/stfbk/tlsassistant-testbed && cd tlsassistant-testbed
```
2. Allow execution for the files:
```bash
chmod +x prepare.sh run.sh
```
3. Build and prepare the web servers:
```bash
sudo ./prepare.sh
```
4. Execute the web servers:
```bash
sudo ./run.sh
```

</details>

## Features

<details>

<summary> Supported Vulnerabilities </summary> 

- 3SHAKE
- BEAST
- BREACH
- CCS Injection
- Certificate Transparency
- CRIME
- DROWN
- FREAK
- Heartbleed
- HSTS preloading
- HSTS set
- HTTPS enforced
- LOGJAM
- LUCKY13
- BAR MITZVAH
- RC4 NOMORE
- Perfect Forward Secrecy
- POODLE
- SSL RENEGOTIATION
- ROBOT
- SWEET32
  
<!-- ######### - ALPACA ######## --> 
<!-- ######### - RACCOON ####### --> 
<!-- ######### - SLOTH ######### --> 
<!-- ######### - TICKETBLEED ### -->

</details>

<details>
<summary> Ports configured </summary>

- port 9000 == DROWN, RC4 NOMORE, BAR MITZVAH, Secure Renegotiation Missing, Secure Client-Initiated Renegotiation
- port 9001 == SWEET32, LUCKY13, FREAK, LOGJAM
- port 9002 == DROWN, SWEET32, Secure Renegotiation Missing, Secure Client-Initiated Renegotiation
- port 9003 == BEAST, POODLE (SSL), SWEET32, FREAK, LOGJAM, LUCKY13
- port 9004 == FREAK, RC4 NOMORE, BAR MITZVAH, LOGJAM
- port 9005 == Heartbleed, CCS, FREAK, LOGJAM, RC4   
- port 9006 == ROBOT
- port 9007 == CRIME, BREACH, LUCKY13
- port 9008 == WIP
- port 9009 == configuration compliant with ACN guidelines recommended profile
- port 9010 == configuration compliant with ACN guidelines compatibility profile

</details>

<details>
<summary> Webservers </summary>

- nginx 1.9.0 with openssl 1.0.1u
- nginx 1.9.0 with openssl 1.0.1a with patched doc files
- nginx 1.24.0 with openssl 3.0.12
- DamnVulnerableOpenSSL (OpenSSL 1.0.2l) compiled into nginx 1.9.0
- Apache httpd 2.4.37 patched with apr-1.6.5, apr-util-1.6.1 and using openssl 1.0.2-stable

</details>

## License

```
Copyright 2026, Fondazione Bruno Kessler

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Developed within the [Security & Trust](https://st.fbk.eu/) research unit, part of the [Center for Cybersecurity](https://cs.fbk.eu/)  at [Fondazione Bruno Kessler](https://www.fbk.eu/en/) (Italy)
