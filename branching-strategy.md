# Branching Strategy

- **main** → Production-ready code  
- **develop** → Integration branch for features  
- **feature/** → Feature-specific branches  
- **hotfix/** → Urgent fixes directly branched from main  

## Workflow
1. Developer creates a `feature/` branch from `develop`.
2. Work is committed & pushed to the branch.
3. A Pull Request (PR) is created to merge into `develop`.
4. PR undergoes **Code Review**.
5. Once approved → Merge to `develop`.
6. Stable release → Merge `develop` → `main`.

