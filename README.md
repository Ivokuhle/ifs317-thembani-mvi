# IFS 317 - Thembani WhatsApp Shadow Assistant (MVI Integration)

## Overview
This repository contains the implementation artifacts for the IFS 317 Enterprise Architecture project (Thembani Supermarket, Khayelitsha).

## Repository Structure
- `n8n_workflow.json`: Full production export of the n8n automation workflow canvas.
- `pii_masker.js`: Client-side JavaScript node script for POPIA-compliant WhatsApp ID anonymization.
- `schema.sql`: PostgreSQL DDL script creating the `order_retry_queue` table for loadshedding fault tolerance.
