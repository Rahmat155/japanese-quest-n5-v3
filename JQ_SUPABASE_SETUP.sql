-- Japanese Quest — Cloud Save
-- Jalankan di Supabase SQL Editor.
-- Data setiap pemain dipisahkan berdasarkan auth.uid().

create table if not exists public.jq_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  player_name text,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.jq_progress enable row level security;

revoke all on table public.jq_progress from anon;
grant select, insert, update on table public.jq_progress to authenticated;

drop policy if exists "Users can read own Japanese Quest progress" on public.jq_progress;
drop policy if exists "Users can insert own Japanese Quest progress" on public.jq_progress;
drop policy if exists "Users can update own Japanese Quest progress" on public.jq_progress;

create policy "Users can read own Japanese Quest progress"
on public.jq_progress
for select
to authenticated
using ((select auth.uid()) = user_id);

create policy "Users can insert own Japanese Quest progress"
on public.jq_progress
for insert
to authenticated
with check ((select auth.uid()) = user_id);

create policy "Users can update own Japanese Quest progress"
on public.jq_progress
for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

create index if not exists jq_progress_user_id_idx
on public.jq_progress(user_id);
