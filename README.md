# Seamless Glance

**Seamless Glance** is a read-only terminal tool that helps engineering teams
quickly **triage, understand, and navigate cloud infrastructure** after changes,
deployments, or incidents.

It is designed to reduce the time between:
**“Something changed”** and **“We know where to look.”**

Think of it as a **guided operational view of a cloud infrastructure**, optimized for fast decision
making rather than configuration.

---

## What Seamless Glance Does

Modern AWS environments change constantly through Terraform, CI/CD pipelines,
and automated scaling. When something goes wrong, teams often lose time
answering basic questions:

- Is the account healthy?
- What resources look suspicious or misconfigured?
- Where should we investigate first?
- Which console page or CLI command actually matters?

Seamless Glance provides **immediate, high-signal answers** to those questions
without forcing engineers to click through dozens of AWS Console pages or
manually chain CLI commands.

It does **not** replace a cloud console or CLI.
It helps teams **get to the right place faster**.

---

## Why Teams Use Seamless Glance

### Faster triage after changes

After a Terraform apply or deployment, Seamless Glance helps teams immediately
see:

- Unhealthy target groups
- Misaligned load balancers
- Blocked security groups
- Stopped or unreachable instances

This shortens the gap between deployment and diagnosis.

### Clear operational visibility

The tool highlights:

- Health issues before inventory
- Risk before configuration
- Context before detail

Engineers spend less time hunting and more time fixing.

### Guided investigation, not automation

From any resource, engineers can:

- Inspect full AWS SDK-backed details
- Jump directly to the exact AWS Console page
- Pivot into SSH or CLI workflows when needed

Seamless Glance **guides action** without taking control.

---

## Supported AWS Services

Seamless Glance currently supports high-impact infrastructure surfaces commonly
involved in outages and post-deploy debugging:

- EC2
- ECS
- Lambda
- RDS
- API Gateway (REST and HTTP)
- Load Balancers
- Target Groups
- Security Groups
- SQS (including DLQs)
- VPCs and subnets
- Secrets Manager
- CloudWatch alarms

More services are added with a focus on **triage value**, not breadth.

---

## Trust and Security Model

Seamless Glance is built for environments with strict security requirements.

- Runs entirely on the user’s machine
- No telemetry, analytics, or usage reporting
- No background services
- No network calls outside AWS APIs
- Uses the official AWS SDKs only
- Uses the same credential resolution chain as the AWS CLI

Teams can independently verify its network behavior.

Documentation:
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

The seamless-glance command also works.

---

### macOS and Linux (single binary)

```bash
curl -fsSL https://seamlessglance.com/install.sh | bash
```

---

## License and Trial

Seamless Glance includes a 365-day free trial for non-commerical use.

- No signup
- No network checks
- Trial license generated locally on first run

Pro licenses can be purchased at https://seamlessglance.com

After purchase, place your license file at:

```
~/.seamless-glance/license.json
```

Check license status at any time:

```bash
glance --license-status
```

---

## AWS Credentials

Seamless Glance uses the same credential resolution chain as the AWS CLI:

- AWS_PROFILE
- ~/.aws/credentials
- ~/.aws/config
- Environment variables
- AWS SSO

Example:

```bash
export AWS_PROFILE=prod
glance
```

---

## Cost Data Behavior

- Cost Explorer data is fetched at most once every 24 hours
- Results are cached locally
- No background polling
- No repeated billable calls

---

## Inspecting Network Traffic

Seamless Glance communicates only with your cloud service endpoints.

If you want to verify this yourself, see:

https://seamlessglance.com/verify

That page walks through inspecting traffic using tcpdump, Wireshark, HTTPS
proxies, and AWS SDK debug logging.

---

## Keyboard Shortcuts

| Key           | Action                       |
| ------------- | ---------------------------- |
| Up or Down    | Move cursor                  |
| d             | Describe selected resource   |
| o             | Open resource in AWS Console |
| r             | Refresh current view         |
| /             | Command palette              |
| Left or Right | Switch region                |
| ?             | Help                         |
| q             | Quit                         |

---

## Who This Is For

Seamless Glance is built for:

- DevOps engineers
- Platform engineers
- SREs
- Consultants working across multiple AWS accounts
- Engineers who want fast context without console fatigue

It is especially useful for:

- Daily sanity checks
- Incident response
- Auditing unfamiliar AWS accounts
- Explaining account state during calls or screen shares

---

## License

Seamless Glance is commercial software.
A valid license, trial or paid, is required to run the application.

By using the software you agree to use it in the purpose it was intended and under the uses it was described.

---

## Support and Issues

Please open issues or feature requests here:

https://github.com/fells-code/seamless-glance-distro/issues
