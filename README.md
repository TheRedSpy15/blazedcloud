# blazedcloud

![logo](https://github.com/TheRedSpy15/blazedcloud/blob/development/assets/icon-192.png)

[![Flutter](https://github.com/TheRedSpy15/blazedcloud/actions/workflows/flutter.yml/badge.svg)](https://github.com/TheRedSpy15/blazedcloud/actions/workflows/flutter.yml)

![Alt](https://repobeats.axiom.co/api/embed/ed8f2fa1e7b0d3aa5e3ef7d1c174533ef59e32e3.svg "Repobeats analytics image")

## TLDR

Simple, minimalistic file backup provider built with Flutter, Pocketbase and S3 compatible APIs

### Other Blazed Cloud Repos:
- [Web Portal](https://github.com/TheRedSpy15/blazedcloud-web)
- [Landing](https://github.com/TheRedSpy15/blazedcloud-landing)
- Desktop (nearly finished)

# Overview
### What is Blazed Cloud?

Blazed Cloud aims to be a privacy friendly Google Drive, and be simpler to use.

- **Free Tier:** 5 GB
- **Encryption:** 256-bit
- **Max Storage:** 1 Terabyte (for now)

### This Repository Specifically

This repository is for the mobile application to access Blazed Cloud. It's designed with Flutter and is currently only on Android. Once it's a bit more feature complete it'll go on IOS. This is to focus on developing the core features, before testing and adapting the code to work on both platforms

This mobile client has all it's basic features completed. However the following are still in development:
- [ ] Automatic Camera uploads
- [ ] Automatic folder syncing
- [ ] Files can be downloaded for offline use, but no current in-app viewing
- [ ] Oauth Sign in

**Completed Features outside of core functions**
- [x] App locking with biometrics
- [x] Timed file sharing via urls

# Download

Releases are also available directly via GitHub

[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="100">](https://f-droid.org/packages/com.chancesoftwarellc.blazedcloud/)
[<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png"
     alt="Get it on Google Play"
     height="100">](https://play.google.com/store/apps/details?id=com.chancesoftwarellc.blazedcloud)

**F-DROID NOTE**

Only the Play Store variant allows upgrading your subscription to the terabyte plan. This is to simplify the billing setup for the service and reduce points of failure, as we use [Glassfy](https://glassfy.io/) to handle billing code. This also brings the benefit of keeping Google's Play billing libraries out of the app for F-Droid users. However, you will need to temporaily use the Play store version if you wish to subscribe to the premium service. After which you can uninstall it in favor of the F-Droid variant

# Contributing

The project is always open to pull requests. However, pleae note that all changes must first go through the development branch before they are merged into main

## Translations

This is honestly going to be the easiest and most popular way to contribute. You can fork this repository and modify the [ARB files for a specific language](https://github.com/TheRedSpy15/blazedcloud/tree/main/lib/l10n) then create a pull request. We currently are relying on ChatGPT for translations so any suggestions from actual native speakers is an upgrade

## Contributors

<a href="https://github.com/theredspy15/blazedcloud/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=theredspy15/blazedcloud" />
</a>
