Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC843634C
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665277; cv=none; b=jTIvkhtAX7h/LuCh13LhS8Dhj8uOVza2yBoUTIA93DQc0tZXcF1CTsF4Fx68580RMNWsIUaOjvGRjoJrIkK5bTidIo1I9hPxX7r66hTRw6mRu3fBTWfesJKeN+WFo8AUaESlxskuY2L5EDi0FTS/aCRbQeNacX/BjcdrFIkElsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665277; c=relaxed/simple;
	bh=AZ64CHGz12FFYxOEp0a1kdWoHqaMz747I3dsVRUikKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CB8cIHeaZf0us4Sd0T4KUsoveSq4pcwrVtCQsu2G2xrqpByaV2jJtc2bCDoXHrzq5aJgj9nN/382KWlcbDR87qS4nVmvvKGWTtYoICKngj0E7YKDPk3VHPR6YLL+mXE98Rv3ohGDKIKJVuvDyws4DEZpzjy7B95enjv+x4IUHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW7FXKhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW7FXKhC"
Received: by smtp.kernel.org (Postfix)
	id 968B41F00A3E; Tue, 21 Jul 2026 20:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F01F000E9;
	Tue, 21 Jul 2026 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665275;
	bh=wLzaI00W5jVs8vvwAy9jR8ul8iK13vcGruCbsrnjkFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZW7FXKhCXtvGa3yN3bPzv1/OvQDcm5l0zhDHW8QF2NM6vKOaBCmdAcb5E/OYrJw5Y
	 yPx38Aa5XHcYRTKoW+ovxRQ+YMRbSxysTs6P3I7/sYqJHUYbwtdVmv4v8YxF/aMUHP
	 h9KyyBwJVDGu0lpwQ5wohWmOk5xQvTt2n9WnSNgGkvgtkSKs9jiwedZYwsHlTkQwpo
	 VzgG5nOKp9hTwbhcgKhtHUfueEautQ8GUIhjh1Qfe6enNNIjb/ebz+6/kts+xVglaP
	 j5PB4pAZVW40w6vZ/+JIlRYlqBDOfpEzhFMWeW7zqUz0BPROdYUVZhTf1gOyiYqRQX
	 d+a4DkZtMePrQ==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 21 Jul 2026 22:21:04 +0200
Subject: [PATCH b4 4/4] review: drop the unused batch message-count updater
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-work-b4-accepted-unread-badge-v1-4-28581acc4988@kernel.org>
References: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
In-Reply-To: <20260721-work-b4-accepted-unread-badge-v1-0-28581acc4988@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=10475; i=brauner@kernel.org;
 h=from:subject:message-id; bh=AZ64CHGz12FFYxOEp0a1kdWoHqaMz747I3dsVRUikKs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTFX9mqcUsnQNZt7clS/4N8bu1bX0bYPjc97lIy9br1M
 ZnHE3Sed5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExklgXDX6kzqxslF/J+EGUV
 z7q/eU3PvPDqF7ydjeGqnsp1e7aw+jAy3F1tnTzpYd2ya88dWPYef+D9tHiZ+88syU9BD/efLDx
 7ngEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

update_message_counts() was the old Stage-2 batch helper that
re-fetched threads to refresh message counts after the main update
loop. Since the counts are updated from the already-fetched thread
messages inside update_series_tracking(), nothing calls it anymore.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py | 209 ----------------------------------------------
 1 file changed, 209 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 0d10dff..246f6fe 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1759,41 +1759,6 @@ def get_review_branches(topdir: Optional[str] = None) -> list[str]:
     return b4.git_get_command_lines(topdir, gitargs)
 
 
-def _fetch_thread_mbox_bytes(message_id: str) -> Optional[bytes]:
-    """Fetch and decompress the full thread mbox for a message ID via LoreNode.
-
-    Returns the raw mbox bytes, or None on failure or when offline.
-    """
-    if not b4.can_network:
-        return None
-    try:
-        node = b4.get_lore_node()
-        return node.get_mbox_by_msgid(message_id)
-    except (liblore.RemoteError, Exception) as ex:
-        logger.debug('Could not fetch mbox for %s: %s', message_id, ex)
-        return None
-
-
-def _latest_date_from_mbox(mbox_bytes: bytes) -> Optional[str]:
-    """Return the most recent Date: header from mbox bytes as an ISO timestamp."""
-    latest: Optional[datetime.datetime] = None
-    for line in mbox_bytes.split(b'\n'):
-        if not line.lower().startswith(b'date:'):
-            continue
-        date_str = line[5:].strip().decode('utf-8', errors='replace')
-        try:
-            dt = email.utils.parsedate_to_datetime(date_str)
-            if dt.tzinfo is None:
-                dt = dt.replace(tzinfo=datetime.timezone.utc)
-            if latest is None or dt > latest:
-                latest = dt
-        except Exception:
-            continue
-    if latest is None:
-        return None
-    return latest.astimezone(datetime.timezone.utc).isoformat()
-
-
 def _latest_date_from_msgs(msgs: List[Any]) -> Optional[str]:
     """Return the most recent Date header from EmailMessage objects as ISO timestamp."""
     latest: Optional[datetime.datetime] = None
@@ -1875,56 +1840,6 @@ def update_message_count_from_msgs(
     return True
 
 
-def fetch_thread_message_count(message_id: str) -> Optional[int]:
-    """Fetch the total message count for a thread via public-inbox t.mbox.gz.
-
-    Returns the total number of messages in the thread, or None on failure
-    or when offline.
-    """
-    mbox_bytes = _fetch_thread_mbox_bytes(message_id)
-    if mbox_bytes is None:
-        return None
-    parsed = b4.split_and_dedupe_pi_results(mbox_bytes)
-    return len(parsed)
-
-
-def _fetch_new_since(
-    message_id: str, since: str
-) -> Optional[Tuple[int, Optional[str]]]:
-    """Fetch new thread messages since a timestamp via LoreNode.
-
-    Uses LoreNode.get_thread_updates_since() which queries the public-inbox
-    ``rt:`` (Received-date) search endpoint scoped to the thread.
-
-    *since* is an ISO-format timestamp stored in the database.
-
-    Returns ``(count, latest_date_iso)`` where *count* is the number of new
-    messages (0 if none) and *latest_date_iso* is the most recent Date: header
-    found (None if no messages or no parseable date).  Returns None on error.
-    """
-    if not b4.can_network:
-        return None
-    try:
-        since_dt = datetime.datetime.fromisoformat(since)
-    except (ValueError, TypeError) as ex:
-        logger.debug('Could not parse last_update_check timestamp %r: %s', since, ex)
-        return None
-
-    try:
-        node = b4.get_lore_node()
-        msgs = node.get_thread_updates_since(
-            message_id, since_dt, strict=False, sort=False
-        )
-        if not msgs:
-            return (0, None)
-        count = len(msgs)
-        latest_date = _latest_date_from_msgs(msgs)
-        return (count, latest_date)
-    except Exception as ex:
-        logger.debug('Thread update query failed for %s: %s', message_id, ex)
-        return None
-
-
 def _store_thread_blob(topdir: str, change_id: str, msgs: List[Any]) -> Optional[str]:
     """Serialize msgs to mboxrd and write as a git blob; update tracking commit.
 
@@ -2299,130 +2214,6 @@ def ensure_thread_context_blob(
     return ctx_sha
 
 
-def update_message_counts(
-    identifier: str,
-    series_list: List[Dict[str, Any]],
-    topdir: Optional[str] = None,
-    prefetched: Optional[Dict[Tuple[str, int], List[Any]]] = None,
-) -> Dict[str, int]:
-    """Fetch and store thread message counts for a list of series.
-
-    For each active series in *series_list* that has a message_id:
-
-    - **First fetch** (``message_count IS NULL``): downloads the full t.json
-      thread index and stores the count.  ``seen_message_count`` is initialised
-      to the same value so no badge appears until *new* activity arrives.
-    - **Incremental** (``message_count IS NOT NULL``): POSTs a ``dt:`` query
-      for messages newer than ``last_update_check``.  An empty response (nothing
-      new) produces **zero database writes**, keeping the DB mtime stable and
-      suppressing spurious list reloads in the TUI.
-
-    When *prefetched* is provided (a dict mapping ``(change_id, revision)`` to
-    a list of already-fetched ``EmailMessage`` objects), the first-fetch path
-    reuses those messages instead of re-downloading the thread from lore.  This
-    avoids duplicate HEAD + GET requests when called right after
-    ``update_series_tracking()``.
-
-    Returns ``{'updated': n, 'errors': n}`` where *updated* counts series whose
-    ``message_count`` actually changed.
-    """
-    updated = 0
-    errors = 0
-    skip_statuses = frozenset(('archived', 'accepted', 'thanked', 'snoozed'))
-    now = datetime.datetime.now(datetime.timezone.utc).isoformat()
-
-    try:
-        conn = get_db(identifier)
-    except FileNotFoundError:
-        return {'updated': 0, 'errors': 0}
-
-    for series in series_list:
-        if series.get('status') in skip_statuses:
-            continue
-        message_id = series.get('message_id', '')
-        if not message_id:
-            continue
-        change_id = series.get('change_id', '')
-        revision = series.get('revision', 1)
-        if not change_id:
-            continue
-
-        row = conn.execute(
-            'SELECT message_count, seen_message_count, last_update_check'
-            ' FROM series WHERE change_id = ? AND revision = ?',
-            (change_id, revision),
-        ).fetchone()
-
-        existing_count = row['message_count'] if row else None
-        last_check = row['last_update_check'] if row else None
-
-        if existing_count is None or last_check is None:
-            # ── First fetch ──────────────────────────────────────────────────
-            # Reuse pre-fetched messages from update_series_tracking when
-            # available, otherwise fall back to a full lore download.
-            pre_msgs = prefetched.get((change_id, revision)) if prefetched else None
-            if pre_msgs is not None:
-                count = len(pre_msgs)
-                last_activity = _latest_date_from_msgs(pre_msgs)
-                conn.execute(
-                    'UPDATE series'
-                    ' SET message_count = ?, seen_message_count = ?,'
-                    '     last_update_check = ?, last_activity_at = ?'
-                    ' WHERE change_id = ? AND revision = ?',
-                    (count, count, now, last_activity, change_id, revision),
-                )
-                conn.commit()
-                updated += 1
-                if topdir and pre_msgs:
-                    _store_thread_blob(topdir, change_id, pre_msgs)
-            else:
-                mbox_bytes = _fetch_thread_mbox_bytes(message_id)
-                if mbox_bytes is None:
-                    errors += 1
-                    continue
-                parsed = b4.split_and_dedupe_pi_results(mbox_bytes)
-                count = len(parsed)
-                last_activity = _latest_date_from_mbox(mbox_bytes)
-                conn.execute(
-                    'UPDATE series'
-                    ' SET message_count = ?, seen_message_count = ?,'
-                    '     last_update_check = ?, last_activity_at = ?'
-                    ' WHERE change_id = ? AND revision = ?',
-                    (count, count, now, last_activity, change_id, revision),
-                )
-                conn.commit()
-                updated += 1
-                if topdir and parsed:
-                    _store_thread_blob(topdir, change_id, parsed)
-        else:
-            # ── Incremental: query for messages since last check ─────────
-            result = _fetch_new_since(message_id, last_check)
-            if result is None:
-                errors += 1
-                continue
-            new_count, new_activity = result
-            if new_count > 0:
-                # New replies arrived — update count, timestamp, and latest activity
-                conn.execute(
-                    'UPDATE series'
-                    ' SET message_count = message_count + ?, last_update_check = ?,'
-                    '     last_activity_at = COALESCE(?, last_activity_at)'
-                    ' WHERE change_id = ? AND revision = ?',
-                    (new_count, now, new_activity, change_id, revision),
-                )
-                conn.commit()
-                updated += 1
-                if topdir:
-                    new_mbox = _fetch_thread_mbox_bytes(message_id)
-                    if new_mbox:
-                        parsed = b4.split_and_dedupe_pi_results(new_mbox)
-                        if parsed:
-                            _store_thread_blob(topdir, change_id, parsed)
-
-    conn.close()
-    return {'updated': updated, 'errors': errors}
-
-
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:

-- 
2.53.0

