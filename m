Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722891;
	b=Em8LtAV7cefucPdz/9mnUDXohe6VZf5iZh/IL/2EYKQz7+Yt6Hfw50H94pObVfBi/K92
	 1lB+8oZ3l/i9AU/evrYZ3rlZLnIqw3FXLkvawEfua1uNlJuf1kswKH/F8y17XQSSDlfjq
	 ms0mWuFh2dCtqlSck3ueYAMYcVpBbVEt25it8KVA+DuZS7udcA0bX2/qQByygBXrJlRiE
	 ArR9PRvX8Ofih/UKemRs6ydGtqFrLPVMy/+sUR30Oy8DsCo0lRJ3vgBTJb2kdGCy9NjLg
	 6A32P9ghPMU/seb/Op6bqmM4+/2TGYAzKSGBnSVFqRGvosUkUp+chvaz+MMDyOIwKAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722891;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ygef+piYKo2rObR7iPSGvq2m6RjScUB60edg5HjdpYE=;
	b=wy+/aF3GX33ZGNhznhGEiPEKkfn0aK9EodXy3e/uTzxk/DwdPfjrocADZl7ZucMsOL8D
	 Rchgg+Q9ZfnF77RHHQXoLn1gG1LQ0/SGnrKdFRHrJbYE0l0aG7z4OLkpE4Upfh1ykq7Sr
	 52L4pgQOKGtpdbP6Po6AbVoZGcaxq5ogdustBN1f9qvF8PORA+O+JzXsRCoNJzyF5n7PB
	 17FpNeA2Sx8Z1FX3IVdx3aOP2zaCqDpA1feubV6xYQClwJXC3NCb2llDHE8wZVIrn/Piw
	 kP/llGgzOzKQa+qmelsxUCVZCTjGfwFKSB39W6phrGKbSeY3+YHIDo+j3h3wOeC1rAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l8F0gpo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E644B606A329
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l8F0gpo
Received: by smtp.kernel.org (Postfix)
	id B19651F00A15; Tue,  3 Nov 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793722890;
	b=c6PkHMwlb1fnL0izajLEEyvyC4UE18b1qUhWpo9ximUjLK7m7ZnFyHVb9zzB50ALiTzL
	 tC+NfBnNC+zYP7Xqv8Mu7yMZlFdv2TWqLs9Vm+u3RFBphX59uEJe8u5mlCxb1jOEUcrtr
	 5AVvqZLZNRA2LKNOcL4SDN2zcW5eNs93sSTq3mMZ/wAKy0Lh7wFkbPx3SszaI5QbFvOLd
	 hD+uYX7qD1PXQvaE0orRh+BkMbmC41QHuKG8ve6AkdvylN7PvRvLbv5ZFoJM5Twg8QXFZ
	 +eFuJV6bE9DV5fa+8uVKU8OSskP5c0cYQjDjD7FJegDY1Aq0ny+KHSMPMfG5m1L7BJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793722890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ygef+piYKo2rObR7iPSGvq2m6RjScUB60edg5HjdpYE=;
	b=PA9rC5eSEGMGvUnxNQAlnlDs6fv/v3zpxMjfgqIAnkjpjyGlCuU77T67+8rVwhdoPAA0
	 OpJpGXivf6Bl37gmFI54MGgzqeXcvn46b78wrpn4SskmTbgBYg2Cf6ie9F0bWWA7EiWTk
	 fFpKC+s1BgwgvfZTP2AzKaCvXQsNY6sPJuKi90C2AENMvK+V71LR2F8ISMKUGZIrYgN2i
	 IS/KZRtA8OeQ5aaTEgbncBuJtzoTz0vXJRz/9ADWX5R2Nqh4VlYOEfeBWvhHJ81rmdNe8
	 WTQh6gs+heomM2HRqOUqx07J8Adw6dySwXjCfyE3RdR/ApGBT5cnS7+7UuKJTAD/qAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l8F0gpo;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFE581F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l8F0gpo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AFE581F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a215e64962so40851995e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 08:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722881; x=1794327681; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygef+piYKo2rObR7iPSGvq2m6RjScUB60edg5HjdpYE=;
        b=0l8F0gpoNSHT/PLM7K6xFfJBPN5iF9mVRBKDFeBSOtei3mBrhQM4VF1pUrpJ2qxyRJ
         Vs4SIQInxALj8r7hFrdfGLGsZath9a08tN7OjFKrBzWBNj4vNm2iQHPR34aH/yGR8Qha
         mgmzbAu1Vp2xAr9u4oOPou0Nq6b0CR8v+cLNe63DrnurmeOnCyJ6zOkqtB6mKrMOQhg/
         fFLdEhHSCli5n21B05txk70bVhuqie6MUBeIifX4yLFDsor5Cg3jHhTV2KetjEpcbNms
         HwYDs4sbtDh3qk2K0ocsYnlVa/FG7RoHX3dKy/Tl5mmzLYC5eOXsm1ijzIfHvDg1ME8o
         M9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722881; x=1794327681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygef+piYKo2rObR7iPSGvq2m6RjScUB60edg5HjdpYE=;
        b=UN1QTgUDx5CLGD2UwXNd9FJbtpaFCR++BJzwrXedmH7+N2lS8iM9zlfN4VJkp/yG6B
         rzVTJPy94w8nF9W7uJQQ8LBxNXXeMu39M0q7XagskrRS+x8t/b/KQ79lUWqjAIeBnqKq
         A83JGoNGtV00tYY0DOqfXqzMc0ZxpugP61BL2sxCUpaFiQF7zwWZVKI9f5C6tGuZXE3V
         B1MhIs7rY65zayhtojFMKzmV8XSIEeUNlg5T6qjw41iqOcPGlhCLVg+NhYk7nMFs5Z6/
         J89caGNC1vW2sAjpD+ZpRgECo4s81Ct8vmymcqGMFzkH0dARG+RSm1m5s2toDYN1U5XV
         jYAg==
X-Gm-Message-State: APuU4Z++MMKvHsWeaSnFzpII0cnHIiCJO3AAlMn0VwwBaVZBfAP95qXb
	5pWsp/fITJoVUZrUOE0fYXp+j1ozKwinvukP4fki+ylK7y2wW3NN6HyS
X-Gm-Gg: AYBFou0fKNm17Zbda0hx/7kSv/Jffp1jyE5+guYslCLVQ0nE+so/QP+Qa8EI0Q61e6d
	IBewNU/yK3zYUGNkXNeH8LuCrB9mZJ7x9vU9lr7tbKxImmtzbpBiR/3DBqvwhrDhKSxL9x0JcOg
	ftF+JQ8eFjfiD8nc/YeB460TLrZNazLWuoppAbvfjCWHDedFMRhDYt28Dtrh1tbagQO/g6auPh2
	gBsfdBZe/fO2QDh3Q9JJ637cWtCe28tlhgExJ0lBbU1h9UJ+1c1ZCd5Ig6WSvAPsOr2X2Raj2vB
	5wrodYIwvIcX7czPTPu4HkXAhHIKXE5QdeHQQiK6YnCtjfaJMUfNEiQipwhUfZzJGyYj5rxfvMq
	Sr7PF0VY29Wl5TtdGBM4PQd4RhxZ0w+cnmYdEIw5hN0RWEG20IncHcg2E5g0zBQBdnRlvv05M58
	HQGYzU4N55C6nCZndivDCZCOPxolRjYkOv6U9Cunj45N4BQCPm3CvIKcTXWykPwOSzv433jTyuB
	fZWj6CI1VlOk/7isOCd992juL/MEoCoHn0lYoTTjCGh8s6UkIMZRUjnrgVYSmwMMdCMqyVJHQS6
	v6/3mnEpsNNxeo0JvkFOUdzE+AW7kCU4kY4duUyPanRqsw==
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr344638945e9.6.1793722880362;
        Tue, 03 Nov 2026 08:21:20 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm63661075e9.7.2026.11.03.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:21:19 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 17:20:34 +0100
Subject: [PATCH b4 2/3] review: recognize tracked patches merged in
 upstream branch
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-detect-merged-v1-2-743a882c6127@gmail.com>
References: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
In-Reply-To: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793722874; l=52659;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=rHNkvp80+qDXBuXzEEzuqafe8LztuWPHs26NE0Ri0dc=;
 b=otIvdJS6fcI2imrRafRyq32uC9ljBmG95Vy+hBGl2p17U7L/t8CPqZT3X6Y1RsoRUiAO9XrdT
 6VCnoR87fETAAqDpGuREGhbjOvxri9BUpPkIEY4MYAPQvHTIRlRTeTH
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Check upstream history during review updates and mark a
tracked revision merged when all of its patches are found.

Match subjects and authors without requiring identical diffs,
and display the matched prefix in the tracking TUI.

Assisted-by: LLM [codegen, tests]
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 docs/maintainer/review.rst         |  49 ++--
 src/b4/__init__.py                 |   1 +
 src/b4/review/_review.py           | 230 ++++++++++++++++++-
 src/b4/review_tui/_tracking_app.py |  43 +++-
 src/tests/test_review.py           | 184 +++++++++++++++
 src/tests/test_review_tracking.py  | 450 +++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py     |  58 +++++
 7 files changed, 992 insertions(+), 23 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a9e5c4..6070aa0 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -127,12 +127,13 @@ Status         Meaning
 ``partial``    Some patches applied; remainder still under review
 ``accepted``   All patches applied to the target branch
 ``thanked``    Thank-you note sent to the contributor
+``merged``     All patches found in the upstream branch
 ``archived``   Review completed and archived
 ``gone``       Review branch deleted or missing (e.g. after a sync)
 =============  =========================================================
 
 Series are grouped by lifecycle stage — Active (reviewing/replied/
-partial/accepted/thanked), New, Waiting, Snoozed, and Gone — and sorted
+partial/accepted/thanked/merged), New, Waiting, Snoozed, and Gone — and sorted
 within each group by the most recent activity, whether that is a new
 mailing list reply or a local status change. A ``waiting`` series is
 pulled up into the Active group the moment a newer revision is
@@ -153,7 +154,9 @@ Each row in the tracking list shows:
 * **Msgs** — total message count for the thread, with any unseen
   messages shown as ``+N`` in yellow (populated after pressing ``u``)
 * **S** — single-character status symbol, optionally followed by a
-  flag: ``*`` means the tracking data needs a refresh, ``↑`` means a
+  flag. A violet ``✔`` means the tracked revision is merged upstream;
+  the details panel lists matched patch positions. For other statuses,
+  ``*`` means the tracking data needs a refresh, ``↑`` means a
   newer revision is available (upgrade via the action menu). The two
   are mutually exclusive — ``↑`` can only appear once revision data
   has been fetched
@@ -162,9 +165,9 @@ Each row in the tracking list shows:
 
 **Status symbols**
 
-=======  =============
-Symbol   Status
-=======  =============
+=======  ===============
+Symbol    Status
+=======  ===============
 ``★``    new
 ``✎``    reviewing
 ``↩``    replied
@@ -173,8 +176,9 @@ Symbol   Status
 ``◐``    partial
 ``∈``    accepted
 ``✓``    thanked
+``✔``    merged (violet)
 ``∅``    gone
-=======  =============
+=======  ===============
 
 **Keybindings**
 
@@ -882,14 +886,31 @@ Taking action
 
 Upgrading to a newer revision
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-Press ``u`` to update the selected series (or ``U`` for all series) and
-discover new revisions. Updating only *records* what it finds — it
-never changes a series' status behind your back. When a newer revision
-is known, b4 lets you know in several ways: the row gets an ``↑``
-suffix flag in the tracking list, the Revisions line in the details
-panel shows *(vN available — upgrade with [a]ction)*, a ``waiting``
-series surfaces back into the Active group, and the ``up:`` limit
-token can filter the list down to just the upgradable series.
+Press ``u`` to update the selected series (or ``U`` for all series),
+discover new revisions, and check whether patches have landed upstream.
+Updating records new revisions without upgrading the tracked revision.
+It also marks the tracked revision ``merged`` when every patch is found
+upstream, including submissions containing a single patch.
+
+When a newer revision is known, b4 lets you know in several ways:
+the row gets an ``↑`` suffix flag in the tracking list, the Revisions
+line in the details panel shows *(vN available — upgrade with [a]ction)*,
+a ``waiting`` series surfaces back into the Active group, and the ``up:``
+limit token can filter the list down to just the upgradable series.
+
+During an update, b4 matches each mail's subject (without the ``[PATCH]``
+prefix) and author email against upstream commits made no earlier than
+the mail's date. An in-body ``From:`` overrides the mail sender. Diff
+contents are not compared, so maintainer edits do not prevent detection.
+Only a consecutive prefix starting at patch 1 counts as merged; the
+details panel lists its positions. A complete match changes the status
+to ``merged``, shown by a violet tick in the ``S`` column. Snoozed,
+archived, and gone entries retain their status.
+
+B4 uses an ``upstream`` remote or discovers the parent of a GitHub
+``origin``. It checks ``staging``, ``main``, and ``master`` in that order,
+falling back to the remote's ``HEAD`` (normally its default branch). A
+failed lookup or fetch leaves the previous indicators unchanged.
 
 Upgrading itself is always an explicit action: open the action menu
 (``a``) and select **Upgrade**. Availability depends only on a newer
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a254a2f..79bb209 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -256,6 +256,7 @@ REVIEW_SERIES_STATUSES: Tuple[str, ...] = (
     'queued',
     'snoozed',
     'thanked',
+    'merged',
     'gone',
     'archived',
 )
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f0..4cf4174 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -49,6 +49,40 @@ NO_COVER_NOTE = 'NOTE: No cover letter provided by the author.'
 _REPLY_CONTEXT_LINES = 5
 
 
+class UpstreamCommit(NamedTuple):
+    commit: str
+    author_name: str
+    author_email: str
+    committed_at: int
+
+
+def _match_upstream_commit(
+    patch: b4.LoreMessage, upstream_commits: Dict[str, List[UpstreamCommit]]
+) -> Optional[str]:
+    candidates = upstream_commits.get(patch.subject, [])
+    if not candidates or not patch.msg.get('Date'):
+        return None
+    try:
+        sent_at = email.utils.parsedate_to_datetime(str(patch.msg['Date']))
+    except (TypeError, ValueError):
+        return None
+    if sent_at.tzinfo is None:
+        sent_at = sent_at.replace(tzinfo=datetime.timezone.utc)
+    info, _message, _diff = b4.get_mailinfo(
+        patch.msg.as_bytes(policy=b4.emlpolicy), scissors=False
+    )
+    author_email = info.get('Email', '')
+    if not author_email:
+        return None
+    for commit in candidates:
+        if (
+            commit.author_email.casefold() == author_email.casefold()
+            and commit.committed_at >= sent_at.timestamp()
+        ):
+            return commit.commit
+    return None
+
+
 def _strip_subject(text: str) -> List[str]:
     """Return the body lines of a commit/cover message.
 
@@ -2578,11 +2612,12 @@ def update_series_tracking(
     identifier: str,
     linkmask: str,
     topdir: Optional[str] = None,
+    upstream_commits: Optional[Dict[str, List[UpstreamCommit]]] = None,
 ) -> Dict[str, Any]:
     """Fetch thread, discover revisions, update trailers for one series.
 
-    Returns {'new_revisions': int, 'new_trailers': int,
-             'error': Optional[str]}.
+    Returns discovered revision/trailer counts and an optional error. When an
+    upstream commit map is supplied, also returns ``merged_patches``.
     """
     result: Dict[str, Any] = {
         'new_revisions': 0,
@@ -2722,6 +2757,49 @@ def update_series_tracking(
         att = check_series_attestation(lser_att)
         b4.review.tracking.update_attestation(identifier, change_id, current_rev, att)
 
+    merge_status: Optional[Dict[int, Tuple[Optional[str], Optional[str]]]] = None
+    fully_merged = False
+    if upstream_commits is not None and lser is not None and lser.complete:
+        patch_status: Dict[int, Tuple[Optional[str], Optional[str]]] = {}
+        matching_prefix = True
+        for position, patch in enumerate(lser.patches[1:], start=1):
+            commit = (
+                _match_upstream_commit(patch, upstream_commits)
+                if patch is not None and matching_prefix
+                else None
+            )
+            matching_prefix = matching_prefix and commit is not None
+            patch_status[position] = (None, commit)
+        merged_count = sum(1 for _patch_id, commit in patch_status.values() if commit)
+        fully_merged = merged_count == lser.expected and lser.expected > 0
+        try:
+            conn = b4.review.tracking.get_db(identifier)
+            if not b4.review.tracking.get_series_patches(conn, change_id, current_rev):
+                b4.review.tracking.add_series_patches(
+                    conn, change_id, current_rev, lser
+                )
+            b4.review.tracking.set_series_patch_merge_status(
+                conn, change_id, current_rev, patch_status
+            )
+            if fully_merged:
+                current_status = conn.execute(
+                    'SELECT status FROM series WHERE change_id = ? AND revision = ?',
+                    (change_id, current_rev),
+                ).fetchone()
+                if current_status and current_status['status'] not in (
+                    'snoozed',
+                    'gone',
+                    'archived',
+                ):
+                    b4.review.tracking.update_series_status(
+                        conn, change_id, 'merged', revision=current_rev
+                    )
+            conn.close()
+            merge_status = patch_status
+            result['merged_patches'] = merged_count
+        except Exception as ex:
+            logger.warning('Could not update upstream merge status: %s', ex)
+
     # Record all discovered revisions in SQLite through the shared helper, so
     # a revision is identified by its cover letter when the author sent one.
     # Recording them here by hand picked the first present patch of the raw,
@@ -2748,8 +2826,8 @@ def update_series_tracking(
     # Note: [u]pdate deliberately does NOT mutate a waiting series' status.
     # Discovering a newer version records it (above) and lights up the
     # has_newer signal, which the UI surfaces and the upgrade action acts on
-    # explicitly; status is only ever changed by an explicit user action, not
-    # as a side effect of updating.  Do not re-add auto-promotion here.
+    # explicitly. Upstream merge detection is separate: a fully merged
+    # tracked revision can move to merged without upgrading it.
 
     if update_branch and topdir:
         wantver = current_rev
@@ -2890,6 +2968,25 @@ def update_series_tracking(
         except Exception as ex:
             logger.warning('Could not update message counts: %s', ex)
 
+    if merge_status is not None and topdir and b4.git_branch_exists(topdir, branch):
+        if not b4.git_branch_checked_out(topdir, branch):
+            try:
+                cover_text, tracking = load_tracking(topdir, branch)
+                t_series = tracking['series']
+                previous = dict(t_series)
+                t_series['merged-commits'] = {
+                    str(position): commit
+                    for position, (_patch_id, commit) in merge_status.items()
+                    if commit is not None
+                }
+                if fully_merged and status not in ('snoozed', 'gone', 'archived'):
+                    t_series['status'] = 'merged'
+                if previous != t_series:
+                    if not save_tracking_ref(topdir, branch, cover_text, tracking):
+                        result['error'] = 'Error saving upstream merge status'
+            except (Exception, SystemExit) as ex:
+                result['error'] = f'Could not save upstream merge status: {ex}'
+
     return result
 
 
@@ -2903,6 +3000,98 @@ def _get_update_lock_path(identifier: str) -> str:
     return os.path.join(reviewdir, f'{identifier}.update.lock')
 
 
+def _resolve_upstream_repository(topdir: str) -> str:
+    """Resolve an upstream URL, remote name, or GitHub origin's parent URL."""
+    remotes = b4.git_get_command_lines(topdir, ['remote'])
+    if 'upstream' in remotes:
+        ecode, url = b4.git_run_command(topdir, ['remote', 'get-url', 'upstream'])
+        if ecode == 0 and url.strip():
+            return url.strip()
+
+    if 'origin' not in remotes:
+        raise RuntimeError('No upstream remote or origin remote')
+    ecode, origin = b4.git_run_command(topdir, ['remote', 'get-url', 'origin'])
+    if ecode != 0:
+        raise RuntimeError('Could not resolve origin remote')
+    location = b4.parse_repo_location(origin.strip())
+    if not location or location[0] != 'github.com':
+        raise RuntimeError('Cannot discover a parent repository for this origin')
+    repo_path = location[1].strip('/').removesuffix('.git')
+    try:
+        response = b4.get_requests_session().get(
+            f'https://api.github.com/repos/{repo_path}', timeout=(3, 10)
+        )
+        response.raise_for_status()
+        parent_info = response.json().get('parent') or {}
+        parent = parent_info.get('full_name')
+    except Exception as ex:
+        raise RuntimeError(f'Could not discover the GitHub parent: {ex}') from ex
+    if not parent:
+        return origin.strip()
+    return f'https://github.com/{parent}.git'
+
+
+def _resolve_upstream_branch(topdir: str, repository: str) -> str:
+    """Resolve the branch to scan in the selected upstream repository."""
+    ecode, output = b4.git_run_command(
+        topdir,
+        ['ls-remote', '--heads', repository, 'staging', 'main', 'master'],
+        logstderr=True,
+    )
+    if ecode != 0:
+        raise RuntimeError(output.strip() or 'Could not list upstream branches')
+    refs = {line.split()[-1] for line in output.splitlines() if line.split()}
+    for branch in ('staging', 'main', 'master'):
+        if f'refs/heads/{branch}' in refs:
+            return branch
+    # Git resolves the remote's symbolic HEAD to its default branch on fetch.
+    return 'HEAD'
+
+
+def _fetch_upstream_commits(
+    topdir: str, repository: str, since: str, branch: str = 'HEAD'
+) -> Dict[str, List[UpstreamCommit]]:
+    """Fetch the upstream branch and index commit metadata by subject."""
+    ref = 'refs/b4/upstream-merge-check'
+    ecode, output = b4.git_run_command(
+        topdir,
+        [
+            'fetch',
+            '--quiet',
+            '--no-tags',
+            '--no-write-fetch-head',
+            '--no-recurse-submodules',
+            f'--shallow-since={since}',
+            repository,
+            f'+{branch}:{ref}',
+        ],
+        logstderr=True,
+    )
+    if ecode != 0:
+        raise RuntimeError(output.strip() or 'git fetch failed')
+
+    ecode, output = b4.git_run_command(
+        topdir,
+        [
+            'log',
+            '--no-merges',
+            f'--since={since}',
+            '--format=%H%x00%an%x00%ae%x00%ct%x00%s',
+            ref,
+            '--',
+        ],
+    )
+    if ecode != 0:
+        raise RuntimeError(output.strip() or 'Could not read fetched upstream history')
+    matches: Dict[str, List[UpstreamCommit]] = {}
+    for line in output.splitlines():
+        commit, name, address, committed_at, subject = line.split('\x00', 4)
+        matches.setdefault(subject, []).append(
+            UpstreamCommit(commit, name, address, int(committed_at))
+        )
+    return matches
+
+
 def update_all_tracking(
     identifier: str,
     linkmask: str,
@@ -2926,7 +3115,8 @@ def update_all_tracking(
 
     Returns a summary dict with keys: series_checked, series_updated,
     errors, gone, followup_updated, checked_out_skipped, upstream,
-    error_details, cancelled.  ``upstream`` counts the series that
+    error_details, cancelled, merged_patches, upstream_merge_error.
+    ``upstream`` counts the series that
     needed at least one answer from the upstream archive of a partial
     mirror (b4.midmask), because the mirror did not have them.
     """
@@ -2940,6 +3130,8 @@ def update_all_tracking(
         'upstream': 0,
         'error_details': [],
         'cancelled': False,
+        'merged_patches': 0,
+        'upstream_merge_error': None,
     }
 
     with b4.lockfile_nb(_get_update_lock_path(identifier)):
@@ -2959,6 +3151,24 @@ def update_all_tracking(
                 if s.get('status') not in ('snoozed', 'archived')
             ]
 
+        upstream_commits: Optional[Dict[str, List[UpstreamCommit]]] = None
+        if topdir and series_list:
+            try:
+                repository = _resolve_upstream_repository(topdir)
+                branch = _resolve_upstream_branch(topdir, repository)
+                oldest_sent = min(
+                    datetime.date.fromisoformat(
+                        str(series.get('sent_at') or '1970-01-01')[:10]
+                    )
+                    for series in series_list
+                )
+                since = (oldest_sent - datetime.timedelta(days=365)).isoformat()
+                upstream_commits = _fetch_upstream_commits(
+                    topdir, repository, since, branch
+                )
+            except Exception as ex:
+                result['upstream_merge_error'] = str(ex)
+
         total = len(series_list)
         for i, series in enumerate(series_list):
             if cancel_cb and cancel_cb():
@@ -2972,9 +3182,16 @@ def update_all_tracking(
             try:
                 # Called via the package attribute: it is the established
                 # patch seam for tests and TUI callers alike
+                update_kwargs = {}
+                if upstream_commits is not None:
+                    update_kwargs['upstream_commits'] = upstream_commits
                 with b4.track_lore_sources() as sources:
                     r = b4.review.update_series_tracking(
-                        series, identifier, linkmask, topdir=topdir
+                        series,
+                        identifier,
+                        linkmask,
+                        topdir=topdir,
+                        **update_kwargs,
                     )
             except liblore.OperationCancelledError:
                 result['cancelled'] = True
@@ -2992,6 +3209,7 @@ def update_all_tracking(
                 result['checked_out_skipped'] += 1
             if r.get('counts_updated'):
                 result['followup_updated'] += 1
+            result['merged_patches'] += r.get('merged_patches', 0)
 
             if progress_cb:
                 progress_cb(i + 1, total, subject)
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index d2621c0..df8f08d 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -134,6 +134,7 @@ _STATUS_SYMBOLS: Dict[str, str] = {
     'queued': '◷',  # U+25F7 white circle with upper right quadrant
     'snoozed': '⏸',  # U+23F8 double vertical bar
     'thanked': '✓',  # U+2713 check mark
+    'merged': '✔',  # U+2714 check mark; upstream-merged series
     'gone': 'ø',  # U+00F8 latin small letter o with stroke
 }
 
@@ -151,6 +152,7 @@ _STATUS_TIER: Dict[str, int] = {
     'snoozed': 2,
     'waiting': 2,
     'thanked': 2,
+    'merged': 2,
     'gone': 2,
 }
 
@@ -1003,7 +1005,9 @@ class TrackedSeriesItem(ListItem):
             f'{msgs_badge:<{self.msgs_badge_w}s}' if self.msgs_badge_w else '',
             style=accent if msgs_badge else '',
         )
-        label.append(f'  {symbol}{flag}  ')
+        label.append('  ')
+        label.append(symbol, style='#a855f7' if effective == 'merged' else '')
+        label.append(f'{flag}  ')
         label.append(prefix_head)
         label.append(ver_token, style=accent if ver_accent else '')
         label.append(prefix_tail)
@@ -1246,6 +1250,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             with Horizontal(classes='details-row', id='detail-attestation-row'):
                 yield Static('Attestation:', classes='details-label')
                 yield Static('', id='detail-attestation')
+            with Horizontal(classes='details-row', id='detail-merged-row'):
+                yield Static('Merged:', classes='details-label')
+                yield Static('', id='detail-merged', markup=False)
             with Horizontal(classes='details-row'):
                 yield Static('Sent:', classes='details-label')
                 yield Static('', id='detail-sent', markup=False)
@@ -2498,6 +2505,19 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             else:
                 att_row.display = False
 
+        merged_count = series.get('merged_patch_count', 0)
+        merged_row = self.query_one('#detail-merged-row', Horizontal)
+        merged_row.display = merged_count > 0
+        if merged_count:
+            total_patches = series.get('num_patches', 0) or 0
+            merged_positions = ', '.join(
+                str(position) for position in series.get('merged_patch_positions', [])
+            )
+            patch_label = 'patch' if merged_count == 1 else 'patches'
+            self.query_one('#detail-merged', Static).update(
+                f'{patch_label} {merged_positions} of {total_patches} merged upstream'
+            )
+
         # Show known revisions (precomputed in _load_series)
         revisions_row = self.query_one('#detail-revisions-row', Horizontal)
         revs = series.get('_revisions', [])
@@ -2700,7 +2720,10 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         self._focus_change_id = self._selected_series.get('change_id')
         self.push_screen(
             UpdateAllScreen(
-                [self._selected_series], self._identifier, linkmask, topdir
+                [self._selected_series],
+                self._identifier,
+                linkmask,
+                topdir,
             ),
             callback=self._on_update_complete,
         )
@@ -2721,7 +2744,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         if self._selected_series:
             self._focus_change_id = self._selected_series.get('change_id')
         self.push_screen(
-            UpdateAllScreen(update_list, self._identifier, linkmask, topdir),
+            UpdateAllScreen(
+                update_list,
+                self._identifier,
+                linkmask,
+                topdir,
+            ),
             callback=self._on_update_complete,
         )
 
@@ -2749,6 +2777,9 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             parts.append(f'{updated} updated')
         if errors:
             parts.append(f'{errors} error(s)')
+        merged_patches = result.get('merged_patches', 0)
+        if merged_patches:
+            parts.append(f'{merged_patches} merged patch(es) on upstream')
         skipped = result.get('checked_out_skipped', 0)
         if skipped:
             parts.append(f'{skipped} checked-out branch(es) left alone')
@@ -2757,6 +2788,12 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             'warning' if errors else 'information'
         )
         self.notify(', '.join(parts), severity=severity)
+        upstream_merge_error = result.get('upstream_merge_error')
+        if upstream_merge_error:
+            self.notify(
+                f'Could not check upstream merges: {upstream_merge_error}',
+                severity='warning',
+            )
         upstream = result.get('upstream', 0)
         if upstream:
             # A partial mirror sends what it lacks upstream, and each of
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index e40dd35..ce658c2 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4584,6 +4584,190 @@ def test_update_all_tracking_skips_snoozed_and_archived(
     assert result['cancelled'] is False
 
 
+def test_update_all_tracking_fetches_upstream_once(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    from b4.review import _review
+
+    series = [
+        {
+            'change_id': 'a',
+            'subject': 's-a',
+            'status': 'new',
+            'sender_name': 'A',
+            'sent_at': '2026-03-01T00:00:00+00:00',
+        },
+        {
+            'change_id': 'b',
+            'subject': 's-b',
+            'status': 'new',
+            'sender_name': 'B',
+            'sent_at': '2026-04-01T00:00:00+00:00',
+        },
+    ]
+    monkeypatch.setattr(
+        b4.review.tracking, 'rescan_branches', lambda identifier, topdir: {}
+    )
+    monkeypatch.setattr(_review, '_resolve_upstream_repository', lambda *args: 'repo')
+    monkeypatch.setattr(_review, '_resolve_upstream_branch', lambda *args: 'staging')
+    upstream = {'subject': [_review.UpstreamCommit('commit-id', 'Author', 'a@b', 1)]}
+    fetch = mock.Mock(return_value=upstream)
+    monkeypatch.setattr(_review, '_fetch_upstream_commits', fetch)
+    seen = []
+
+    def fake_update(
+        one: Dict[str, Any],
+        identifier: str,
+        linkmask: str,
+        topdir: Optional[str] = None,
+        upstream_commits: Optional[Dict[str, List[_review.UpstreamCommit]]] = None,
+    ) -> Dict[str, Any]:
+        seen.append(upstream_commits)
+        return {
+            'new_revisions': 0,
+            'new_trailers': 0,
+            'error': None,
+            'merged_patches': 1,
+        }
+
+    monkeypatch.setattr(review, 'update_series_tracking', fake_update)
+    result = review.update_all_tracking(
+        'upstream-sweep',
+        'https://lore.example/r/%s',
+        topdir='/repo',
+        series_list=series,
+    )
+
+    fetch.assert_called_once_with('/repo', 'repo', '2025-03-01', 'staging')
+    assert seen == [upstream, upstream]
+    assert result['merged_patches'] == 2
+
+
+@pytest.mark.parametrize(
+    'branches, expected',
+    [
+        (['master', 'main', 'staging'], 'staging'),
+        (['master', 'main'], 'main'),
+        (['master'], 'master'),
+    ],
+)
+def test_resolve_upstream_branch_prefers_available_branch(
+    gitdir: str, branches: List[str], expected: str
+) -> None:
+    for branch in branches:
+        ecode, _out = b4.git_run_command(
+            gitdir, ['update-ref', f'refs/heads/{branch}', 'HEAD']
+        )
+        assert ecode == 0
+    assert _review._resolve_upstream_branch(gitdir, gitdir) == expected
+
+
+def test_upstream_head_fetches_remote_default_branch(gitdir: str) -> None:
+    ecode, _out = b4.git_run_command(gitdir, ['branch', 'custom-default', 'HEAD'])
+    assert ecode == 0
+    ecode, _out = b4.git_run_command(
+        gitdir, ['symbolic-ref', 'HEAD', 'refs/heads/custom-default']
+    )
+    assert ecode == 0
+    for branch in ('staging', 'main', 'master'):
+        b4.git_run_command(gitdir, ['update-ref', '-d', f'refs/heads/{branch}'])
+    branch = _review._resolve_upstream_branch(gitdir, gitdir)
+    assert branch == 'HEAD'
+    assert _review._fetch_upstream_commits(gitdir, gitdir, '1970-01-01', branch)
+
+
+def test_resolve_upstream_branch_reports_lookup_failure(
+    gitdir: str, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    git = mock.Mock(return_value=(1, 'repository unavailable'))
+    monkeypatch.setattr(b4, 'git_run_command', git)
+    with pytest.raises(RuntimeError, match='repository unavailable'):
+        _review._resolve_upstream_branch(gitdir, 'selected-repo')
+
+
+def test_update_all_tracking_continues_when_upstream_fetch_fails(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    series = [
+        {'change_id': 'a', 'subject': 's-a', 'status': 'new', 'sender_name': 'A'}
+    ]
+    monkeypatch.setattr(
+        b4.review.tracking, 'rescan_branches', lambda identifier, topdir: {}
+    )
+    from b4.review import _review
+
+    monkeypatch.setattr(
+        _review,
+        '_resolve_upstream_repository',
+        mock.Mock(side_effect=RuntimeError('upstream offline')),
+    )
+    updates = []
+
+    def fake_update(
+        one: Dict[str, Any],
+        identifier: str,
+        linkmask: str,
+        topdir: Optional[str] = None,
+    ) -> Dict[str, Any]:
+        updates.append(one['change_id'])
+        return {'new_revisions': 0, 'new_trailers': 0, 'error': None}
+
+    monkeypatch.setattr(review, 'update_series_tracking', fake_update)
+    result = review.update_all_tracking(
+        'upstream-offline',
+        'https://lore.example/r/%s',
+        topdir='/repo',
+        series_list=series,
+    )
+
+    assert updates == ['a']
+    assert result['upstream_merge_error'] == 'upstream offline'
+    assert result['series_checked'] == 1
+
+
+def test_resolve_upstream_repository_uses_upstream_remote(gitdir: str) -> None:
+    remote_url = 'https://example.com/project/upstream.git'
+    ecode, _out = b4.git_run_command(gitdir, ['remote', 'add', 'upstream', remote_url])
+    assert ecode == 0
+
+    assert _review._resolve_upstream_repository(gitdir) == remote_url
+
+
+def test_resolve_upstream_repository_discovers_github_parent(gitdir: str) -> None:
+    b4.git_run_command(gitdir, ['remote', 'remove', 'origin'])
+    ecode, _out = b4.git_run_command(
+        gitdir, ['remote', 'add', 'origin', 'git@github.com:fork/project.git']
+    )
+    assert ecode == 0
+    response = mock.Mock()
+    response.json.return_value = {'parent': {'full_name': 'project-org/project'}}
+
+    with mock.patch.object(
+        b4,
+        'get_requests_session',
+        return_value=mock.Mock(get=mock.Mock(return_value=response)),
+    ) as get_session:
+        repository = _review._resolve_upstream_repository(gitdir)
+
+    assert repository == 'https://github.com/project-org/project.git'
+    get_session.return_value.get.assert_called_once_with(
+        'https://api.github.com/repos/fork/project', timeout=(3, 10)
+    )
+
+
+def test_resolve_upstream_repository_uses_non_fork_github_origin(gitdir: str) -> None:
+    origin = 'git@github.com:project-org/project.git'
+    b4.git_run_command(gitdir, ['remote', 'remove', 'origin'])
+    ecode, _out = b4.git_run_command(gitdir, ['remote', 'add', 'origin', origin])
+    assert ecode == 0
+    response = mock.Mock()
+    response.json.return_value = {'parent': None}
+    with mock.patch.object(
+        b4, 'get_requests_session', return_value=mock.Mock(get=mock.Mock(return_value=response))
+    ):
+        assert _review._resolve_upstream_repository(gitdir) == origin
+
+
 def test_update_all_tracking_counts_upstream(
     monkeypatch: pytest.MonkeyPatch,
 ) -> None:
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index ab1f3d3..29de5c1 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -17,6 +17,7 @@ pytest.importorskip('textual')
 import b4
 import b4.review
 import liblore
+from b4.review import _review
 from b4.review import checks as review_checks
 from b4.review import messages as review_messages
 from b4.review import tracking as review_tracking
@@ -73,6 +74,43 @@ class TestDbOperations:
         assert version == review_tracking.SCHEMA_VERSION
         conn.close()
 
+    def test_get_db_migrates_patch_merge_columns(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = sqlite3.connect(
+            review_tracking.get_db_path('patch-merge-migration-test')
+        )
+        conn.executescript(
+            """
+            CREATE TABLE schema_version (version INTEGER PRIMARY KEY);
+            INSERT INTO schema_version VALUES (10);
+            CREATE TABLE series_patches (
+                change_id TEXT NOT NULL,
+                revision INTEGER NOT NULL,
+                position INTEGER NOT NULL,
+                message_id TEXT NOT NULL,
+                subject TEXT,
+                PRIMARY KEY (change_id, revision, position)
+            );
+            """
+        )
+        conn.execute(
+            'INSERT INTO series_patches VALUES (?, ?, ?, ?, ?)',
+            ('change-merge', 1, 1, 'patch@example.com', 'patch subject'),
+        )
+        conn.commit()
+        conn.close()
+
+        conn = review_tracking.get_db('patch-merge-migration-test')
+        columns = {row[1] for row in conn.execute('PRAGMA table_info(series_patches)')}
+        version = conn.execute('SELECT version FROM schema_version').fetchone()[0]
+        patch = review_tracking.get_series_patches(conn, 'change-merge', 1)[0]
+        conn.close()
+        assert {'patch_id', 'merged_commit'} <= columns
+        assert version == review_tracking.SCHEMA_VERSION
+        assert patch['message_id'] == 'patch@example.com'
+        assert patch['merged_commit'] is None
+
     def test_db_exists(self, tmp_path: pytest.TempPathFactory) -> None:
         """Verify db_exists returns correct values."""
         assert not review_tracking.db_exists('nonexistent')
@@ -319,6 +357,43 @@ class TestDbOperations:
         assert result[1]['subject'] == 'First series'
         assert result[1]['revision'] == 1
 
+    def test_get_all_tracked_series_includes_merged_patch_count(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('all-series-merged-test')
+        review_tracking.add_series_to_db(
+            conn,
+            'change-merged',
+            1,
+            'Merged series',
+            'Author',
+            'author@example.com',
+            '2024-01-15T10:00:00+00:00',
+            'merged@example.com',
+            2,
+        )
+        _insert_patches(
+            conn,
+            'change-merged',
+            1,
+            ['patch-1@example.com', 'patch-2@example.com'],
+        )
+        review_tracking.set_series_patch_merge_status(
+            conn,
+            'change-merged',
+            1,
+            {
+                1: ('patch-id-1', 'upstream-commit-1'),
+                2: ('patch-id-2', None),
+            },
+        )
+        conn.close()
+
+        series = review_tracking.get_all_tracked_series('all-series-merged-test')
+
+        assert series[0]['merged_patch_positions'] == [1]
+        assert series[0]['merged_patch_count'] == 1
+
     def test_queries_against_nonexistent_db(
         self, tmp_path: pytest.TempPathFactory
     ) -> None:
@@ -1106,6 +1181,72 @@ class TestRevisions:
         assert review_tracking.get_all_revisions_grouped(conn) == {}
         conn.close()
 
+    def test_patch_merge_status_is_refreshed_per_position(
+        self, tmp_path: pytest.TempPathFactory
+    ) -> None:
+        conn = review_tracking.init_db('rev-patch-merge-test')
+        _insert_patches(
+            conn,
+            'change-merge',
+            1,
+            ['patch-1@example.com', 'patch-2@example.com'],
+        )
+
+        review_tracking.set_series_patch_merge_status(
+            conn,
+            'change-merge',
+            1,
+            {
+                1: ('patch-id-1', 'upstream-commit-1'),
+                2: ('patch-id-2', None),
+            },
+        )
+        patches = review_tracking.get_series_patches(conn, 'change-merge', 1)
+        assert [p['merged_commit'] for p in patches] == [
+            'upstream-commit-1',
+            None,
+        ]
+
+        review_tracking.set_series_patch_merge_status(
+            conn,
+            'change-merge',
+            1,
+            {
+                1: ('patch-id-1', None),
+                2: ('patch-id-2', 'upstream-commit-2'),
+            },
+        )
+        patches = review_tracking.get_series_patches(conn, 'change-merge', 1)
+        conn.close()
+        assert [p['merged_commit'] for p in patches] == [
+            None,
+            'upstream-commit-2',
+        ]
+
+    def test_upstream_fetch_maps_subjects_to_commits(self, gitdir: str) -> None:
+        from b4.review import _review
+
+        branch = create_review_branch(
+            gitdir, 'upstream-merge-detection', with_patch=True
+        )
+        subject = 'upstream-merge-detection: tweak file1'
+        ecode, _out = b4.git_run_command(
+            gitdir, ['symbolic-ref', 'HEAD', f'refs/heads/{branch}']
+        )
+        assert ecode == 0
+        matches = _review._fetch_upstream_commits(gitdir, gitdir, '1970-01-01')
+        assert matches[subject][0].commit == branch.patch_shas[0]
+        assert matches[subject][0].author_email
+        assert matches[subject][0].committed_at > 0
+
+        ecode, _out = b4.git_run_command(
+            gitdir,
+            ['update-ref', f'refs/heads/{branch}', branch.base_sha],
+        )
+        assert ecode == 0
+        matches = _review._fetch_upstream_commits(gitdir, gitdir, '1970-01-01')
+        assert subject not in matches
+
     def test_get_all_newest_revisions(self, tmp_path: pytest.TempPathFactory) -> None:
         """Verify bulk newest-revision query returns all change_ids."""
         conn = review_tracking.init_db('rev-bulk-newest-test')
@@ -2764,6 +2905,315 @@ class TestUpdateSeriesTrackingCounts:
         assert row['message_count'] == 7
         assert row['seen_message_count'] == 5
 
+    @pytest.mark.parametrize('matched_positions', [[1], [2], [3], [1, 3], [1, 2]])
+    def test_update_records_which_lore_patches_are_upstream(
+        self,
+        matched_positions: List[int],
+    ) -> None:
+        identifier = 'merged-patch-update-test'
+        change_id = 'merged-patch-update'
+        msgs = _series_msgs(change_id, AUTHOR, 1, 3, cover=True)
+        lmbx = b4.LoreMailbox()
+        for msg in msgs:
+            lmbx.add_message(msg)
+        lser = lmbx.get_series(1)
+        assert lser is not None
+
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'Merged patch test',
+            'Author',
+            'author@example.com',
+            '2026-03-19T00:00:00+00:00',
+            'merged-patch-update-p0@example.com',
+            3,
+        )
+        review_tracking.add_series_patches(conn, change_id, 1, lser)
+        conn.close()
+
+        upstream = {
+            patch.subject: [
+                _review.UpstreamCommit(
+                    f'upstream-{position}',
+                    patch.fromname,
+                    patch.fromemail,
+                    int(patch.date.timestamp()) + 3600,
+                )
+            ]
+            for position, patch in enumerate(lser.patches[1:], 1)
+            if patch is not None and position in matched_positions
+        }
+        series = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': 'new',
+            'message_id': 'merged-patch-update-p0@example.com',
+        }
+        with (
+            mock.patch('b4.can_network', False),
+            mock.patch('b4.review._review.retrieve_series_messages', return_value=msgs),
+            mock.patch('b4.review._review.check_series_attestation', return_value=None),
+        ):
+            result = b4.review.update_series_tracking(
+                series,
+                identifier,
+                'https://example.com/%s',
+                upstream_commits=upstream,
+            )
+
+        conn = review_tracking.get_db(identifier)
+        patches = review_tracking.get_series_patches(conn, change_id, 1)
+        rows = conn.execute(
+            'SELECT status FROM series WHERE change_id = ? AND revision = ?',
+            (change_id, 1),
+        ).fetchone()
+        conn.close()
+        prefix = 0
+        while prefix + 1 in matched_positions:
+            prefix += 1
+        assert result['merged_patches'] == prefix
+        assert [patch['merged_commit'] for patch in patches] == [None] + [
+            f'upstream-{position}' if position <= prefix else None
+            for position in range(1, 4)
+        ]
+        assert rows[0] == 'new'
+
+    def test_update_marks_series_merged_when_all_patches_are_upstream(self) -> None:
+        identifier = 'all-merged-status-test'
+        change_id = 'all-merged-status'
+        msgs = _series_msgs(change_id, AUTHOR, 1, 2, cover=True)
+        lmbx = b4.LoreMailbox()
+        for msg in msgs:
+            lmbx.add_message(msg)
+        lser = lmbx.get_series(1)
+        assert lser is not None
+
+        upstream = {
+            patch.subject: [
+                _review.UpstreamCommit(
+                    f'upstream-{idx}',
+                    patch.fromname,
+                    patch.fromemail,
+                    int(patch.date.timestamp()) + 3600,
+                )
+            ]
+            for idx, patch in enumerate(lser.patches[1:], start=1)
+            if patch is not None
+        }
+        assert len(upstream) == 2
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            'Merged status test',
+            'Author',
+            'author@example.com',
+            '2026-03-19T00:00:00+00:00',
+            'all-merged-status-p0@example.com',
+            2,
+        )
+        review_tracking.add_series_patches(conn, change_id, 1, lser)
+        conn.close()
+
+        series = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': 'reviewing',
+            'message_id': 'all-merged-status-p0@example.com',
+        }
+        with (
+            mock.patch('b4.can_network', False),
+            mock.patch('b4.review._review.retrieve_series_messages', return_value=msgs),
+            mock.patch('b4.review._review.check_series_attestation', return_value=None),
+        ):
+            result = b4.review.update_series_tracking(
+                series,
+                identifier,
+                'https://example.com/%s',
+                upstream_commits=upstream,
+            )
+
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            'SELECT status FROM series WHERE change_id = ? AND revision = ?',
+            (change_id, 1),
+        ).fetchone()
+        conn.close()
+        assert result['merged_patches'] == 2
+        assert row[0] == 'merged'
+
+    @pytest.mark.parametrize('cover', [False, True])
+    @pytest.mark.parametrize('checked_out', [False, True])
+    def test_update_marks_single_patch_merged_without_matching_diff(
+        self,
+        gitdir: str,
+        cover: bool,
+        checked_out: bool,
+    ) -> None:
+        identifier = 'single-merged-status-test'
+        change_id = 'single-merged-status'
+        msgs = _series_msgs(change_id, AUTHOR, 1, 1, cover=cover)
+        if not cover:
+            msgs[0].replace_header('Subject', f'[PATCH] {change_id}: part 1')
+        lmbx = b4.LoreMailbox()
+        for msg in msgs:
+            lmbx.add_message(msg)
+        lser = lmbx.get_series(1)
+        assert lser is not None and lser.complete and lser.expected == 1
+        patch = lser.patches[1]
+        assert patch is not None
+
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            change_id,
+            1,
+            patch.subject,
+            patch.fromname,
+            patch.fromemail,
+            patch.date.isoformat(),
+            patch.msgid,
+            1,
+        )
+        review_tracking.update_series_status(conn, change_id, 'reviewing')
+        conn.close()
+        tracking = make_tracking_data(
+            change_id,
+            identifier=identifier,
+            subject=patch.subject,
+            patches=[
+                {
+                    'title': patch.subject,
+                    'header-info': {'msgid': patch.msgid},
+                }
+            ],
+        )
+        branch = create_review_branch(
+            gitdir,
+            change_id,
+            tracking_data=tracking,
+            checkout=checked_out,
+        )
+        before_sha = b4.git_revparse_obj(branch, gitdir)
+        upstream = {
+            patch.subject: [
+                _review.UpstreamCommit(
+                    'upstream-single',
+                    patch.fromname,
+                    patch.fromemail,
+                    int(patch.date.timestamp()) + 3600,
+                ),
+            ],
+        }
+        series = {
+            'change_id': change_id,
+            'revision': 1,
+            'status': 'reviewing',
+            'message_id': patch.msgid,
+        }
+        with (
+            mock.patch('b4.can_network', False),
+            mock.patch('b4.review._review.retrieve_series_messages', return_value=msgs),
+            mock.patch('b4.review._review.check_series_attestation', return_value=None),
+        ):
+            result = b4.review.update_series_tracking(
+                series,
+                identifier,
+                'https://example.com/%s',
+                topdir=gitdir,
+                upstream_commits=upstream,
+            )
+
+        conn = review_tracking.get_db(identifier)
+        conn.execute(
+            'UPDATE series SET branch_sha = NULL WHERE change_id = ?',
+            (change_id,),
+        )
+        conn.commit()
+        conn.close()
+        review_tracking.rescan_branches(identifier, gitdir, branch=branch)
+        conn = review_tracking.get_db(identifier)
+        row = conn.execute(
+            'SELECT status FROM series WHERE change_id = ?',
+            (change_id,),
+        ).fetchone()
+        patches = review_tracking.get_series_patches(conn, change_id, 1)
+        conn.close()
+        assert result['merged_patches'] == 1
+        assert result.get('error') is None
+        assert row['status'] == 'merged'
+        assert patches[0]['merged_commit'] == 'upstream-single'
+        if checked_out:
+            assert b4.git_revparse_obj(branch, gitdir) == before_sha
+        else:
+            _, saved = b4.review.load_tracking(gitdir, branch)
+            assert saved['series']['status'] == 'merged'
+            assert saved['series']['merged-commits'] == {'1': 'upstream-single'}
+
+    @pytest.mark.parametrize(
+        'body_author, commit_email, subject_suffix, offset, date, matches',
+        [
+            (None, 'submitter@example.com', '', 1, None, True),
+            (None, 'SUBMITTER@example.com', '', 1, None, True),
+            (None, 'other@example.com', '', 1, None, False),
+            (None, 'submitter@example.com', ' extra', 1, None, False),
+            (None, 'submitter@example.com', '', -1, None, False),
+            (None, 'submitter@example.com', '', 1, 'not a date', False),
+            (None, 'submitter@example.com', '', 1, '', False),
+            (
+                'Original <original@example.com>',
+                'original@example.com',
+                '',
+                1,
+                None,
+                True,
+            ),
+            (
+                'Original <original@example.com>',
+                'submitter@example.com',
+                '',
+                1,
+                None,
+                False,
+            ),
+        ],
+    )
+    def test_upstream_match_uses_subject_author_and_commit_date(
+        self,
+        body_author: Optional[str],
+        commit_email: str,
+        subject_suffix: str,
+        offset: int,
+        date: Optional[str],
+        matches: bool,
+    ) -> None:
+        from b4.review import _review
+
+        msg = _series_msgs('identity', 'Submitter <submitter@example.com>', 1, 1)[0]
+        if body_author:
+            msg.set_payload(f'From: {body_author}\n\nCommit message.\n\n{_pos_diff(1)}')
+        patch = b4.LoreMessage(msg)
+        committed_at = int(patch.date.timestamp()) + offset
+        if date is not None:
+            if date:
+                msg.replace_header('Date', date)
+            else:
+                del msg['Date']
+        upstream = {
+            patch.subject + subject_suffix: [
+                _review.UpstreamCommit(
+                    'upstream', 'Author', commit_email, committed_at
+                ),
+            ],
+        }
+        assert _review._match_upstream_commit(patch, upstream) == (
+            'upstream' if matches else None
+        )
+
 
 # ---------------------------------------------------------------------------
 # Cancellation: cmd_track
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 755a510..83b604a 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -6495,6 +6495,64 @@ class TestListAlignment:
         assert '[v1,0/1]' in plain
         assert '→' not in plain
 
+    @pytest.mark.asyncio
+    @pytest.mark.parametrize(
+        'status, merged_count',
+        [('reviewing', 1), ('merged', 2)],
+    )
+    async def test_merged_status_uses_violet_check_in_status_column(
+        self,
+        tmp_path: pathlib.Path,
+        status: str,
+        merged_count: int,
+    ) -> None:
+        seed_db(
+            'test-merged-badge',
+            [
+                {
+                    'change_id': 'merged-badge',
+                    'subject': '[PATCH 0/2] merged badge',
+                    'message_id': 'merged-badge@example.com',
+                    'num_patches': 2,
+                    'status': status,
+                }
+            ],
+        )
+        conn = tracking.get_db('test-merged-badge')
+        conn.execute(
+            'UPDATE series SET attestation = ? WHERE change_id = ?',
+            ('signed:DKIM/example.org', 'merged-badge'),
+        )
+        conn.commit()
+        conn.close()
+        app = TrackingApp('test-merged-badge')
+
+        async with app.run_test(size=(120, 30)) as pilot:
+            await pilot.pause()
+            lv = app.query_one('#tracking-list', ListView)
+            item = next(
+                child for child in lv.children if isinstance(child, TrackedSeriesItem)
+            )
+            item.series['merged_patch_count'] = merged_count
+            item.series['merged_patch_positions'] = list(range(1, merged_count + 1))
+            text = item.render_label()
+            check_spans = [
+                span for span in text.spans if text.plain[span.start : span.end] == '✔'
+            ]
+            assert check_spans[0].style != '#a855f7'
+            if status == 'merged':
+                assert check_spans[1].style == '#a855f7'
+                assert check_spans[1].start > check_spans[0].start
+            else:
+                assert len(check_spans) == 1
+            app._show_details(item.series)
+            expected = (
+                'patch 1 of 2 merged upstream'
+                if merged_count == 1
+                else 'patches 1, 2 of 2 merged upstream'
+            )
+            assert str(static_text(app.query_one('#detail-merged', Static))) == expected
+
 
 class TestAttestationPasses:
     """The A column ignores unverifiable attestations, not failing ones."""

-- 
2.43.0

