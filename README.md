# Devcontainer Templates

[![Tests](https://github.com/joshuanianji/devcontainer-templates/actions/workflows/test-pr.yaml/badge.svg)](https://github.com/joshuanianji/devcontainer-templates/actions/workflows/test-pr.yaml)

A collection of my custom [Dev Container Templates](https://containers.dev/implementors/templates), following the [Dev Container Template distribution specification](https://containers.dev/implementors/templates-distribution/).

## Features

| Feature                                                 | Description                                                                                                                                                              |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [idris2](./src/idris2/)                                 | Develop Idris2 Applications                                                                                                                                              |
| [javascript-node-edgedb](./src/javascript-node-edgedb/) | Develop applications in Node.js and EdgeDB, a next-generation graph-relational database. Includes Node.js, eslint, and yarn in a container linked to an EdgeDB Container |
| [rust-edgedb](./src/rust-edgedb/)                       | Develop applications with Rust and EdgeDB, a next-generation graph-relational database. Includes a Rust application container linked to an EdgeDB Container              |

## Testing and Development

To test a template locally, you can use `./test.sh`

```bash
./test.sh javascript-node-edgedb
```
s