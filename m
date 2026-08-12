Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C435675C
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571239; cv=none; b=kAyUIV04Rm5SmgPe0qdslccRpK/m5c++ASvLrsEUtR5poSh7CNmnf+ljoVOrv24OhEBlRdGMWbLs4dhkdln2tYbni8AiDyauM0lWupvIy2XEeo/z0shD4qKxKvk3YChjCUu1SEOmiA69bJUViv3E81OAKjgun9YJqgOtButpZ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571239; c=relaxed/simple;
	bh=Aj4gBoydmUHOcUd/GKzkK7tzYn+udlsY8TBLeg6aBz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyxdPLGsuhyvLFPZ7PM4cqAhQVzQF22tFd0Gs+43uAQh7pbKJNfwPbP15t5cMB6Eva8ucaM7JXmPqntWuiJaf5G+R1aMFVy4DqSonCy2YSV3dhPVBKX/I76kWuvBZO1M+FdrZrNqfAysNmAUPk+B572rzfoa606tdC1RZi7tJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVksvb3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVksvb3Y"
Received: by smtp.kernel.org (Postfix)
	id C01291F00A3D; Wed, 12 Aug 2026 21:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29851F000E9;
	Wed, 12 Aug 2026 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571237;
	bh=d37AfunCS1wXKw54ZbqqozGwjVPweewoDmBR2XxenLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HVksvb3YGYUgrAiZAt39bKF31iiUD9cKqltpi3XC0nMMegToQZMDj634kGIbVogwk
	 PIntjNwqsznuWck+IuIQFzzzjPOVyRHILpoRK++dTHDgbg2eFBd/LPo385YyHLb4HV
	 SyMzYObt6FTJjHE3SbvBomGhitqPdLrkbEeawjVDvtI8KnFu61qUiCl9sSKbMVg09P
	 eNlqoT9g6D40Buv6Q5QsDsSsbrsTUkPWnxjE2kKgVXK+RjrfelSMJbFXuySKFQw1i2
	 Q4mledtvX8APGzqEB8n6fojxAw86qpzH2CUE7Ua+mjABIXnQ+MZ6s1+pnTKZ1EVPru
	 Ismr2cEOGuU/A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:48 +0200
Subject: [PATCH RFC v2 07/25] review: serialize schema migrations against a
 concurrent opener
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-7-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4902; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Aj4gBoydmUHOcUd/GKzkK7tzYn+udlsY8TBLeg6aBz4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLz1uvx44eFtf7veTLslP6P13Jx/5xXm3Co7NYOp9
 y7r8zKn4o5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJ6Bxn+Gf2qHUCR2mhyU2P
 XNu3CVP6dKJiX5zw/S8teIXj0q6XL5cxMhy68HX7vIW2ko4eK0p+CLJ/mmemGCEc5cx4v+Ti/q/
 GydwA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

_migrate_db_if_needed() reads the schema version and then issues DDL in
autocommit, so two processes opening the same database both decide to
migrate.  The loser dies on `duplicate column name: message_count`, or,
having read the version before the winner's DROP COLUMN landed, on
`no such column: message_count`.  Reproduced 6/6 with two threads
opening one v10 database.

busy_timeout, which _configure_conn sets for exactly this pair of
writers, does not help: neither side ever asks for a lock.

The TUI and a `b4 review cron` sweep are that pair.  The race has been
latent since the v8 migrations because nothing has needed migrating
since; the next schema bump makes it fire, once, on the first launch
after an upgrade, for every maintainer with the timer installed.  It does
not corrupt anything, since the loser's work rolls back and the winner
completes, but it surfaces as a raw sqlite traceback out of get_db(), and
update_revision_message_counts() catches only FileNotFoundError.

Take the write lock before re-reading the version, so the second process
finds the work already done.  sqlite's DDL is transactional, so this also
makes the migration atomic: the version bump can no longer commit
separately from the schema it describes, and an interrupted migration
rolls back whole rather than leaving a half-migrated database stamped
with the old version.

The version is still read once without the lock first.  The answer is "no
migration pending" on every open but the one after an upgrade, and that
path must not serialize every connection behind a write lock.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 2722e6c3..cecfdb9c 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -135,10 +135,45 @@ def init_db(identifier: str) -> sqlite3.Connection:
 
 
 def _migrate_db_if_needed(conn: sqlite3.Connection) -> None:
-    """Apply any pending schema migrations in-place."""
+    """Apply any pending schema migrations in-place.
+
+    Serialized against other processes, because the TUI and a
+    ``b4 review cron`` sweep open the same database and a pending
+    migration is exactly what both of them find on the first run after an
+    upgrade.  Reading the version and then issuing DDL in autocommit let
+    both decide to migrate: the loser died on `duplicate column name`, or
+    -- having read the version before the winner's DROP landed -- on
+    `no such column`.  busy_timeout cannot help, since neither side ever
+    asked for a lock.
+
+    BEGIN IMMEDIATE takes the write lock before the version is re-read, so
+    the second process finds the work already done.  It also makes the
+    whole migration one transaction -- sqlite's DDL is transactional -- so
+    the version bump can no longer commit separately from the schema it
+    describes, and an interrupted migration rolls back whole.
+
+    The version is read once without the lock first: the answer is "no" on
+    every open but the one after an upgrade, and that path must not
+    serialize every connection behind a write lock.
+    """
+    row = conn.execute('SELECT version FROM schema_version').fetchone()
+    if row is not None and row[0] >= SCHEMA_VERSION:
+        return
+    conn.execute('BEGIN IMMEDIATE')
+    try:
+        _run_migrations(conn)
+    except Exception:
+        conn.rollback()
+        raise
+
+
+def _run_migrations(conn: sqlite3.Connection) -> None:
+    """The migration ladder, under the write lock :func:`_migrate_db_if_needed` took."""
     row = conn.execute('SELECT version FROM schema_version').fetchone()
     version = row[0] if row else 0
     if version >= SCHEMA_VERSION:
+        # Another process migrated while we waited for the lock.
+        conn.rollback()
         return
     if version < 2:
         conn.execute('ALTER TABLE series ADD COLUMN branch_sha TEXT')
@@ -198,7 +233,12 @@ def _migrate_db_if_needed(conn: sqlite3.Connection) -> None:
             conn.execute(
                 'ALTER TABLE revisions ADD COLUMN is_rethreaded INTEGER DEFAULT 0'
             )
-    conn.execute('UPDATE schema_version SET version = ?', (SCHEMA_VERSION,))
+    # Not an UPDATE: `version` is the primary key, so an UPDATE writes
+    # nothing at all against an empty table -- and the read above maps "no
+    # row" to version 0, so such a database would re-run the whole ladder
+    # on every open and never record that it had finished.
+    conn.execute('DELETE FROM schema_version')
+    conn.execute('INSERT INTO schema_version (version) VALUES (?)', (SCHEMA_VERSION,))
     conn.commit()
 
 

-- 
2.53.0

