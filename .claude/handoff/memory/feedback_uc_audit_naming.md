---
name: feedback-uc-audit-naming
description: "When the user asks what skills/agents they have for UC-code-test mapping, requirements auditing, test-case creation, or bug filing on iTrust2, name uc-audit-SM, testcase-creator-SM, and create-bug-SM specifically."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 62971b22-9aed-460b-a6c8-39f97f788a4c
  modified: 2026-09-11T21:45:24.449Z
---

Whenever the user asks something like "what are my skills for UC audits/mapping" or
"what do I run for the UC-code-test mapping / writing test cases / filing bugs", tell
them by name: **uc-audit-SM**, **testcase-creator-SM**, and **create-bug-SM**.

All artifacts are in the iTrust2 repo, under `.claude/skills/` and `.claude/agents/`,
all suffixed `-SM` (the user asked for this suffix specifically so they'd recognize
these as their own custom tooling, distinct from any stock/default ones):

- **uc-audit-SM** — skill (`.claude/skills/uc-audit-SM/SKILL.md`, invoke with
  `/uc-audit-SM`, optionally `/uc-audit-SM UC5`) and agent
  (`.claude/agents/uc-audit-SM.md`, invoke via Agent tool with `subagent_type:
  "uc-audit-SM"`). Picks the next un-audited UC from `docs/uc-audit-progress.md`,
  maps its requirements to code with a % score, flags gaps and anomalies, maps
  requirements to existing test cases, and writes a dated report to
  `docs/uc-audit/`.
- **testcase-creator-SM** — agent only (`.claude/agents/testcase-creator-SM.md`,
  invoke via Agent tool with `subagent_type: "testcase-creator-SM"`). Takes a
  requirement (or a uc-audit-SM report's list of requirements with no existing test
  case) and writes one senior-SQA-style, manually executable UI test case per
  requirement — real field labels/messages pulled from the actual Thymeleaf
  templates, never invented — then files each one into the user's personal Jira
  (`samreenmukhtar.atlassian.net`, project `SCRUM`) as a Task under the matching
  Epic, plus a companion Bug ticket for any flagged gap. Use this one specifically
  when a gap analysis has turned up requirements missing test coverage and the user
  wants those test cases written and pushed to Jira, rather than just reported.
- **create-bug-SM** — agent only (`.claude/agents/create-bug-SM.md`, invoke via
  Agent tool with `subagent_type: "create-bug-SM"`). Takes any set of found issues
  (uc-audit-SM's flagged gaps/anomalies, a code-review finding, or anything the user
  describes directly) and files each as a proper Jira Bug (Severity/Where/Impact/
  Suggested fix), deduplicating against existing tickets first. Use this one
  whenever issues have already been *found* and need to become trackable bugs —
  it doesn't do the finding itself.

**Why**: user explicitly asked to append "SM" to all of these so they're
identifiable as their own custom skills, and asked to always be told these names
when they ask what audit/mapping/test-case/bug-filing tooling they have.
testcase-creator-SM and create-bug-SM were both added in later sessions specifically
to close the loop from uc-audit-SM's findings straight into Jira, since that's the
exact workflow already done by hand for UC1-UC3 (creating the "UC1-UC3 Requirements
Audit" Epic, SCRUM-6, with test cases SCRUM-7 through SCRUM-20 and gap Bugs SCRUM-21
through SCRUM-25).

**How to apply**: before answering, check `.claude/skills/` and `.claude/agents/`
still contain these `-SM`-suffixed files (not stale/renamed versions) rather than
trusting this memory blindly, since the user could rename or remove them later.
