# Chrome Headless

## To run (without seccomp):
`docker run -d -p 9222:9222 --cap-add=SYS_ADMIN art4003/chrome-headless`

## To run a better way (with seccomp):
`docker run -d -p 9222:9222 --security-opt seccomp=$HOME/chrome.json art4003/chrome-headless`

## Using In DevTools
Open Chrome and browse to `http://localhost:9222/`.

## Information on Chrome headless

* [Getting Started with Chrome Headless](https://developers.google.com/web/updates/2017/04/headless-chrome)
* [Chromium tracker](https://bugs.chromium.org/p/chromium/issues/list?q=label:Proj-Headless)
* [Headless Chromium README](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md)
* [headless-dev mailing list](https://groups.google.com/a/chromium.org/forum/#!forum/headless-dev)

## General Use
`docker run -d -p 9222:9222 art4003/chrome-headless`

## Using In DevTools
Open Chrome and browse to `http://localhost:9222/`.

# Known issues

## Unsafe Scripts
You may have to _Load unsafe scripts_ from the omnibox shield icon to allow connecting to the insecure websocket endpoint `ws://localhost:9222`:

![image](https://cloud.githubusercontent.com/assets/39191/21593324/b3e92618-d0ca-11e6-9472-d07b9b9df2c9.png)

## Red herrings
Depending on the current build, if you run the container interactively you may see things like this on the console:
```sh
[0501/162901.033074:WARNING:audio_manager.cc(295)] Multiple instances of AudioManager detected
[0501/162901.033169:WARNING:audio_manager.cc(254)] Multiple instances of AudioManager detected
```
In most cases, these messages can be safely ignored. They will sometimes change and eventually as things are updated in the source tree, resolved.

## Building and Pushing

To build, `./build.sh <tag>`, for example `./build.sh art4003/chrome-headless:20231002-chromium`

To push, `./build.sh <tag>`, for example `./push.sh art4003/chrome-headless:20231002-chromium`. This will push both amd64 and arm64 images.

# Compatibility

This image was updated to chromium to support the new M1 processors. If you prefer keep using the previous chrome version, feel free to use the [:chrome tag](https://hub.docker.com/layers/183734006/isholgueras/chrome-headless/20210922-chrome/images/sha256-4d46c60494d5d34e542fa68b46bf8b1fe8c5653bf45025260d4b7cc582d0ee49)
