# Eclipse kanto demo

Demo based on [presentation](https://www.youtube.com/watch?v=bMN_ZiUS3Bc).

## Prerequisites

1. Install Kanto as described [here](https://websites.eclipseprojects.io/kanto/docs/getting-started/install/)
2. Download tools and setup hono tenant, execute steps from this [instruction](https://websites.eclipseprojects.io/kanto/docs/getting-started/hono/), *save* used tenant for later.
3. Prepare link to download **Kuksa.val Server**
   1. `docker pull ghcr.io/eclipse/kuksa.val/kuksa-val:latest`
3. Prepare container with application from this [repository](https://github.com/boschglobal/kuksa.val/tree/kanto-kuksa-bridge/kuksa_apps/kanto) and make it available to your device
   1. You can download it from [registry.hub.docker.com/doodzio/local-kanto-demo:0.1.0](registry.hub.docker.com/doodzio/local-kanto-demo:0.1.0)
4. Create container of GPS Feeder from this [repository](https://github.com/eclipse/kuksa.val.feeders/tree/main/gps2val) and make it available to your device.
   1. You can download it from [registry.hub.docker.com/doodzio/local-kuksa-gps-feeder:0.1.0](registry.hub.docker.com/doodzio/local-kuksa-gps-feeder:0.1.0)

## Demo

We have Kanto running on our device, now we can use same or other PC to create container remotely on device.

If you want to run this part on other device, then execute steps from [this tutorial](https://websites.eclipseprojects.io/kanto/docs/getting-started/hono/#before-you-begin).

To remote execute operations on Kanto device we will use script `hono_create_with_config.py` that is based on script from [step two in previous section](#prerequisites). To execute commands, we have to know context of a device, namely its **tenant and device id**, you should have these values in `hono_provisioning.sh` script on your device.

Run containers 

Run Kuksa val
```bash

sudo kanto-cm create -n kuksa-val --mp "$HOME/kuksaval.config/:/config" --network host --e LOG_LEVEL=ALL --i --t ghcr.io/eclipse/kuksa.val/kuksa-val:master   
```

Run kuksa kanto
```bash
sudo kanto-cm create -n kuksa-kanto --network host --i --t registry.hub.docker.com/doodzio/local-kanto-demo:0.1.0
```

Run gps feeder

```bash
sudo kanto-cm create -n kuksa-gps-feeder --network host --mp "$HOME/kuksaval.config/:/config" --i --t registry.hub.docker.com/doodzio/local-kuksa-gps-feeder:0.1.0
```