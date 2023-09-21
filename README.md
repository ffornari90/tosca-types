# INDIGO TOSCA types

The repository shows a YAML description of new types added in the INDIGO project to extend TOSCA Simple Profile in YAML Version 1.0 to add high level entities.

## How to contribute

- Clone the repo

    ```bash
    git clone https://baltig.infn.it/infn-cloud/tosca-types.git
    cd tosca-types
    git config --local include.path ../.gitconfig
    ```

- Create a development branch and checkout

    ```bash
    git checkout <branch-name>
    ```

- Implement your changes and then push them to remote repo:

   ```bash
    git add .
    git commit -m "Your detailed description of your changes."
    git push
   ```

- Create a merge request after having tested thoroughly

   ```bash
   git tosca-mr 'Merge Request Title'
   ```

    The title **must** follow the ESLint convention:

    _Tag: Short description (fixes #1234)_

    The _Tag_ is one of the following:

    * Fix - for a bug fix.
    * Update - either for a backwards-compatible enhancement or for a rule change that adds reported problems.
    * New - implemented a new feature.
    * Breaking - for a backwards-incompatible enhancement or feature.

