# CLAUDE.md

## Project

**AI-BankApp-DevOps** — Spring Boot banking app used as a base for learning end-to-end DevOps.

## Repositories

- **Old (don't touch):** `https://github.com/LondheShubham153/Springboot-BankApp.git` (origin)
- **New:** `git@github.com:TrainWithShubham/AI-BankApp-DevOps.git` (new-origin)

## Branch Structure

| Branch | Purpose | Status |
|--------|---------|--------|
| `start` | Modernized app (backend + frontend, no Docker) | Done |
| `docker` | start + Dockerfile, multistage build, Compose, Ollama AI chatbot | Done |
| `main` | End-to-end DevOps (all phases combined) | Not started |

Each branch builds on the previous. See `ROADMAP.md` for the full checklist.

## Tech Stack

- Spring Boot 3.4.1, Java 21, MySQL 8.0
- Spring Security (BCrypt, form login, CSRF)
- Thymeleaf + Bootstrap 5 + glassmorphism dark/light UI
- Ollama (tinyllama) for AI chatbot — self-hosted, zero cost
- Actuator + Prometheus metrics endpoint

## Key Files

- `src/main/java/com/example/bankapp/` — model, repository, service, controller, config
- `src/main/resources/static/css/bankapp.css` — full design system with CSS vars
- `src/main/resources/static/js/theme.js` — dark/light toggle with localStorage
- `src/main/resources/templates/fragments/layout.html` — shared navbar, footer, head
- `application.properties` — DB config externalized via `${ENV_VAR:default}` pattern

## Conventions

- No Lombok — plain Java getters/setters
- Constructor injection everywhere (no `@Autowired` on fields)
- No `Co-Authored-By` in commits — user wants all commits to appear as theirs
- Don't push to `origin` (old repo) — only push to `new-origin`
- ROADMAP.md checkboxes track progress per phase/branch

## Docker

- Simple Dockerfile uses `sh -c 'java -jar target/*.jar'` (avoids hardcoded jar name)
- Multistage Dockerfile copies jar as `app.jar` in second stage
- docker-compose: MySQL (with healthcheck) + BankApp + Ollama
- After `docker compose up`, pull model: `docker exec bankapp-ollama ollama pull tinyllama`

## What's Next (from ROADMAP.md)

- Phase 3: CI/CD with GitHub Actions
- Phase 4: Kubernetes manifests
- Phase 5: Helm chart
- Phase 6: Terraform
- Phase 7: Monitoring (Prometheus + Grafana)
- Phase 8: GitOps (ArgoCD)
- Phase 9: Security scanning
- Phase 10: AI chatbot on K8s
- Phase 11: Production readiness
