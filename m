Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722882;
	b=rBuizLe9oA0WVJjRC3Go+xm3CZosGkTW+H7YCF40ZwYHdfdNfZXwUiLE+Vl/oRe7DGyn
	 77HvXGIkGWASGbZfBlzkumctF63yGyp3xnrGhQUZ2DJGmilewHG8GDcnphfN4Kae0KUjy
	 MJrmJ++Rq7UzhPlzwLLaU7IpF7enFhDBHZmtPcWOPhhsLua8B0Tu5KtUo8Yu8mD6RQctI
	 +V73B3hsqO/mrV5UT6Bs3KlRlVYumb5EC5WdIvVi2zSj2X38CfizAWvPYlcp7ncX+doKf
	 Z0XVwmZcZ2No7T/O2o/Yd8++SWMkUqDxzFcmifaa0xmEMTc5Zs20nDj6PI6+GsRnOBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722882;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9Lsu43DpXE3kVIp7HdGb+tQdqDY7wyldPr+YmJKGeLM=;
	b=m8jAQLFZVlEDdAKc15/89MhczPmSoLTaosGb31yOpgNE9U8SS9ulJ1t2dFrj3FRrfJeH
	 DWFlF2HF7wmV6iLS4UbIdc5gs8x+PbsqwJyqEObNPBQho0D4h/If6HQKhrWkjERvDMoBt
	 povtoW6zHr/6T6PB0iOjKceFHZh0/eZvoznFHVmlZEAaYluMdCbsjqdRoy2FzbIojG8mv
	 CpNMCjkUHc3XTLp+UY3szsAkH4VbyEdK4NOGdz0qOy4dacqPaTovTIPXTefjK+6VoJXbN
	 IRAL6SsPjcQWRxIplnQqJKSIN7yVKNgkv4sP5w+OQuWDAuNWnvO/5F2UD+gaxWWCf4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ujFKRG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B0606A326
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ujFKRG
Received: by smtp.kernel.org (Postfix)
	id 409231F00A17; Tue,  3 Nov 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793722882;
	b=lezUY0u/BCn5RCyOqMJmvKV46NSm6or9Jg0nUqybf64kRpJm12J5grN3xcESUN1Fpq1v
	 G4VdknnuUqNVA1EmGtKOpb3oVdw42Erf09kBQW2yYPyyJ/w1NuKeivs2CLzM/9rqG2f5O
	 8GMC+l+XBB8/zLd58unKRlHXVUv1YQZLpZMgChDLnp3hu1gjJEMxuJAV4VDOK3J8YH/47
	 jXnHypuNti7eHnvqV6WNJJ2CI3yYjQSqCbyYkv+s/+0cC3qfjYA9zL+NQalnk6i4vZ6YI
	 4T6yJFfQPsWNZgJ2O6DDXa4nxn07r6dbIuiGbUVH39dwosgTct/Opt4C+EDOif8nq6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793722882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9Lsu43DpXE3kVIp7HdGb+tQdqDY7wyldPr+YmJKGeLM=;
	b=mbYjXVDzZ8gbWPrNLUz3GEtxa4xQOkpCTQfu1oyqqzJe7Jtpx2LxGO2CbjaKO+xGhbnA
	 DyDdAMO2Dmf8ZTprb5xaSrkRe8M2q6A3M+Ai3KC7d4Q9QS/xWpTgD42dGgSx5m2tjPMxK
	 2ijQBeKRyol8pi0gI4oXw16zgbqPhy18y6RtE0xGvt05TIbMXGUT72YbNzIbWs6VoVxK5
	 PAeDpISM5Kdh3BrMZzvva1EiDcce+a44vlmupz8O5yNpIaYK1NfCxjB/OUpthWierneaj
	 vvR+7jyjg26bQKzAHHSVFJnxts6Bo0LCVqUExVm5Ma8Dp9cP6ka5AQPi4SVsdXFVhmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ujFKRG;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44A591F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ujFKRG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 44A591F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11699365e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722880; x=1794327680; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Lsu43DpXE3kVIp7HdGb+tQdqDY7wyldPr+YmJKGeLM=;
        b=o2ujFKRGR/iux9qK0QscOVBg2l7aA6K96fQbB5gHerDMMFjXnH0yGwZckRLK+XAaI7
         aXRBqDkID/p5iTwOmLdd7BbPFOjq7Vm7dYbmM4ilU3otQSVwB316NgIbHx9dAR8XSWJr
         BvCpEFA+Nn+yovPYsYzDKyM+4SKuoY9PmIT4XY69SiQLx1gVVzKJx48j3pG46YS88qUR
         Q7PxXkU2ZFq6ftbh+uWDi2XagEMgYXUv2IKDAqtnRE2b9+EeslAZ/YfbPxKyH2LNUZZm
         5M+7XTUtGgq7+eeXRa+ncyI3uxOoUteaOjdtZ59H6JTwt3n3vNCyv/efEM6Ij2g+ILpW
         cQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722880; x=1794327680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Lsu43DpXE3kVIp7HdGb+tQdqDY7wyldPr+YmJKGeLM=;
        b=GjPFOvSYjQB9Sr0jCcfAmnQlOYmYuHvdezbCk37Q5JEObLn+KUpaJbNtegCS+5G06U
         EI8zBHKwj8cxCSults1DEFFur13rGM7eF71wlZ3NNIOdQJHifAfr6yF5p1QLmDlErMfp
         bfikJJzrs/j2525DFsSrKw62fNeQDRwun3UP498VU+Z1QGkoWCfcdvpi/BOo59ripJjs
         2M7Lmg/M+pqRmdf+lPIUuQlD+eXr6n7lB308F6Io1Hoq3C8p6cXaGHMo5VSUMzzZJF7I
         jqsFfpglD305wf5tMEtXYWNmeQelLPsadGUCUu4UpR737DInicZdmp/+kBjeykO49Lg4
         hCWw==
X-Gm-Message-State: APuU4Z/V9MZRwH3tbcoFGzCwyu2boLQ1Afn2zJQvXlNdhjHkPYHno7ri
	NUhdT0K6eION7VoLSYpqerZ1XonihZKw1HiIMb2zXsFkXE9aLNfZOKre
X-Gm-Gg: AYBFou084HGjaVH5/06VZc8g8UCUcwm8fpLl0ZiA9lVy9Jv34M31kTRATeCwBkwPF73
	e+k72LauVeUwdey/ERQZNu9N553saZe7qzVN45AYh/9an6cOfnVZYGvLgZtqAUYjeslBPCIE2W/
	MLqQgxq/sv+WPAvYc8j2V+//quLBXA2LWDCc2bS7+7JEMsZ3yZwENgQHrr07faFwXlZLfMIRWCQ
	gLUFnsoiPSUpX6q2daxiueH4ZGCwNTIPdMQND9wlRS2EbsDeLR3GAt0/cxKuDLCyppbcVACJ9lm
	v+y4Wk6xTc39gq1qowP6OCQxttpmumtmNns1V1vmVSqSHoAih27t50UA1V+NyV7J9vf6WJq5P0U
	q3qEQ1d219GJ201Mf/A+l7MDhwwhlukXEajOU0a05hw+18NnJzKD1VglN5fKKApWLSqO7rQKfpY
	x3zGC23kppMjJbcZeUF422Yg1XyuSgFFzPLqsG1v2RRJo0SmYZPL4MGz4R4vTJ063LJmoS86E7C
	eHgKOlTwmrgMvQpUwVOx6e9nT1NGNSA9l/QlayhUsP6gO3R6xvkGUOh6XiYOnhD0MMoYAAcFEGM
	E7066MehJsrv4Ds+uNTYVWv1asnjA3K2oChaIfCTltoKtQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr312500415e9.0.1793722879388;
        Tue, 03 Nov 2026 08:21:19 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm63661075e9.7.2026.11.03.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:21:18 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 17:20:33 +0100
Subject: [PATCH b4 1/3] review: prepare tracking storage for upstream merge
 matches
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-detect-merged-v1-1-743a882c6127@gmail.com>
References: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
In-Reply-To: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793722874; l=8131;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=c1GoCeMr3FxS8nL2S5/uFuzgpID758Uj4PzgGNO9M+M=;
 b=kpquFkjNooGzLUO1lQPODmEhUcgruTjmx0ZU9T+Ubb+AvT+X9NinzKcxadC/uMVoS3rKvI01f
 dNjx1zORDXFCkF4lwmV4HOX6QscK1zBTgioEN7wwiMx/+SyJWnJ7lf9
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Store per-patch upstream commit matches in the tracking database and
preserve them when review branches are rescanned. Avoid rewriting a
checked-out review branch when storing its thread.

Assisted-by: LLM [codegen, tests]
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review/tracking.py | 92 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 83 insertions(+), 9 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index d4d2f51..b802ff1 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -28,7 +28,7 @@ logger = b4.logger
 REVIEW_METADATA_DIR = 'b4-review'
 REVIEW_METADATA_FILE = 'metadata.json'
 
-SCHEMA_VERSION = 10
+SCHEMA_VERSION = 11
 
 SERIES_PATCHES_DDL = """
 CREATE TABLE IF NOT EXISTS series_patches (
@@ -37,6 +37,8 @@ CREATE TABLE IF NOT EXISTS series_patches (
     position   INTEGER NOT NULL,
     message_id TEXT NOT NULL,
     subject    TEXT,
+    patch_id   TEXT,
+    merged_commit TEXT,
     PRIMARY KEY (change_id, revision, position)
 )"""
 
@@ -200,6 +202,13 @@ def _migrate_db_if_needed(conn: sqlite3.Connection) -> None:
             conn.execute(
                 'ALTER TABLE revisions ADD COLUMN is_rethreaded INTEGER DEFAULT 0'
             )
+    if version < 11:
+        conn.execute(SERIES_PATCHES_DDL)
+        existing = {row[1] for row in conn.execute('PRAGMA table_info(series_patches)')}
+        if 'patch_id' not in existing:
+            conn.execute('ALTER TABLE series_patches ADD COLUMN patch_id TEXT')
+        if 'merged_commit' not in existing:
+            conn.execute('ALTER TABLE series_patches ADD COLUMN merged_commit TEXT')
     conn.execute('UPDATE schema_version SET version = ?', (SCHEMA_VERSION,))
     conn.commit()
 
@@ -1218,7 +1227,8 @@ def get_all_tracked_series(identifier: str) -> list[dict[str, Any]]:
 
     Returns a list of dicts with keys: track_id, change_id, revision, subject,
     sender_name, sender_email, sent_at, added_at, status, num_patches,
-    message_id, pw_series_id, message_count, seen_message_count.
+    message_id, pw_series_id, message_count, seen_message_count,
+    merged_patch_positions, merged_patch_count.
 
     The ``attestation`` field carries the live trust-on-first-use status
     of each signature, and ``tofu`` its details (see
@@ -1262,6 +1272,20 @@ def get_all_tracked_series(identifier: str) -> list[dict[str, Any]]:
                     'snoozed_until': row[18],
                 }
             )
+        merged_positions: Dict[Tuple[str, int], List[int]] = {}
+        for change_id, revision, position in conn.execute(
+            'SELECT change_id, revision, position FROM series_patches'
+            ' WHERE position > 0 AND merged_commit IS NOT NULL'
+        ):
+            merged_positions.setdefault((change_id, int(revision)), []).append(
+                int(position)
+            )
+        for entry in result:
+            positions = merged_positions.get(
+                (entry['change_id'], int(entry['revision'])), []
+            )
+            entry['merged_patch_positions'] = positions
+            entry['merged_patch_count'] = len(positions)
         try:
             _resolve_attestation(conn, result)
         except Exception as ex:
@@ -1495,15 +1519,34 @@ def get_series_patches(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> List[Dict[str, Any]]:
     """Return the stored patches for a series, ordered by position."""
-    cols = ('position', 'message_id', 'subject')
+    cols = ('position', 'message_id', 'subject', 'patch_id', 'merged_commit')
     cursor = conn.execute(
-        'SELECT position, message_id, subject FROM series_patches'
+        'SELECT position, message_id, subject, patch_id, merged_commit'
+        ' FROM series_patches'
         ' WHERE change_id = ? AND revision = ? ORDER BY position ASC',
         (change_id, revision),
     )
     return [dict(zip(cols, row)) for row in cursor.fetchall()]
 
 
+def set_series_patch_merge_status(
+    conn: sqlite3.Connection,
+    change_id: str,
+    revision: int,
+    patch_status: Dict[int, Tuple[Optional[str], Optional[str]]],
+) -> None:
+    """Update patch IDs and upstream matches for identifiable positions."""
+    conn.executemany(
+        'UPDATE series_patches SET patch_id = ?, merged_commit = ?'
+        ' WHERE change_id = ? AND revision = ? AND position = ?',
+        [
+            (patch_id, merged_commit, change_id, revision, position)
+            for position, (patch_id, merged_commit) in patch_status.items()
+        ],
+    )
+    conn.commit()
+
+
 def build_known_revisions(
     conn: sqlite3.Connection, change_id: str
 ) -> List[Dict[str, Any]]:
@@ -2726,6 +2769,10 @@ def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional
 
     import b4.review as _b4_review
 
+    branch_name = f'b4/review/{change_id}'
+    if b4.git_branch_checked_out(topdir, branch_name):
+        return None
+
     buf = io.BytesIO()
     b4.save_mboxrd_mbox(msgs, buf)
     mbox_bytes = buf.getvalue()
@@ -2741,7 +2788,6 @@ def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional
         return None
     blob_sha = out.strip()
 
-    branch_name = f'b4/review/{change_id}'
     if b4.git_branch_exists(topdir, branch_name):
         try:
             cover_text, tracking = _b4_review.load_tracking(topdir, branch_name)
@@ -3256,7 +3302,7 @@ def rescan_branches(
 
         # Check the stored SHA for the most recent revision of this change_id.
         stored = conn.execute(
-            'SELECT branch_sha FROM series WHERE change_id = ?'
+            'SELECT branch_sha, status, revision FROM series WHERE change_id = ?'
             ' ORDER BY revision DESC LIMIT 1',
             (change_id_from_branch,),
         ).fetchone()
@@ -3293,6 +3339,24 @@ def rescan_branches(
         scanned_change_ids.add(change_id)
         status = series.get('status', 'reviewing')
         revision = series.get('revision', 1)
+        merged_commits = series.get('merged-commits', {})
+        if (
+            stored
+            and stored['revision'] == revision
+            and b4.git_branch_checked_out(topdir, br)
+        ):
+            if stored['status'] == 'merged' and status not in (
+                'snoozed',
+                'gone',
+                'archived',
+            ):
+                status = 'merged'
+            if not merged_commits:
+                merged_commits = {
+                    str(patch['position']): patch['merged_commit']
+                    for patch in get_series_patches(conn, change_id, revision)
+                    if patch['merged_commit'] is not None
+                }
 
         # Parse sent date from header-info
         sent_at = None
@@ -3335,11 +3399,21 @@ def rescan_branches(
             for i, p in enumerate(tracking_patches, 1):
                 p_msgid = p.get('header-info', {}).get('msgid', '')
                 if p_msgid:
-                    rows.append((change_id, revision, i, p_msgid, p.get('title', '')))
+                    rows.append(
+                        (
+                            change_id,
+                            revision,
+                            i,
+                            p_msgid,
+                            p.get('title', ''),
+                            merged_commits.get(str(i)),
+                        )
+                    )
             if rows:
                 conn.executemany(
-                    'INSERT INTO series_patches (change_id, revision, position, message_id, subject)'
-                    ' VALUES (?, ?, ?, ?, ?)',
+                    'INSERT INTO series_patches'
+                    ' (change_id, revision, position, message_id, subject, merged_commit)'
+                    ' VALUES (?, ?, ?, ?, ?, ?)',
                     rows,
                 )
                 conn.commit()

-- 
2.43.0

