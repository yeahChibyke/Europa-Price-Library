`uv sync`, `uv add moccasin` are failing with the following error:

```
    × No solution found when resolving dependencies:
    ╰─▶ Because mocassin was not found in the package registry and your project depends on mocassin, we
        can conclude that your project's requirements are unsatisfiable.
    help: If you want to add the package regardless of the failed resolution, provide the `--frozen` flag
            to skip locking and syncing.
```