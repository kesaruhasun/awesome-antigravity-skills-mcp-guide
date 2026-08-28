# 📚 Complete Antigravity & Agent Skills Catalog

This catalog documents the entire inventory of agent skills, their specific triggers, capabilities, and upstream repositories.

---

## 📑 Table of Contents

- [1. Data Agent Kit (Google Cloud Platform)](#data-agent-kit)
- [2. Google DeepMind Science Skills](#deepmind-science)
- [3. Chrome DevTools & Modern Web](#modern-web)
- [4. Matt Pocock Engineering Skills](#matt-pocock-engineering)
- [5. Marketing & Growth Skills](#marketing--growth)
- [6. Flutter & Dart Suite](#flutter--dart)
- [7. Android Platform CLI](#android-platform)
- [8. Firebase Suite](#firebase-suite)
- [9. Gemini API & Antigravity SDK](#gemini--antigravity)

---

## Data Agent Kit

Built by Google for high-scale cloud data engineering, BigQuery data lakes, and orchestration.

| Skill | URL / Source | Purpose | Key Commands / Techniques |
| :--- | :--- | :--- | :--- |
| **`bigquery-sql`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | SQL query optimization & cost tuning | Partition pruning, clustering keys, avoiding `SELECT *`, window functions |
| **`bigquery-ai-ml`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | In-database ML & GenAI inference | `CREATE MODEL ... OPTIONS(model_type='ARIMA_PLUS')`, `ML.GENERATE_TEXT` |
| **`bigquery-bigframes`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | BigQuery DataFrames (pandas/sklearn API) | `import bigframes.pandas as bpd`, scalable dataframe operations on BQ |
| **`dataform-bigquery`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Dataform ELT transformations | `definitions/*.sqlx`, config blocks, dependency declarations |
| **`dbt-bigquery`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | dbt models for BigQuery | `dbt_project.yml`, Jinja macros, incremental schemas |
| **`gcp-spark`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Dataproc Spark jobs | BigLake Iceberg catalogs, Serverless batches, Spanner connector |
| **`gcp-dataflow`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Apache Beam pipelines on Dataflow | Flex Templates, Cloud Build integration, backpressure diagnostics |
| **`accidental-data-loss-prevention`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Critical irreversible action blocker | Intercepts `DROP TABLE`, `TRUNCATE`, `gsutil rm -r`, cloud deletions |
| **`building-data-apps`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | React + Vite / Streamlit dashboards | Gemini Data Analytics chat integration, charting with Recharts/Echarts |
| **`discovering-gcp-data-assets`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Data asset discovery | Dataplex search, BigLake catalog discovery, schema introspection |
| **`federate-lakehouse-catalog`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Lakehouse catalog federation | Databricks Unity Catalog, AWS Glue REST Catalogs to BigQuery |
| **`gcp-composer-troubleshooting`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Cloud Composer (Airflow) root cause analysis | DAG parse errors, worker crashes, task instance failure diagnosis |
| **`gcs-security-assessment`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Cloud Storage security auditing | SAIF posture review, IAM bindings audit, bucket public access checks |
| **`notebook-guidance`** | [GoogleCloudPlatform/data-agent-kit](https://github.com/GoogleCloudPlatform/data-agent-kit) | Jupyter Notebook data exploration | `%%bqsql` magics, clean visualization layout, structured analysis |

---

## DeepMind Science

Curated by Google DeepMind for computational biology, genomics, and chemistry.
* **Repository:** [google-deepmind/science-skills](https://github.com/google-deepmind/science-skills)
* **Skills.sh:** [skills.sh/google-deepmind/science-skills](https://skills.sh/google-deepmind/science-skills)

| Skill | URL / Source | Scientific Domain |
| :--- | :--- | :--- |
| **`alphafold_database_fetch_and_analyze`** | [AlphaFold Protein DB](https://alphafold.ebi.ac.uk/) | pLDDT confidence extraction, domain boundary identification, disorder assessment |
| **`alphagenome_single_variant_analysis`** | [AlphaGenome](https://deepmind.google/technologies/alphagenome/) | Non-coding variant impacts on RNA-seq, ChIP, DNASE, transcription factors |
| **`chembl_database`** | [ChEMBL API](https://www.ebi.ac.uk/chembl/) | Bioactive compounds, drug targets, $IC_{50}$, $K_i$, and SMILES search |
| **`pubchem_database`** | [NCBI PubChem](https://pubchem.ncbi.nlm.nih.gov/) | Compound properties, CID resolution, substructure matching |
| **`pubmed_database`** | [NCBI PubMed](https://pubmed.ncbi.nlm.nih.gov/) | PubMed / PMC BioC full-text retrieval, citation mapping, literature graphs |
| **`clinical_trials_database`** | [ClinicalTrials.gov](https://clinicaltrials.gov/) | Search trials by condition/NCT ID, patient recruitment matching |
| **`clinvar_database`** | [NCBI ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) | Clinical variant pathogenicity (Pathogenic, Likely Pathogenic, VUS, Benign) |
| **`dbsnp_database`** | [NCBI dbSNP](https://www.ncbi.nlm.nih.gov/snp/) | rsID coordinate mapping (GRCh38), allele frequencies |
| **`embl_ebi_ols`** | [EMBL-EBI OLS](https://www.ebi.ac.uk/ols4) | Biomedical ontology term lookup across 250+ ontologies (GO, DOID, HP) |
| **`encode_ccres_database`** | [ENCODE SCREEN](https://screen.encodeproject.org/) | Candidate cis-Regulatory Elements across human cell lines |
| **`ensembl_database`** | [Ensembl](https://www.ensembl.org/) | Gene/transcript ID translation, genomic sequences, VEP consequence analysis |
| **`foldseek_structural_search`** | [Foldseek](https://search.foldseek.com/) | 3D coordinate (.pdb/.cif) similarity search against PDB, AlphaFold, CATH |
| **`gnomad_database`** | [gnomAD](https://gnomad.broadinstitute.org/) | Allele frequency spectrum, gene constraint metrics (pLI, LOEUF) |
| **`gtex_database`** | [GTEx Portal](https://gtexportal.org/) | Quantitative RNA expression & eQTL mapping across 54 human tissues |
| **`human_protein_atlas_database`** | [Human Protein Atlas](https://www.proteinatlas.org/) | Tissue protein expression, spatial subcellular localization |
| **`interpro_database`** | [InterPro](https://www.ebi.ac.uk/interpro/) | Protein domains, families, and functional site annotations (Pfam/CDD) |
| **`jaspar_database`** | [JASPAR](https://jaspar.genereg.net/) | Transcription factor binding profiles (PFMs/PWMs) |
| **`literature_search_arxiv`** | [arXiv API](https://arxiv.org/) | Search physics, CS, AI, math preprints and download full PDFs/HTML |
| **`literature_search_biorxiv`** | [bioRxiv / medRxiv](https://www.biorxiv.org/) | Life science preprints, category filters, and DOI lookups |
| **`literature_search_europepmc`** | [Europe PMC](https://europepmc.org/) | Open-access full text XML, citations, and bibliographies |
| **`literature_search_openalex`** | [OpenAlex](https://openalex.org/) | Scholarly metadata, h-index, citations, funding institutions |
| **`ncbi_sequence_fetch`** | [NCBI Entrez](https://www.ncbi.nlm.nih.gov/) | Fetch FASTA nucleotides/proteins by accession or gene name |
| **`openfda_database`** | [openFDA](https://open.fda.gov/) | FDA adverse events, recalls, drug labels, 510(k) clearances |
| **`opentargets_database`** | [Open Targets](https://www.opentargets.org/) | Target-disease associations, drug tractability, genetic evidence |
| **`pdb_database`** | [RCSB PDB](https://www.rcsb.org/) | Experimentally-determined 3D biomolecular structures and ligands |
| **`predictingthepast`** | [DeepMind Ithaca](https://ithaca.deepmind.com/) | Ancient Latin (Aeneas) and Ancient Greek (Ithaca) text restoration & dating |
| **`protein_sequence_msa`** | [Clustal Omega](https://www.ebi.ac.uk/Tools/msa/clustalo/) | Multiple sequence alignments for conserved domain analysis |
| **`protein_sequence_similarity_search`** | [MMseqs2 / BLAST](https://github.com/soedinglab/MMseqs2) | Ultra-fast sequence homology matching |
| **`pubchem_database`** | [NCBI PubChem](https://pubchem.ncbi.nlm.nih.gov/) | Chemical properties, IUPAC names, bioassays |
| **`pymol`** | [PyMOL](https://pymol.org/) | High-resolution structural rendering, alignment, binding site analysis |
| **`quickgo_database`** | [QuickGO](https://www.ebi.ac.uk/QuickGO/) | Gene Ontology terms (Biological Process, Molecular Function, Cellular Component) |
| **`reactome_database`** | [Reactome](https://reactome.org/) | Biological pathway analysis, reaction mechanics, and pathway diagrams |
| **`string_database`** | [STRING DB](https://string-db.org/) | Protein-Protein Interaction (PPI) networks and enrichment |
| **`ucsc_conservation_and_tfbs`** | [UCSC Browser](https://genome.ucsc.edu/) | Evolutionary conservation (phyloP/phastCons) and TFBS tracks |
| **`unibind_database`** | [UniBind](https://unibind.uio.no/) | Experimentally-validated direct TF-DNA binding sites |
| **`uniprot_database`** | [UniProt](https://www.uniprot.org/) | UniProtKB sequences, functional features, isoforms |

---

## Modern Web

Official Google Chrome engineering tools for web development.
* **Modern Web Guidance:** [GoogleChrome/modern-web-guidance](https://github.com/GoogleChrome/modern-web-guidance)
* **DevTools MCP:** [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

| Skill | URL / Source | Description |
| :--- | :--- | :--- |
| **`modern-web-guidance`** | [GoogleChrome/modern-web-guidance](https://github.com/GoogleChrome/modern-web-guidance) | State-of-the-art web patterns: View Transitions, Popover API, CSS `:has()`, `:user-valid`, subgrid |
| **`chrome-devtools`** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Puppeteer-driven live browser automation, DOM inspection, and network tracing |
| **`a11y-debugging`** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Automated WCAG 2.2 accessibility audits, ARIA landmarks, focus management, color contrast |
| **`debug-optimize-lcp`** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Largest Contentful Paint (LCP) profiling, image priority hints (`fetchpriority="high"`) |
| **`memory-leak-debugging`** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Heap snapshot comparison, detached DOM trees, MemLab automated leak isolation |
| **`chrome-extensions`** | [GoogleChrome/modern-web-guidance](https://github.com/GoogleChrome/modern-web-guidance) | Manifest V3 standards: service worker lifecycles, declarativeNetRequest, secure side panels |

---

## Matt Pocock Engineering

Disciplined software engineering, architecture stress-testing, and TDD workflows.
* **Repository:** [mattpocock/skills](https://github.com/mattpocock/skills)
* **Author:** [Matt Pocock (AI Hero)](https://www.aihero.dev/)

| Skill | Description | Use Case |
| :--- | :--- | :--- |
| **`grilling`** | Stress-tests engineering designs and assumptions | Run before committing to a non-trivial architectural change |
| **`grill-me`** | Interactive interview aligning on requirements | Surfaces edge cases, failure modes, and data model decisions |
| **`tdd`** | Strict Red-Green-Refactor test cycle | Building clean, bug-free components with high test coverage |
| **`code-review`** | Two-axis parallel review (Spec vs. Standards) | Reviewing PRs across coding standards and original requirements |
| **`domain-modeling`** | Defines ubiquitous language & records ADRs | Writing `CONTEXT.md` and Architectural Decision Records |
| **`codebase-design`** | Deep module architecture principles | Seam placement, interface reduction, and testability |
| **`diagnosing-bugs`** | Systematic bug diagnosis protocol | Reproduces bugs, gathers evidence, and isolates root causes |
| **`to-spec` / `implement-spec`** | Converts ideas into structured specifications | Turns ambiguity into explicit engineering specs and code |
| **`git-guardrails-claude-code`** | Hooks blocking destructive git operations | Prevents accidental `push -f`, `reset --hard`, `branch -D` |
| **`wizard`** | Human-in-the-loop interactive bash scripts | Guiding users through manual portal setups, API keys, and migrations |
| **`setup-pre-commit`** | Configures Husky, lint-staged, Prettier | Automated pre-commit hooks for typechecks, formatting, and tests |
| **`migrate-to-shoehorn`** | TypeScript test data refactoring | Replaces fragile `as Type` assertions with `@total-typescript/shoehorn` |

---

## Marketing & Growth

50+ skills for technical marketers, solo founders, and engineers shipping products.
* **Repository:** [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)
* **Website:** [marketing-skills.com](https://marketing-skills.com)

- **SEO & Search Visibility:** `seo-audit`, `ai-seo` (Perplexity / SGE optimization), `programmatic-seo`, `schema` (JSON-LD), `site-architecture`.
- **Conversion & Copywriting:** `cro` (Conversion Rate Optimization), `copywriting`, `copy-editing`, `pricing`, `onboarding`, `paywalls`, `popups`.
- **Analytics & Experimentation:** `ab-testing`, `analytics`, `attribution`, `churn-prevention`, `customer-research`, `revops`.
- **Growth & Acquisition:** `cold-email`, `lead-magnets`, `directory-submissions`, `launch`, `product-marketing`, `referrals`, `social`.

---

## Flutter & Dart

Full lifecycle tooling for Flutter and Dart application engineering.

- **UI & Layout:** `flutter-apply-architecture-best-practices`, `flutter-build-responsive-layout`, `flutter-add-widget-preview`, `flutter-fix-layout-issues`.
- **Testing & Quality:** `flutter-add-widget-test`, `flutter-add-integration-test`, `dart-add-unit-test`, `dart-generate-test-mocks`, `dart-collect-coverage`, `dart-run-static-analysis`.
- **Interoperability & Native:** `dart-setup-ffi-assets`, `dart-use-ffigen`, `dart-build-cli-app`, `dart-resolve-package-conflicts`, `dart-fix-runtime-errors`.

---

## Firebase Suite

- **`firebase-firestore`:** Schema design, compound indexes, security rules.
- **`firebase-data-connect`:** Cloud SQL PostgreSQL backend with generated client SDKs.
- **`firebase-app-hosting-basics`:** Next.js / Angular SSR full-stack deployments.
- **`firebase-security-rules-auditor`:** Automated Firestore security vulnerability audit.
- **`firebase-ai-logic-basics`:** Gemini client SDK multimodal integration.

---

## Gemini & Antigravity

- **`google-antigravity-sdk`:** Python framework for multi-agent orchestration.
- **`gemini-interactions-api`:** Multi-turn conversational execution with tool calling.
- **`gemini-live-api-dev`:** WebSocket bidirectional voice/video streaming.
- **`gemini-omni-flash-api`:** Video synthesis and transitions.
- **`google_maps_platform`:** Maps JS, Places, Routes, 3D photorealistic tiles.
