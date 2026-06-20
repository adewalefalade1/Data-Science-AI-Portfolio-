AI-Powered EHR Assistant (Safety-Gated LangGraph Agent)
A patient-facing assistant that helps people understand their own health records —
lab results, medications, visit summaries — in plain language, while refusing to do
anything clinically unsafe. Built as an agent that reasons over electronic health
record (EHR) data using tools, with a safety policy layer in front of every request.
Type: Applied AI / Agentic AI · Stack: Python, LangGraph, LangChain, OpenAI (GPT-4o / GPT-4o-mini), SQLite
---
What It Does
A patient can ask things like "what does my last A1c result mean?" or "what is this
medication for?" The agent retrieves the relevant records, explains them in plain
language at the patient's literacy level, and cites trusted health sources — but it
will not diagnose, change medications, or calculate doses, and it escalates
emergencies.
Architecture
The agent is a LangGraph state machine with four nodes:
Policy — every request is first routed through a safety policy that decides whether to answer, refuse, or escalate.
Agent — an LLM (GPT-4o) with bound tools decides which tools to call.
Tool — executes the selected tool(s) against the data layer.
Final — composes the plain-language, cited response.
Conditional edges route between these nodes based on the policy decision and whether
the agent still needs tools.
Tools (11)
EHR retrieval: patient profile, encounters, recent clinical note, notes for an encounter, labs, medications, allergies.
Patient education: plain-language lab explanations, medication education, trusted-source lookup.
Safety: a `policy_route` tool that classifies the request.
Responsible-AI Design (the differentiator)
Refuses unsafe requests — diagnosis, starting/stopping/changing medication, dose calculations.
Escalates red-flag symptoms — chest pain, stroke signs, severe breathlessness, suicidal thoughts — to emergency guidance.
Answers only education-type questions (explaining a lab, a visit, general health info).
Grounded & cited: answers cite a curated allowlist of trusted sources (e.g. MedlinePlus/NIH, CDC, NHS, Mayo Clinic), not the open web.
Notes
Self-authored prototype. The patient database and reference tables used in
development were synthetic course data and are not included here; the notebook
shows the full agent design and tool logic. Set your own `OPENAI_API_KEY` to run.
---
Author: Adewale Adeyinka Falade.
