## Notes on Usage

This definition contains 2 containers, one for Node.js and one for EdgeDB. You will be connected to the Node.js container, and can use the EdgeDB CLI in the Node.js container (installed via the [edgedb-cli feature](https://github.com/joshuanianji/devcontainer-features/tree/main/src/edgedb-cli)) to connect to the instance in the EdgeDB container. The password for the edgedb server is `secret`.

```bash
edgedb instance link edgedb-docker --trust-tls-cert --host=edgedb --port=5656 --password

# Select the defaults when prompted, and type in the password `secret` when prompted
```

You should now be have the `edgedb-docker` instance connected. You can list the instances with the following command:

```bash
edgedb instance list

# Output
┌────────┬───────────────┬─────────────┬─────────────┬────────┐
│ Kind   │ Name          │ Location    │ Version     │ Status │
├────────┼───────────────┼─────────────┼─────────────┼────────┤
│ remote │ edgedb-docker │ edgedb:5656 │ 4.5+ce8e127 │ up     │
└────────┴───────────────┴─────────────┴─────────────┴────────┘
```

## EdgeDB UI

The EdgeDB Container sets the environment variable `EDGEDB_SERVER_ADMIN_UI=enabled`, so you can run the integrated UI. To access the UI, run the following command:

```bash
edgedb ui --print-url --no-server-check
```

This should print out a URL that you can open in your browser, something like [http://localhost:5656/ui](http://localhost:5656/ui). The default credentials are:

Username: `edgedb`

Password: `secret` (same as `EDGEDB_SERVER_PASSWORD`)
