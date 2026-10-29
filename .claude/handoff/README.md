# Handoff: continuing iTrust2 work on a new computer

Paste this to Claude on the new machine:

> Read `.claude/handoff/README.md` and restore my memory from `.claude/handoff/memory/`, then set up iTrust2 to run like before.

## Where things live
| What | Where |
|---|---|
| Agents `uc-audit-SM`, `testcase-creator-SM`, `create-bug-SM` + `uc-audit-SM` skill, UC1–3 tests, audit docs | branch `fix/readme-typos` on github.com/samreenmukhtar/iTrust2 |
| Run setup (pom fix, `.claude/run-itrust2.cmd`, `.claude/launch.json`), this handoff | branch `claude/itrust2-ui-access-b74fc7` |
| Jira | project SCRUM, https://samreenmukhtar.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog — watch SCRUM-20 (TC-UC2-08, blocked) and SCRUM-21 (bug: 10-min session timeout missing) |
| Claude memory snapshot | `.claude/handoff/memory/` → copy into `~/.claude/projects/<project-folder>/memory/` |

## Running iTrust2 (no admin rights needed)
1. Download Temurin JDK 11 zip and MariaDB 10.11 winx64 zip; extract to `%USERPROFILE%\itrust2-runtime`.
2. `mariadb-install-db.exe --datadir=%USERPROFILE%\itrust2-runtime\data --port=3306`, then start `mariadbd.exe --defaults-file=%USERPROFILE%\itrust2-runtime\data\my.ini` (root, empty password).
3. Copy `iTrust2/src/main/resources/application.yml.template` to `application.yml`.
4. Run `.claude\run-itrust2.cmd` (first build ~5–15 min for downloads). If the JDK folder name differs, update it in that script.
5. Open http://localhost:8080/iTrust2, click **Generate Users**. Logins: `admin`, `hcp`, `er`, `patient` — password `123456`.
