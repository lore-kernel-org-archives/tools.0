Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639C36D517
	for <tools@linux.kernel.org>; Wed, 12 Aug 2026 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571240; cv=none; b=q4nFa/HHRcaBDvJ8gtp8gDUP33OCYQxCpjDIip+vKNpc7+B6sqq4jqo4eFvNlRmzJmWUmp5ikhSI6JHzm+uNXFWo0D2jXwZdMlkGemxCWTFt9o8lhMgccmjK8667qQsrMc+wx66QX5tgu6ACaFokDiPE4caAxEnrCs5eZYwWybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571240; c=relaxed/simple;
	bh=F/u97NTfxeqhDLmqAXLRqnwcXsBWJzi3PGkEy5T7ueQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Duvcco9fDQzDCN8oHVlBf/4Q94heXlhMOdaJ1pWUH9QJuAk/CFCQEVHUnuin6bUeWziDQl5tf55WE+fEakRtkILAEl4feVYZ+JAREEoS0wEJI9t7kejHDHebivHe4DK/XiqkYJvjH4QXvmd1eJ0ouUJyxszB/IVKWeavTIH5aHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRMxFerb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRMxFerb"
Received: by smtp.kernel.org (Postfix)
	id 01E5E1F00A3A; Wed, 12 Aug 2026 21:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAEB1F000E9;
	Wed, 12 Aug 2026 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786571238;
	bh=RNMPpL9ntjR1opXdnJ8ycHQcPQVUK9I62VM71ZuELNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PRMxFerbbgNJsgpHJWc8fz9qdISAXCqMynBJvUjz1jdDwNPZK7qYlZT1fobzN/GtZ
	 ZYOETQiAU3KPyJqoAEB2mvln1+jDy20q0lWkSFvjpn8wHXISYKFIj4WHoOr+uNkarK
	 7ei6QuQygiFPt4aBRUpp3uv99GG/6anUZXw4kRjBWYAtcd0TbxKwVX0AJY14GA8tj0
	 NJ1BFeRdru0AI6/aHt9k9+4ybixcQXoXmIPu7AHGKfGiRatYDbIOGyQNdxUh0CkYEJ
	 jX6+UU/uiduq7xq/0NwYrcpl9WsHv0e41V2jBDJ/HQ11qD0cY3jo4J2hPcyYxmFyjn
	 aPTk3fI5JJcng==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 12 Aug 2026 23:46:49 +0200
Subject: [PATCH RFC v2 08/25] review: test the migration serialization
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-work-b4-multiver-rows-v2-8-305d53cd723a@kernel.org>
References: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
In-Reply-To: <20260812-work-b4-multiver-rows-v2-0-305d53cd723a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5778; i=brauner@kernel.org;
 h=from:subject:message-id; bh=F/u97NTfxeqhDLmqAXLRqnwcXsBWJzi3PGkEy5T7ueQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVvLx1ukM1bmmgh8PLzuqPsusm7NWe+PLDnjvcuzRVu
 i/VFPcldJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzE5AAjw67VKbmvGRZNFlr/
 8ELT1ZiP11uyuuRuxfxc8OiLZ7u/3FRGhp3LZx3cf3dKc8s9z0kfZnrGBXaEHvBmtvf/++RhvUv
 eAg4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Cover the three claims: two processes opening one database both come away
with a usable connection and the ladder having run once, a migration
interrupted partway rolls back whole rather than leaving a half-migrated
database stamped with the old version, and an up-to-date database is
opened without taking the write lock at all.

The fixture builds a schema-version 1 database and asserts the ladder
lands on SCHEMA_VERSION, so it needs no updating on the next bump.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_review_tracking.py | 113 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 4cde7cdd..6394d332 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -1721,6 +1721,119 @@ def _make_blob_tracking_data(
     }
 
 
+class TestMigrationSerialization:
+    """Two processes opening one database must not both migrate it.
+
+    The TUI and a ``b4 review cron`` sweep open the same file, and a
+    pending migration is exactly what both of them find on the first run
+    after an upgrade.  Reading the version and then issuing DDL in
+    autocommit let both decide to migrate: the loser died on `duplicate
+    column name`, or -- having read the version before the winner's DROP
+    landed -- on `no such column`.  busy_timeout cannot help, because
+    neither side ever asked for a lock.
+    """
+
+    @staticmethod
+    def _stale_db(identifier: str) -> str:
+        """A schema-version 1 database, whatever the current version is."""
+        db_path = review_tracking.get_db_path(identifier)
+        raw = sqlite3.connect(db_path)
+        raw.executescript("""
+            CREATE TABLE schema_version (version INTEGER PRIMARY KEY);
+            CREATE TABLE series (
+                track_id INTEGER PRIMARY KEY,
+                change_id TEXT NOT NULL,
+                revision INTEGER NOT NULL,
+                status TEXT DEFAULT 'new',
+                UNIQUE (change_id, revision)
+            );
+        """)
+        raw.execute('INSERT INTO schema_version (version) VALUES (1)')
+        raw.commit()
+        raw.close()
+        return db_path
+
+    def test_two_openers_both_survive_a_pending_migration(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """Both get a usable connection, and the ladder runs once."""
+        import threading
+
+        db_path = self._stale_db('mig-race')
+        errors: list[Exception] = []
+        # Both inside _migrate_db_if_needed at once is the whole point; let
+        # them serialize and the test passes on code that cannot survive
+        # the overlap.
+        barrier = threading.Barrier(2)
+
+        def _open() -> None:
+            barrier.wait()
+            try:
+                review_tracking.get_db('mig-race').close()
+            except Exception as ex:
+                errors.append(ex)
+
+        threads = [threading.Thread(target=_open) for _ in range(2)]
+        for thread in threads:
+            thread.start()
+        for thread in threads:
+            thread.join()
+
+        assert errors == []
+        raw = sqlite3.connect(db_path)
+        rows = raw.execute('SELECT version FROM schema_version').fetchall()
+        raw.close()
+        # One row at the current version: the loser found the work done
+        # rather than redoing it.
+        assert rows == [(review_tracking.SCHEMA_VERSION,)]
+
+    def test_an_interrupted_migration_rolls_back_whole(
+        self, tmp_path: pytest.TempPathFactory, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """Half a migration stamped with the old version is the bad state.
+
+        The next open would resume the ladder at a step whose work is
+        already there and die on it.  sqlite's DDL is transactional, so
+        wrapping the ladder makes the version bump and the schema it
+        describes commit together or not at all.
+        """
+        db_path = self._stale_db('mig-atomic')
+
+        def _boom(conn: sqlite3.Connection) -> None:
+            conn.execute('ALTER TABLE series ADD COLUMN halfway TEXT')
+            raise RuntimeError('interrupted')
+
+        monkeypatch.setattr(review_tracking, '_run_migrations', _boom)
+        with pytest.raises(RuntimeError):
+            review_tracking.get_db('mig-atomic')
+
+        raw = sqlite3.connect(db_path)
+        cols = {row[1] for row in raw.execute('PRAGMA table_info(series)')}
+        version = raw.execute('SELECT version FROM schema_version').fetchone()[0]
+        raw.close()
+        assert 'halfway' not in cols
+        assert version == 1
+
+    def test_an_up_to_date_database_takes_no_write_lock(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        """The version is read once without the lock first.
+
+        Every open but the one after an upgrade answers "no migration
+        pending", and that path must not serialize every connection behind
+        a write lock -- a sweep mid-write would otherwise stall the TUI for
+        the whole busy_timeout on every single open.
+        """
+        review_tracking.init_db('mig-current').close()
+        holder = sqlite3.connect(review_tracking.get_db_path('mig-current'))
+        holder.execute('BEGIN IMMEDIATE')
+        try:
+            review_tracking.get_db('mig-current').close()
+        finally:
+            holder.rollback()
+            holder.close()
+
+
 class TestFollowupBlob:
     """Tests for _store_thread_blob() and get_thread_mbox()."""
 

-- 
2.53.0

