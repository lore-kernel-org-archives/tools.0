Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEB246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327910; cv=none; b=RmTSn24GQU7tim40hpKqWFdSBPOgOWwUbij6S+9RRn0EklCFRt4mUIA48EB7qTz6tKRuejk87me5K2yEp1tG0eheO+OHmA5CO9FKapSxIvQ3/RAdLQZea7CfPLyv1HO4PGqzhNWvMsgIqEi3+OQeUs2H7HSt/Dy47GgntVEY4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327910; c=relaxed/simple;
	bh=TvskRYHxfo9Iw4ZsuYXmlu1rkH7ydc96OAxj+qavhpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTOCTbRMfkSC46rww+fgAH9WNCfXjeopWqd6OMwPiuRg7y6se19i+YezTm6uWq2+FpDbwjIe90dAtRC+E10G0aWXjye2GzT5rSMIDeSWAZ5vSrfNuZBozepTSEciTulYwXis5X5Sc0G8pSWwevtn8BpXugvgi69vT+LDHcT/yu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H128olIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H128olIV"
Received: by smtp.kernel.org (Postfix)
	id 2B7441F00A3A; Fri, 17 Jul 2026 22:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463B41F00A3D;
	Fri, 17 Jul 2026 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327909;
	bh=95xO+Q5agyIPW9oibWnzaA53tRzOUpdO4cCduBIGR+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H128olIVlGmEU47G1+30+nPocLVP3dVSYupK7QkbTxVHfxfp236ifqECT8nPYgOcH
	 4POA/cQ8SLgd7zTHFDasYi3bL6Qr5zlCa2WFHQJlr2nmr7fro8Sjqs6HfCh5xH2cQN
	 bxvwwd1Ds3CGhA/GOUqlv2UXVHKPS2Bg9TAJWYKCL4WaBNzFo5DIXs2facRzTqLEB7
	 LZA9+aN8TipSWSqg9InP8TlGTXIvNI2FDVmtaqF+dGO0VtIz78WR7DlzYAfq0+l/p5
	 5LUolHzHHJxaNmawb75LNLUOyTJgK0j/GJMUMS+oLsgR8wk53otbsp/WejtC4+NgM9
	 RPPtMFirOtTzg==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:42 +0200
Subject: [PATCH RFC 06/11] review: add backward discovery of older series
 revisions
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-work-b4-multiver-rows-v1-6-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3944; i=brauner@kernel.org;
 h=from:subject:message-id; bh=TvskRYHxfo9Iw4ZsuYXmlu1rkH7ydc96OAxj+qavhpY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbspoXN5kfzCWLt/BZMb3twKCDjvEazzn+Ws7p/cv
 QafLDptOkpZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACZy6iXDP9tdij6p4c48b2ec
 zfiuULvv8+IDK5XStePKnAPeCebMkmf4H7l7ZwNb95MiqemHDu9X5bbVZuB8evzLh1SlBO9bt/j
 0eQE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Auto-discovery only looks forward, so versions posted before a series
was tracked never enter the revisions catalog unless they shared the
seed thread.  Add discover_older_revisions(): fetch the tracked thread
and run the same get_extra_series() machinery b4 am/mbox uses to pull
other revisions -- but with an explicit wantvers covering every
previous version, since the backward search defaults to fetching only
latest-1.  Newly recorded revisions are polled immediately so they
arrive with counts and cached thread blobs.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/tracking.py | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index c176c46..d61304d 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -2774,6 +2774,76 @@ def update_revision_message_counts(
     return {'updated': updated, 'errors': errors}
 
 
+def discover_older_revisions(
+    identifier: str,
+    series: Dict[str, Any],
+    linkmask: str,
+    topdir: Optional[str] = None,
+) -> Dict[str, Any]:
+    """Search lore for revisions older than the tracked one and record them.
+
+    Auto-discovery only looks forward, so versions posted before a series
+    was tracked never enter the catalog unless they happened to share the
+    seed thread.  This fetches the tracked revision's thread, runs the
+    backward lore search (change-id query when the cover carries one,
+    subject+sender otherwise, capped roughly a year back), records every
+    previously unknown revision, and immediately polls the series so the
+    new revisions get counts and cached thread blobs.
+
+    Returns ``{'found': n, 'revisions': [..], 'error': str-or-None}``
+    where *found* counts genuinely new catalog entries and *revisions*
+    lists their version numbers.
+    """
+    change_id = series.get('change_id', '')
+    message_id = series.get('message_id', '')
+    if not change_id or not message_id:
+        return {'found': 0, 'revisions': [], 'error': 'no message-id for this series'}
+    tracked_rev = int(series.get('revision') or 1)
+    if tracked_rev <= 1:
+        return {'found': 0, 'revisions': [], 'error': None}
+    if not b4.can_network:
+        return {'found': 0, 'revisions': [], 'error': 'offline'}
+
+    mbox_bytes = _fetch_thread_mbox_bytes(str(message_id))
+    if mbox_bytes is None:
+        return {
+            'found': 0,
+            'revisions': [],
+            'error': f'could not fetch thread for {message_id}',
+        }
+    msgs = b4.split_and_dedupe_pi_results(mbox_bytes)
+    # Same machinery b4 am/mbox uses to pull other revisions of a series,
+    # except we ask for every previous version at once — without an
+    # explicit wantvers the backward search only fetches latest-1.
+    wantvers = list(range(1, tracked_rev))
+    try:
+        msgs = b4.mbox.get_extra_series(
+            msgs, direction=-1, wantvers=wantvers, nocache=True
+        )
+    except liblore.OperationCancelledError:
+        raise
+    except Exception as ex:
+        return {'found': 0, 'revisions': [], 'error': str(ex)}
+
+    lmbx = b4.LoreMailbox()
+    for msg in msgs:
+        lmbx.add_message(msg)
+    if not lmbx.series:
+        return {'found': 0, 'revisions': [], 'error': None}
+
+    conn = get_db(identifier)
+    new_revs = _record_discovered_revisions(conn, change_id, lmbx, linkmask)
+    conn.close()
+
+    if new_revs:
+        update_revision_message_counts(identifier, [series], topdir=topdir)
+    return {
+        'found': len(new_revs),
+        'revisions': sorted(new_revs),
+        'error': None,
+    }
+
+
 def mark_all_messages_seen(
     conn: sqlite3.Connection, change_id: str, revision: int
 ) -> None:

-- 
2.53.0

