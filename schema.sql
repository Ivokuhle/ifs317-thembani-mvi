-- schema.sql
-- PostgreSQL DDL/DML Schema for Thembani Loadshedding Resilient Order Queue

-- 1. Create custom order status ENUM type
CREATE TYPE order_status_type AS ENUM ('PENDING_RETRY', 'PROCESSED', 'FAILED');

-- 2. Create the retry queue table
CREATE TABLE IF NOT EXISTS order_retry_queue (
    retry_id SERIAL PRIMARY KEY,
    order_reference VARCHAR(50) NOT NULL UNIQUE,
    sanitized_phone VARCHAR(50) NOT NULL,
    order_payload JSONB NOT NULL,
    status order_status_type DEFAULT 'PENDING_RETRY',
    retry_count INT DEFAULT 0,
    error_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 3. Index for automated cron retry workers
CREATE INDEX IF NOT EXISTS idx_order_retry_status ON order_retry_queue (status);
