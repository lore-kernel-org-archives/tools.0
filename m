Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C57246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327907; cv=none; b=er2eiNDuc/T4pcLW6AQ+Zga0VHLefrTw2kKsqLGxWnDwdzSpHotZY/XbiNsblPB2AMReTuNB5AI9Ey2wfcRjo2wAgyBZkwYH2foVJfvBGkE+LYvqOo48inGw7omQ5kH1HX7G8orySAivVNNt5caRQSYUS1BCyG6T3EAKqSL/RjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327907; c=relaxed/simple;
	bh=0D7Cz3c+Be0QvZbQ8Mj89ijpCrOBLANVTSuN0LJxwDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdahCTfDngZmXzQ/c4yYgjKgDd8EjUG7kfYDH/K5phSrCen2r28Zb5OK0i3Wf+GbdsqWI3FoR9okRmunqOc0yXqlU+ddWM93aY8HxcxSC9XmFOcH94XFuAM3XKBphxiCU3G74tAOqMSSn4DOh1Kdk4RQBMvrECgLfJljcX+uJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmNp38HE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmNp38HE"
Received: by smtp.kernel.org (Postfix)
	id DA70E1F00A3A; Fri, 17 Jul 2026 22:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E111F000E9;
	Fri, 17 Jul 2026 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327905;
	bh=J587awwiJ1XXsIHK7R1zq+TQajJE6oDOfwF+eTyI4lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DmNp38HEwQebCy0gXQO0REk2Im5ZychiNODAUkaxNtwotTqQ9Yuituol2HYARx3dL
	 1V5B0iVKE75mY7ZwDhGk8tI8CpvSUAHnPkVmDYIGJEU+svx6Yrcu4sMCvW8fuF6iUx
	 VRzvfwD+S8fXLPyKAgX9ZCxQPqQ3gI6H4McfhJdey+XgG/13fPbZ1s7wMMVRWXxaZY
	 y0RzERG+Xo0acKlBVtmB9fdzXF032w5tjmkiVK7mk2nJOee8gJBocq4ImuQl5in/fH
	 0LvlRUDF/KJXAzg4nPz/ei4UCootFQX2xkGYRm9qsU0phri6bfQWe19E86gQTb87yB
	 RW+Krve6qfw2Q==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:40 +0200
Subject: [PATCH RFC 04/11] review-tui: poll every revision on u/U updates
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-work-b4-multiver-rows-v1-4-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0D7Cz3c+Be0QvZbQ8Mj89ijpCrOBLANVTSuN0LJxwDM=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbs53X3B5sl+K59MFbysM++LYU9Ppvfy0+zurfH82
 bOi73wy6ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAbjJXgz/tNfLamw1tQyat2/m
 5idHWTg+z5rxeu3Sfq8zLTw3Npnv+MbI8PbBWxuPiP1v69c+PPCSs+XDJq6qnAuXfxYrf/89Mf1
 eKwcA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Hook update_revision_message_counts() into the per-series update loop
so all known versions of a tracked series get new-mail detection, not
just the tracked revision.  Revisions discovered by
update_series_tracking() moments earlier are picked up in the same
pass because the poller re-reads the catalog.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_modals.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 51e6b4e..5943426 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2828,6 +2828,26 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
                 if r.get('counts_updated'):
                     self._result['followup_updated'] += 1
 
+                # Poll non-tracked revisions for new mail; revisions
+                # discovered by update_series_tracking moments ago are
+                # picked up because the poller re-reads the catalog.
+                try:
+                    rc = b4.review.tracking.update_revision_message_counts(
+                        self._identifier, [series], topdir=self._topdir
+                    )
+                    self._result['revision_counts_updated'] = self._result.get(
+                        'revision_counts_updated', 0
+                    ) + rc.get('updated', 0)
+                except liblore.OperationCancelledError:
+                    self._cancelled = True
+                    break
+                except Exception as ex:
+                    logger.debug(
+                        'Per-revision count update failed for %s: %s',
+                        series.get('change_id', ''),
+                        ex,
+                    )
+
                 self.app.call_from_thread(self._update_progress, i + 1, subject)
 
         return self._result

-- 
2.53.0

