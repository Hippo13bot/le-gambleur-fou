create table if not exists public.gambleur_state (
  owner_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{"entries":[],"settings":{"currency":"EUR"}}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.gambleur_state enable row level security;
revoke all on table public.gambleur_state from anon;
grant select, insert, update, delete on table public.gambleur_state to authenticated;
drop policy if exists "Users manage their own Gambleur data" on public.gambleur_state;
create policy "Users manage their own Gambleur data"
on public.gambleur_state for all to authenticated
using ((select auth.uid()) = owner_id)
with check ((select auth.uid()) = owner_id);
