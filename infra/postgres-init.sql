CREATE TABLE IF NOT EXISTS events (
                                      id BIGSERIAL PRIMARY KEY,
                                      event_id UUID UNIQUE NOT NULL,
                                      correlation_id UUID NOT NULL,
                                      event_type TEXT NOT NULL,
                                      payload JSONB NOT NULL,
                                      created_at TIMESTAMPTZ NOT NULL DEFAULT now()
    );

CREATE TABLE IF NOT EXISTS audit_records (
                                             id BIGSERIAL PRIMARY KEY,
                                             event_id UUID NOT NULL,
                                             correlation_id UUID NOT NULL,
                                             payload_canonical TEXT NOT NULL,
                                             prev_hash TEXT NOT NULL,
                                             hash TEXT NOT NULL,
                                             created_at TIMESTAMPTZ NOT NULL DEFAULT now()
    );

CREATE INDEX IF NOT EXISTS idx_audit_created_at ON audit_records(created_at);
