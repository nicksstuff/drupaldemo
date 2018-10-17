# IBM Drupal Demo

![drupalé](https://h5p.org/sites/default/files/drupal-logo.png)

[Drupal](https://www.drupal.org/) is one of the most versatile open source content management systems on the market.

This chart deploys a demo Drupal environemnt to IBM Cloud Private (ICP) or IBM Kubernetes Service (IKS).


## TL;DR;

```console
$ helm install drupaldemo/drupal-demo
```

## Introduction

This chart bootstraps a [Drupal](https://github.com/bitnami/bitnami-docker-drupal) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [MariaDB chart](https://github.com/kubernetes/charts/tree/master/stable/mariadb) which is required for bootstrapping a MariaDB deployment as a database for the Drupal application.


## Prerequisites

- Kubernetes 1.4+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release drupaldemo/drupal-demo
```

The command deploys Drupal on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Drupal chart and their default values.

| Parameter                         | Description                                | Default                                                   |
| --------------------------------- | ------------------------------------------ | --------------------------------------------------------- |
| `drupalUsername`                  | User of the application                    | `admin`                                                    |
| `drupalPassword`                  | Application password                       | `admin`             |
| `drupalEmail`                     | Admin email                                | `user@example.com`                                        |
|
| `web.ingress.postfix`       | Ingress will be the name of the deployment & postfix                     | `demo.ibm.com`                                                     |
| `web.ingress.security`       | Deploy Calico config to segregate DB and Web App                     | `true`                                                     |
|
| `db.name`                 | Database name to create                    | `drupal & the relsae name`                                          |
| `db.user`                 | Database user to create                    | `db_user`                                               |
| `db.password`             | Password for the database                  | `passw0rd`            |
| `db.replicas`             | Number of Slave replicas                 | `2`            |
| `db.rootUser.password`       | MariaDB admin password                     | `passw0rd`                                                     |
| `db.replication.password`             | Replication password              | `passw0rd`            |
|
| `image.registry`                  | Drupal image registry                      | `docker.io`                                               |
| `image.drupalrepository`                | Drupal Image name                          | `bitnami/drupal`                                          |
| `image.drupaltag`                       | Drupal Image tag                           | `8.6.1-debian-9`                                               |
| `image.dbrepository`                | MariaDB Image name                          | `bitnami/mariadb`                                          |
| `image.dbtag`                       | MariaDB Image tag                           | `10.1.36-debian-9`                                               |
| `image.pullPolicy`                | Drupal image pull policy                   | `Always` if `imageTag` is `latest`, else `IfNotPresent`   |
| `image.pullSecrets`                | Pull Secret for registry if needed                   | empty   |
|
| `persistence.enabled`                  | Create Persistent Volume Claims in order to persist data                     | `false`                                               |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set drupalUsername=admin,drupalPassword=password,db.rootUser.password=secretpassword \
    drupaldemo/drupal-demo
```

The above command sets the Drupal administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml drupaldemo/drupal-demo
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Image

The `image` parameter allows specifying which image will be pulled for the chart.

### Private registry

If you configure the `image` value to one in a private registry, you will need to [specify an image pull secret](https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod).

1. Manually create image pull secret(s) in the namespace. See [this YAML example reference](https://kubernetes.io/docs/concepts/containers/images/#creating-a-secret-with-a-docker-config). Consult your image registry's documentation about getting the appropriate secret.
1. Note that the `imagePullSecrets` configuration value cannot currently be passed to helm using the `--set` parameter, so you must supply these using a `values.yaml` file, such as:

```yaml
imagePullSecrets:
  - name: SECRET_NAME
```

1. Install the chart

```console
helm install --name my-release -f values.yaml drupaldemo/drupal-demo
```

