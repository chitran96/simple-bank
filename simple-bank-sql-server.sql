CREATE TABLE [accounts] (
  [id] bigserial PRIMARY KEY,
  [owner] nvarchar(255) NOT NULL,
  [balance] bigint NOT NULL,
  [currency] nvarchar(255) NOT NULL,
  [created_at] timestamptz NOT NULL DEFAULT 'now()'
)
GO

CREATE TABLE [entries] (
  [id] int PRIMARY KEY,
  [account_id] bigint,
  [amount] bigint NOT NULL,
  [created_at] timestamptz NOT NULL DEFAULT 'now()'
)
GO

CREATE TABLE [transfers] (
  [id] bigserial PRIMARY KEY,
  [from_account_id] bigint,
  [to_account_id] bigint,
  [amount] bigint NOT NULL,
  [created_at] timestamptz NOT NULL DEFAULT 'now()'
)
GO

ALTER TABLE [entries] ADD FOREIGN KEY ([account_id]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [transfers] ADD FOREIGN KEY ([from_account_id]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [transfers] ADD FOREIGN KEY ([to_account_id]) REFERENCES [accounts] ([id])
GO

CREATE INDEX [accounts_index_0] ON [accounts] ("owner")
GO

CREATE INDEX [entries_index_1] ON [entries] ("account_id")
GO

CREATE INDEX [transfers_index_2] ON [transfers] ("from_account_id")
GO

CREATE INDEX [transfers_index_3] ON [transfers] ("to_account_id")
GO

CREATE INDEX [transfers_index_4] ON [transfers] ("from_account_id", "to_account_id")
GO
