# Seamless Glance

**Seamless Glance** is a fast, read-only terminal UI (TUI) for AWS that lets you
instantly _see_ your cloud infrastructure — without clicking through the AWS Console.

Think **“k9s for AWS”**.

---

## Features

- Account overview with **month-to-date spend**
- Visibility into:
  - EC2
  - ECS
  - Lambda
  - API Gateway (REST + HTTP)
  - SQS (DLQs, in-flight messages)
  - RDS
  - Load Balancers
  - VPCs & subnets
- Keyboard-driven navigation
- Command palette (`/ecs`, `/lambda`, `/vpc`, etc.)
- Region switching (`←` / `→`)
- Works with **read-only IAM roles**
- No telemetry, no background agents

---

## Installation

### macOS (recommended)

```bash
brew tap fellscode/seamless
brew install seamless-glance
```

### macOS & Linux (alternative)

```bash
curl -fsSL https://seamlessglance.com/install.sh | bash
```

---

## License Setup

Seamless Glance requires a valid license file.

1. Create the license directory:

```bash
mkdir -p ~/.seamless-glance
```

2. Place your license file at:

```text
~/.seamless-glance/license.json
```

3. Run the app:

```bash
seamless-glance
```

If the license is missing or invalid, the app will exit with a clear message.

---

## AWS Credentials

Seamless Glance uses the standard AWS credential chain:

- `AWS_PROFILE`
- `~/.aws/credentials`
- `~/.aws/config`
- Environment variables

Example:

```bash
export AWS_PROFILE=prod
seamless-glance
```

---

## Keyboard Shortcuts

| Key       | Action           |
| --------- | ---------------- |
| `1`       | Account Overview |
| `2`       | Cost View        |
| `3`       | ECS              |
| `4`       | Lambda           |
| `5`       | API Gateway      |
| `6`       | SQS              |
| `7`       | VPC              |
| `/`       | Command palette  |
| `←` / `→` | Switch region    |
| `?`       | Help             |
| `q`       | Quit             |

---

## Why Seamless Glance?

The AWS Console is powerful — but slow and noisy.

Seamless Glance is built for:

- DevOps engineers
- Platform engineers
- Cloud-heavy developers

It’s ideal for:

- Daily sanity checks
- Incident triage
- Cost awareness
- Navigating unfamiliar AWS accounts

---

## License

Seamless Glance is commercial software.
A valid license is required to run the application.

---

## Support & Issues

Please open issues or feature requests here:

https://github.com/fellscode/seamless-glance-distro/issues
