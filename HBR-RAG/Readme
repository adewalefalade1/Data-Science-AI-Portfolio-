RAG Document Assistant — Q&A over a PDF
A Retrieval-Augmented Generation (RAG) application that answers natural-language
questions about a PDF document by retrieving the most relevant passages and using a
large language model to compose grounded answers. Demonstrated here on a business
article about organisational design.
Type: Applied AI / GenAI · Stack: Python, LangChain, OpenAI (embeddings + GPT-4o), ChromaDB
---
What It Does
Instead of reading a long document to find an answer, a user asks a question in
plain English. The system finds the passages most relevant to the question and feeds
them to the model as context, so the answer is grounded in the source rather than the
model's general memory — which reduces hallucination and keeps answers on-topic.
How It Works (pipeline)
Load — the PDF is loaded with `PyPDFLoader`.
Chunk — text is split with `RecursiveCharacterTextSplitter` (chunk size 1000, overlap 200) so passages stay coherent.
Embed — each chunk is converted to a vector with OpenAI embeddings.
Store — vectors are indexed in a ChromaDB vector store.
Retrieve — for each question, the top 3 most similar chunks are pulled by semantic similarity.
Generate — the retrieved context plus the question are sent to GPT-4o, which writes a grounded answer.
What It Demonstrates
End-to-end RAG with LangChain: loading, chunking, embedding, vector storage, retrieval and generation.
Practical prompt/context construction and semantic search over a real document.
Verifiable answers — the system correctly answered factual questions about the source (e.g. authorship and the document's core arguments) drawn only from the indexed text.
Notes
This is a self-authored learning/prototype build. API keys have been removed; set
your own `OPENAI_API_KEY` to run it.
The demo document is a copyrighted article and is not included in this
repository; point the loader at any PDF of your own to reproduce the pipeline.
---
Author: Adewale Adeyinka Falade.
