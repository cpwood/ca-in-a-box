# CA-in-a-Box

Makes managing your own Root Certificate Authority (CA) really easy using Docker. No need to learn OpenSSL commands; gives you results in minutes.

> Intended for limited development and test usage by developers and testers. Do _not_ use to create enterprise-wide certificates as no CRL capability is provided.

Based on scripts originally written by [zablik](https://github.com/zablik/ssl_cert_generator).

## Setup

Firstly, create a `docker-compose.yml` file, for example:

```yaml
version: "3.9"
services:
  certs:
    image: cpwood/ca-in-a-box
    volumes:
      - "/path/on/my/machine/to/certs:/certs"
    environment:
      - CERT_COUNTRY=GB
      - CERT_STATE=Lancashire
      - CERT_LOCALITY=Wigan
      - CERT_ORG=My Company Limited
      - CA_COMMON_NAME=My Company Limited Root CA
      - PFX_PASSWORD=foobar
```

## Generating the Root CA Certificate

To create a 20-year Root CA, issue the following command:

```
docker-compose run certs ./root_ca.sh
```

This will create a certificate file named `rootCA.crt` in `/path/on/my/machine/to/certs/root`. The certificate should be trusted on computers within the scope of your deployment. Alternatively, use the `rootCA.pfx` file which will use the password specified by the `PFX_PASSWORD` environment variable.

## Generating a Domain Certificate

To create a 1-year wildcard certificate for a domain, issue the following command:

```
docker-compose run certs ./domain.sh foo.bar
```

This will create a certificate file named `foo.bar.crt` (for domains `foo.bar` and `*.foo.bar`) in `/path/on/my/machine/to/certs/foo.bar`. This certificate should be used by your web server, for example.