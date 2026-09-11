# ☁️ Japanese Quest — Cloud Save Setup

Prototype ini memakai **Supabase Auth + Postgres**. GitHub Pages tetap menjadi hosting game; progress utama disimpan online per akun.

## 1. Buat project Supabase

Buat project baru di Supabase.

## 2. Buat tabel

Buka **SQL Editor**, lalu jalankan seluruh isi:

`JQ_SUPABASE_SETUP.sql`

Tabel yang dibuat: `public.jq_progress`.

## 3. Ambil URL + Publishable/anon key

Dari project Supabase, ambil:

- Project URL
- Publishable key / anon key

**Jangan masukkan `service_role` key ke HTML.**

## 4. Jalankan Japanese Quest

Buka:

`JQ_N5_FULL_AUDIT_CLOUD_SYNC_PROTOTYPE.html`

Pilih:

**☁️ Cloud Save → Akun & Sinkronisasi**

Masukkan Project URL dan Publishable/anon key, lalu simpan.

## 5. Buat akun / login

Setelah konfigurasi tersimpan:

- 🆕 Buat Akun
- atau 🔐 Login

Setelah login, prototype akan mengambil progress cloud. Setelah itu perubahan progress akan disinkronkan kembali ke database.

## Catatan

Local Storage masih dipakai sebagai **cache teknis** agar game yang ada sekarang tidak perlu dibongkar total. Sumber utama progress setelah Cloud Save aktif adalah database online.
