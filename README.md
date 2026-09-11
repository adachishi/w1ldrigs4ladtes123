# WildRig -> GHCR -> Salad

1. Create a public GitHub repository, e.g. `wildrig-salad`.
2. Upload this folder's contents while preserving `.github/workflows/docker.yml`.
3. Commit to the `main` branch.
4. Open the repository's **Actions** tab and wait for **Build WildRig image** to finish.
5. The image will be:
   `ghcr.io/YOUR_USERNAME/YOUR_REPO:latest`
6. In GitHub package settings, make the package public if Salad needs anonymous pull access.
7. In Salad, set the container image to the GHCR image above.

Because WildRig is the image ENTRYPOINT, the Salad command/arguments can be:

`--algo pearlhash --url POOL_HOST:PORT --user WALLET.WORKER --pass x`

Do not put your wallet or pool credentials directly into the Dockerfile.

To update WildRig later, edit `WILDRIG_VERSION` in
`.github/workflows/docker.yml`, commit, and GitHub Actions will rebuild it.
