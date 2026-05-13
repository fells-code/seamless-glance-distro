# Seamless Glance

**Seamless Glance** is a terminal-native AWS operations dashboard built for
fast triage, wasted-resource discovery, and precise operator pivots into the
AWS CLI and AWS Console.

It is optimized for the gap between:
**"Something looks wrong"** and **"We know exactly what to inspect next."**

---

## What It Does

Seamless Glance is a read-only Rust TUI for AWS environments. It helps teams:

- surface incidents, hygiene issues, and waste signals quickly
- understand account inventory without digging through multiple consoles
- jump directly to the right AWS Console page or CLI command
- inspect resource details in-terminal before leaving the workflow
- review cost and savings context without repeatedly hitting Cost Explorer

It does **not** replace the AWS Console or CLI.
It reduces the time to the **right** console page, command, or service view.

---

## Why Teams Use It

### Findings-first triage

The app now opens on **Findings** by default and prioritizes:

- incident signals
- wasted-resource signals
- hygiene risks

That makes the first screen actionable instead of passive inventory.

### Inventory with context

Account Overview is an inventory snapshot for the active AWS profile, including:

- account and identity context
- service footprint summaries
- service inventory counts across key AWS surfaces

### Fast operator pivots

From supported resources, engineers can:

- inspect a structured describe view in-app
- toggle to a JSON-oriented detail view
- generate and run AWS CLI commands
- open the exact AWS Console page
- prepare SSH commands for EC2 instances

### Cost and savings visibility

Seamless Glance includes:

- cached Cost Explorer-backed cost overview data
- forecast and budget gap context
- usage-aware service cost summaries
- a Cost Savings view that ties spend and waste signals together

---

## Current AWS Coverage

Seamless Glance currently includes first-class views for:

- Findings
- Account Overview
- Cost Overview
- Cost Savings
- EC2
- ECS
- Lambda
- RDS
- API Gateway
- Load Balancers
- Target Groups
- Security Groups
- SQS
- VPC
- Secrets Manager
- CloudWatch

Global aggregation currently exists for selected services, including EC2,
Lambda, and RDS.

---

## Current Findings Coverage

The current release includes findings such as:

- CloudWatch alarms in `ALARM`
- missing CloudWatch alarm coverage for deployed services
- stopped EC2 instances
- stopped EC2 instances with public IPs or production-like naming
- EC2 instances missing `Name`, `Owner`, or `Environment` tags
- low-CPU EC2 instances
- public security groups
- security groups exposing sensitive public ports
- target groups with zero healthy targets
- degraded target groups
- orphan target groups
- load balancers with no active target path
- load balancers with zero healthy targets
- SQS queues without DLQs
- SQS queues with high visible or in-flight messages
- RDS instances that are not `available`
- production-like single-AZ RDS instances
- Lambda functions with high memory sizing or stale deploy dates
- API Gateway APIs with generic names or long age
- secrets without rotation
- production-like secrets without rotation
- secrets with stale rotation
- default VPCs still present

---

## Trust And Security Model

Seamless Glance is designed for security-conscious environments.

- Runs entirely on the user’s machine
- No telemetry or analytics
- No background services
- No calls outside AWS APIs and operator-triggered browser opens
- Uses official AWS SDKs
- Uses the same credential resolution chain as the AWS CLI

Verification guidance:

https://seamlessglance.com/verify

---

## Installation

### macOS (Homebrew)

```bash
brew tap fells-code/seamless
brew install seamless-glance

# or directly
brew install fells-code/seamless/seamless-glance
```

Run with:

```bash
glance
```

`seamless-glance` also works.

### macOS and Linux (single binary)

```bash
curl -fsSL https://seamlessglance.com/install.sh | bash
```

---

## License And Trial

Seamless Glance includes a 365-day free trial for non-commercial use.

- No signup
- No network license checks
- Trial license generated locally on first run

Paid licenses are available at:

https://seamlessglance.com

The license file path is:

```text
~/.seamless-glance/license.json
```

Check license status with:

```bash
glance --license-status
```

---

## AWS Credentials

Seamless Glance uses the standard AWS SDK credential chain, including:

- `AWS_PROFILE`
- `~/.aws/credentials`
- `~/.aws/config`
- environment variables
- AWS SSO

Example:

```bash
export AWS_PROFILE=prod
glance
```

---

## Cost Data Behavior

- Cost Explorer data is cached locally for 24 hours
- No background polling
- No repeated billing queries on every screen refresh
- richer cost insight is reused by Cost Overview and Cost Savings

---

## Key Controls

### Navigation

- `f` Findings
- `/` command palette
- `Tab` / `Shift+Tab` cycle major views
- `1` Account Overview
- `2` Cost Overview
- `0` Cost Savings
- `3` VPC
- `4` EC2
- `5` CloudWatch
- `6` Lambda
- `7` Secrets Manager
- `8` ECS
- `9` API Gateway

### Actions

- `d` describe selected resource
- `v` toggle describe view between structured and JSON-oriented output
- `c` show AWS CLI command for selected resource
- `o` open selected resource in AWS Console
- `s` prepare SSH command for selected EC2 instance
- `w` toggle wrapped detail mode on supported text-heavy screens

### Movement

- `↑` / `↓` move selection or scroll
- `PgUp` / `PgDn` jump-scroll lists, overlays, help, or wrapped detail
- `Home` / `End` jump to top or bottom
- `←` / `→` switch region
- `g` jump to the synthetic global region slot
- `r` refresh active view
- `?` help
- `q` quit

---

## Who It Is For

Seamless Glance is built for:

- DevOps engineers
- platform engineers
- SREs
- consultants working across multiple AWS accounts
- engineers who want fast AWS context without living in the console

It is especially useful for:

- post-deploy triage
- incident response
- unfamiliar account review
- wasted-resource discovery
- cost follow-up and optimization

---

## License

Seamless Glance is commercial software.
A valid license, trial or paid, is required to run the application.

By using the software you agree to use it for its intended purpose and under the
uses described by the product documentation.

---

## Support And Issues

Please open issues or feature requests here:

https://github.com/fells-code/seamless-glance-distro/issues
