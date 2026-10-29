---
name: project-itrust2-local-run
description: "How iTrust2-v8 was made runnable locally (portable JDK11 + MariaDB, pom fix, launcher) and where the work lives in git"
metadata:
  node_type: memory
  type: project
  originSessionId: 82a20711-520e-4ff7-beb0-1c5938566587
  modified: 2026-10-29T12:05:00.241Z
---

On 2026-10-29 iTrust2-v8 was brought up locally so the user could see the UI behind the QA agents ([[feedback-uc-audit-naming]]) and Jira tickets ([[reference-itrust2-jira]]).

- Runtime (no admin): Temurin JDK 11 + MariaDB 10.11.10 zips extracted to `%USERPROFILE%\itrust2-runtime`; DB data dir `itrust2-runtime\data`, root with empty password, port 3306. Start DB: `mariadbd.exe --defaults-file=...\data\my.ini`.
- `iTrust2/src/main/resources/application.yml` copied from the template (gitignored); DB `iTrust2_test`.
- pom.xml parent `2.3.7.BUILD-SNAPSHOT` no longer resolves -> changed to `2.3.7.RELEASE`.
- `.claude/run-itrust2.cmd` + `.claude/launch.json` (preview name `itrust2`). cmd needs `.\mvnw.cmd` because NoDefaultCurrentDirectoryInExePath is set.
- App: http://localhost:8080/iTrust2 — click Generate Users; logins admin/hcp/er/patient, all password 123456.
- Git: fork remote = samreenmukhtar/iTrust2. Run setup on branch `claude/itrust2-ui-access-b74fc7`; agents/skill on branch `fix/readme-typos`.
- v8 implements only ~half the UCs in docs/UC*.md.

**Why:** User is moving to a new computer and wants Claude to pick up where it left off.
**How to apply:** On a new machine, clone the fork, check out both branches, redo the portable runtime, and restore memories from `.claude/handoff/memory/`.
