# pspace - Paperspace CLI (as of August 2024)

Packages releases from https://github.com/Paperspace/cli

```
$ docker run -it --rm docker.io/polymathrobotics/pspace:1.10.1
A CLI for using the Paperspace API.

It allows you to authenticate, launch deployments, do logging, and more.

* Deploy an ML app with the `deployment` command
* View a deployed app with the `deployment open` command
* Check the status of a deployment with the `deployment status` command

Read the full documentation at: https://docs.paperspace.com/

Usage
  pspace [command]
  pspace [flags]

Available Commands
  autoscaling-group  Manage your autoscaling groups
  completion         Generate an autocompletion script for the specified shell
  config             Manage your local Paperspace configuration.
  console            Open the Paperspace web console.
  custom-template    Manage your custom templates
  dataset            Manage your datasets
  deployment         Effortlessly deploy ML apps to Paperspace.
  docs               Open Paperspace documention in your default browser.
  help               Show help for a pspace command
  init               Create a new Paperspace app
  login              Log in to the CLI.
  logout             Log out of the CLI.
  machine            Manage your Paperspace machines
  machine-event      Manage your machine events
  model              Manage your Paperspace models
  os-template        List OS templates
  private-network    Manage your private networks
  project            Manage your Paperspace projects.
  public-ip          Manage your public IPs
  secret             Manage your Paperspace secrets
  shared-drive       Manage your shared drives
  signup             Sign up for a Paperspace account.
  snapshot           Manage your snapshots
  startup-script     Manage your startup scripts
  storage-provider   Manage your storage providers
  up                 Deploy your app to Paperspace
  upgrade            Upgrade pspace to the latest version.
  version            Show version information

Global Flags
      --api-key   string  A Paperspace public API Key used for authenticating requests
      --api-url   string  A URL for the Paperspace API.
  -h, --help              Show help for a command
  -j, --json              Output JSON
  -l, --log-level string  Enable debug logging

Use "pspace [command] --help" for more information about a command.
```
