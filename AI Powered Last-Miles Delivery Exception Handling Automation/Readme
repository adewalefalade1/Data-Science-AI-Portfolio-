AI-Powered Last-Mile Delivery Exception Handling (Multi-Agent System)
An agentic system that automatically triages last-mile delivery exceptions — failed
attempts, wrong addresses, missed deliveries — decides how to resolve each one,
drafts the customer message, and escalates when it should. Built as a multi-agent
LangGraph workflow with critic/reflection loops and evaluated against a labelled
ground-truth set.
Type: Applied AI / Agentic AI · Stack: Python, LangGraph, LangChain, OpenAI (GPT-4o), SQLite
---
What It Does
Delivery operations generate a stream of exception events. For each one the system
reads the delivery log, checks the customer's profile and entitlements, consults a
resolution playbook and escalation rules, and produces (a) a resolution decision and
(b) a customer-ready message in the right tone — or escalates to a human when the
case warrants it.
Architecture — multi-agent graph with self-critique
The workflow is a LangGraph state machine with seven nodes:
Preprocessor — cleans the event stream (de-duplicates scans, filters "noise" such as normal DELIVERED events) so the agents only work on genuine exceptions.
Orchestrator — routes each case and decides what needs to happen.
Resolution agent — proposes a resolution using the tools.
Resolution critic — reviews the proposal and sends it back for revision if it's weak (a reflection loop).
Communication agent — drafts the customer message.
Communication critic — checks tone and correctness, looping back if needed.
Finalize — emits the final structured decision and message.
Tools (5)
`read_delivery_logs`, `lookup_customer_profile`, `check_locker_availability`,
`search_playbook` (retrieval over a resolution playbook), and `check_escalation_rules`.
Evaluation (a key strength)
The agent was scored against a ground-truth dataset, checking exception
identification, resolution correctness, tone, escalation accuracy and tool-call
accuracy. Sample run results show the pipeline passing these checks with a clean
node-by-node trajectory and guardrail behaviour (e.g. correctly skipping tool calls
on non-exception events).
Responsible-AI Design
Guardrails filter noise and prevent unnecessary actions on normal deliveries.
Escalation rules route the right cases to humans instead of auto-resolving.
Self-critique loops catch weak resolutions and off-tone messages before they go out.
Notes
Self-authored prototype. The customer database, delivery logs, ground-truth set and
playbook used in development were synthetic course data and are not included;
the notebook shows the full multi-agent design, tools and evaluation logic. API key
removed — set your own `OPENAI_API_KEY` to run.
---
Author: Adewale Adeyinka Falade.
