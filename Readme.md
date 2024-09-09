<h1 align="center">
K8s Resource Monitor ☸
<a href="https://www.producthunt.com/posts/awesome-github-profiles?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-awesome-github-profiles" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=277987&theme=light" alt="Kubernetes Resource Monitor" style="width: 200px; height: 44px;" width="200" height="44" /></a>
</h1>
<div align="center">

<img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg" alt="Awesome Badge"/>
<a href="https://arbeitnow.com/?utm_source=awesome-github-profile-readme"><img src="https://img.shields.io/static/v1?label=&labelColor=505050&message=arbeitnow&color=%230076D6&style=flat&logo=google-chrome&logoColor=%230076D6" alt="website"/></a>
<!-- <img src="http://hits.dwyl.com/shramish2057/awesome-github-profile-readme.svg" alt="Hits Badge"/> -->
<img src="https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99" alt="Star Badge"/>
<a href="https://discord.gg/XTW52Kt"><img src="https://img.shields.io/discord/733027681184251937.svg?style=flat&label=Join%20Community&color=7289DA" alt="Join Community Badge"/></a>
<a href="https://twitter.com/shramish2057" ><img src="https://img.shields.io/twitter/follow/shramish2057.svg?style=social" /> </a>
<br>

<i>Monitor the Kubernetes resources your way !</i>

<a href="https://github.com/shramish2057/awesome-github-profile-readme/stargazers"><img src="https://img.shields.io/github/stars/shramish2057/awesome-github-profile-readme" alt="Stars Badge"/></a>
<a href="https://github.com/shramish2057/awesome-github-profile-readme/network/members"><img src="https://img.shields.io/github/forks/shramish2057/awesome-github-profile-readme" alt="Forks Badge"/></a>
<a href="https://github.com/shramish2057/awesome-github-profile-readme/pulls"><img src="https://img.shields.io/github/issues-pr/shramish2057/awesome-github-profile-readme" alt="Pull Requests Badge"/></a>
<a href="https://github.com/shramish2057/awesome-github-profile-readme/issues"><img src="https://img.shields.io/github/issues/shramish2057/awesome-github-profile-readme" alt="Issues Badge"/></a>
<a href="https://github.com/shramish2057/awesome-github-profile-readme/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/shramish2057/awesome-github-profile-readme?color=2b9348"></a>
<a href="https://github.com/shramish2057/awesome-github-profile-readme/blob/master/LICENSE"><img src="https://img.shields.io/github/license/shramish2057/awesome-github-profile-readme?color=2b9348" alt="License Badge"/></a>

<img alt="K8s Resource Monitor Readme" src="assets/agpr.gif"> </img>

<i>Loved the project? Please consider [donating](https://paypal.me/shramishkafle) to help it improve!</i>

</div>

# Kubernetes Resource Monitor CLI

A CLI tool for monitoring and managing Kubernetes resources. This tool provides real-time monitoring, auto-scaling recommendations, resource trend visualization, and alerting functionality.

## Features

- Monitor real-time resource usage (CPU and Memory) of pods in a Kubernetes namespace.
- Provide auto-scaling recommendations based on custom policies.
- Visualize resource usage trends for a specific pod.
- Configure Horizontal Pod Autoscalers (HPA) based on resource usage.
- Set up alerts for high resource usage via email and Slack.

## Prerequisites

- Python 3.7+
- Kubernetes cluster and `kubectl` configured
- [Kubernetes Metrics Server](https://github.com/kubernetes-sigs/metrics-server) installed on your cluster
- Basic knowledge of Kubernetes pods and deployments

## Setup Instructions

### 2. Create a Virtual Environment

```bash
python3 -m venv .venv
source .venv/bin/activate  # On Windows use: .venv\Scripts\activate

```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Set Up Kubernetes Configuration
Ensure your Kubernetes cluster is configured and accessible. You should be able to run kubectl get pods from your terminal.

### 5. Initialize the Database
The tool uses SQLite for storing historical resource usage data. You can initialize the database by running the monitoring command (explained below).

## Commands and Usage

### 1. Monitor Resource Usage
Monitor real-time CPU and memory usage for pods in a specific namespace.

```bash
python3 -m k8s_monitor.cli monitor --namespace <namespace-name>
```
#### Options:

- `--namespace`: Kubernetes namespace to monitor (default: `default`).
- `--use-mock`: Use mock data instead of real Kubernetes cluster data.

#### Example:


```bash
python3 -m k8s_monitor.cli monitor --namespace default
```

### 2. Auto-Scale Pods
Provide auto-scaling recommendations based on custom policies for a Kubernetes namespace.

```bash
python3 -m k8s_monitor.cli auto-scale --namespace <namespace-name>
```
#### Options:

- `--namespace`: Kubernetes namespace to monitor (default: `default`).
- `--use-mock`: Use mock data instead of real Kubernetes cluster data.
Example:

```bash
python3 -m k8s_monitor.cli auto-scale --namespace default
```

### 3. Visualize Resource Trends
Visualize CPU and memory usage trends for a specific pod over a specified time period.

```bash
python3 -m k8s_monitor.cli visualize-trends --namespace <namespace-name> --pod-name <pod-name> --duration <time-in-minutes>
```
#### Options:

- `--namespace`: Kubernetes namespace to monitor (default: `default`).
- `--pod-name`: The name of the pod to visualize trends for.
- `--duration`: Time duration (in minutes) for historical data (default: 60 minutes).

#### Example:

```bash
python3 -m k8s_monitor.cli visualize-trends --namespace default --pod-name nginx-pod --duration 60
```

### 4. Configure Alerts
Send email alerts independently of monitoring. You must configure email settings before running this command.

```bash
python3 -m k8s_monitor.cli email-alert --email-host <host> --email-port <port> --sender-email <sender-email> --sender-password <password> --recipient-email <recipient-email> --subject <subject> --message <message>
```
#### Options:

- `--email-host`: SMTP host for sending alerts.
- `--email-port`: SMTP port for sending alerts.
- `--sender-email`: Sender email address.
- `--sender-password`: Sender email password.
- `--recipient-email`: Recipient email address.
- `--subject`: Subject of the email alert.
- `--message`: Message content for the email alert.

#### Example:

```bash
python3 -m k8s_monitor.cli email-alert --email-host smtp.example.com --email-port 587 --sender-email sender@example.com --sender-password password --recipient-email recipient@example.com --subject "Alert: High CPU Usage" --message "The CPU usage for pod nginx-pod is above the threshold."
```

### 5. Set Configuration
Configure the monitoring tool to send alerts via Slack or email.

```bash
python3 -m k8s_monitor.cli set-config --slack-webhook-url <url> --email-host <host> --email-port <port> --sender-email <email> --sender-password <password> --recipient-email <email>
```
#### Options:

- `--slack-webhook-url`: Slack Webhook URL for sending alerts.
- `--email-host`: SMTP host for sending email alerts.
- `--email-port`: SMTP port for sending email alerts.
- `--sender-email`: Sender email address.
- `--sender-password`: Sender email password.
- `--recipient-email`: Recipient email address.

#### Example:

```bash
python3 -m k8s_monitor.cli set-config --slack-webhook-url https://hooks.slack.com/services/ABC123 --email-host smtp.example.com --email-port 587 --sender-email sender@example.com --sender-password password --recipient-email recipient@example.com
```

### 6. View and Reset Configuration
You can view or reset the current configuration using the following commands:

#### View current configuration:
```bash
python3 -m k8s_monitor.cli view-config
```
Reset the configuration:
```bash
python3 -m k8s_monitor.cli reset-config
```

### 7. Set Auto-Scaling Policy
Set or update the auto-scaling policy for your Kubernetes cluster. This will be used to make scaling recommendations.

```bash
python3 -m k8s_monitor.cli set-autoscaling-policy --cpu-threshold <cpu-percentage> --memory-threshold <memory-percentage> --max-replicas-change <replicas> --scaling-strategy <static|dynamic>
```
#### Options:

- `--cpu-threshold`: CPU usage threshold for auto-scaling (in percentage).
- `--memory-threshold`: Memory usage threshold for auto-scaling (in percentage).
- `--max-replicas-change`: Maximum number of replicas to scale up or down.
- `--scaling-strategy`: Scaling strategy (static or dynamic).

#### Example:

```bash
python3 -m k8s_monitor.cli set-autoscaling-policy --cpu-threshold 80 --memory-threshold 75 --max-replicas-change 5 --scaling-strategy dynamic
```

### 8. Set Namespaces
Set or update the namespaces that should be monitored.

```bash
python3 -m k8s_monitor.cli set-namespaces --namespaces <namespace1> <namespace2>
```
#### Options:

- `--namespaces`: List of namespaces to monitor.

#### Example:

```bash
python3 -m k8s_monitor.cli set-namespaces --namespaces default production
```

### 9. View and Reset Namespaces
You can view or reset the monitored namespaces:

#### View current namespaces:
```bash
python3 -m k8s_monitor.cli view-namespaces
```

Reset namespaces to default:
```bash
python3 -m k8s_monitor.cli reset-namespaces
```

## Contribution
Feel free to submit issues and pull requests to enhance the tool further.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.