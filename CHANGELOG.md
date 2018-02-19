# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Guiding Principles
* Changelogs are for humans, not machines.
* There should be an entry for every single version.
* The same types of changes should be grouped.
* Versions and sections should be linkable.
* The latest version comes first.
* The release date of each versions is displayed.
* Mention whether you follow Semantic Versioning.

## Types of changes
* **Added** for new features.
* **Changed** for changes in existing functionality.
* **Deprecated** for soon-to-be removed features.
* **Removed** for now removed features.
* **Fixed** for any bug fixes.
* **Security** in case of vulnerabilities.

## [Unreleased]

## [0.1.2] - 2018-02-19
### Changed
- ASG with ELB: update reference to proper version Autoscaling Group module

## [0.1.1] - 2018-02-15
### Added
- ASG with ELB: Add variables for pass through to ASG module
- ASG: Documentation on how to use the module (README)
- ASG with ELB: Documentation on how to use the module (README)

## [0.1.0] - 2018-01-24
### Changed
- ASG: Variable ingress rules for ASG security group
- ASG with ELB: Variable ingress rules for ELB security group

## [0.0.9] - 2018-01-23
### Removed
- ASG with ELB: Removed unused variables

## [0.0.8] - 2018-01-23
### Added
- ASG with ELB: Accept variable number of listeners

## [0.0.7] - 2018-01-23
### Added
- output zone_id for dns record creation

## [0.0.6] - 2018-01-16
### Fixed
- Fix proper variable type for multiple SGs

## [0.0.5] - 2018-01-16
### Added
- Add ELB outputs (arn, dns_name and name)

## [0.0.4] - 2018-01-19
### Changed
- update source to github source

## [0.0.3] - 2018-01-18
### Added
- Renamed autoscalig_group resource instance_profile to generic name

## [0.0.2] - 2018-01-17
### Added
- This CHANGELOG file to allow for versioning in the modules
- README for module project

## 0.0.1 - 2018-01-17
Starting tag

[Unreleased]: https://github.com/albumprinter/payments-tf-modules/compare/v0.1.2...HEAD
[0.1.2]: https://github.com/albumprinter/payments-tf-modules/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/albumprinter/payments-tf-modules/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.9...v0.1.0
[0.0.9]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.8...v0.0.9
[0.0.8]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/albumprinter/payments-tf-modules/compare/v0.0.1...v0.0.2