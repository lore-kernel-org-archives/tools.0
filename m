Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B189246BD5
	for <tools@linux.kernel.org>; Fri, 17 Jul 2026 22:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327908; cv=none; b=aZqOJVz+rapunN9Ou+dTxkaXXvH62Er11LdzFpx6pAgDsm6LeYl1nkLMLCdWYGz8dxXFRRy34O5Rv1kVdR1chKkak+JPm/2wBjF2yaAv9epgYxOC11h1j+gQMzFHMlt9TwNhvSmF/7F6jGfSRYPbvajL5mjefvb9joLGnel7uwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327908; c=relaxed/simple;
	bh=YrJ+1UN3pAqAjAqgJlk4h5JbVIVo6zFws32egj0kR8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpiRYoG0YK8yLvIsiX/ACbxW6VtmCHeIDbyH4uGIXUaX3P2kqMms6WCGqZXQRwil9NzLSWQpxefhjyy0fsuy6dVD+bYon6gME//iSQfIyrP0mmc7zCk31w1XfzsQDkKPB4ohvYqABleQKR4lI/sK2x/odotgNDbO/buxXo+bZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZZm/2pB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZZm/2pB"
Received: by smtp.kernel.org (Postfix)
	id 36D151F00A3A; Fri, 17 Jul 2026 22:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4E81F000E9;
	Fri, 17 Jul 2026 22:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784327907;
	bh=IM0F0Qqi+6+2THGnkpxZdWzfW8JmKE+NqOp/dFyxyP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aZZm/2pB3HZaULFfGObvOkc/+9VFgaiOaj4LQJ/RTrOJYjdXTio+sZ41VyrlbFtS5
	 JyVt/I+HuoeeoPNlo1jZoq9HoEtUfssZaQKuDJF8pxWT3HIEkyDnbwqZhEJkI+hAax
	 kjW5q6zMxxnZf+0JSpYarSg2ZUmTuOJEUZqrbX5DAW7ozjo94JbKjyVy8j77bqgDD1
	 TwnkNP28/3XlsAQ7CyEX+cG9XJSLBoprCb5KEuwHWwDC1VvBzhQpezoigbZ2BC2s1k
	 cthJHLmOiUoeqMyoMqzGMsB6cczTNPSvDAXqUPCAsgJu4Fjm+rMEWGvsTfR00mqTUd
	 DjwEjyDJIESfw==
From: Christian Brauner <brauner@kernel.org>
Date: Sat, 18 Jul 2026 00:37:41 +0200
Subject: [PATCH RFC 05/11] review-tui: guarantee the tracked revision in
 revision lists
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-work-b4-multiver-rows-v1-5-3c539d2a3095@kernel.org>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
In-Reply-To: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714; i=brauner@kernel.org;
 h=from:subject:message-id; bh=YrJ+1UN3pAqAjAqgJlk4h5JbVIVo6zFws32egj0kR8A=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRFrbuZOqP3X1Hz3oshFkuuOE6pnfmEs/2S4Xx5hbc83
 5WjelVOdJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkygqGf8qu6+oCri6ce4Gl
 j0ei1N1XbVWf7lXdO9Xv7Bi/5ogscWL47xjan3jCeJ13c1EZP/utTVsyfFzerlzUPNeMO2VO/iF
 uNgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The revisions catalog is not guaranteed a row for the tracked revision
(manual linking can record only newer versions), so per-version views
built from series['_revisions'] could silently omit the version the
maintainer is actually tracking.  Add _merge_tracked_revision(), which
appends a synthesized entry built from the series row when the catalog
lacks it.

Assisted-by: LLM
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 7bf9530..3057367 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1561,6 +1561,41 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             )
         )
 
+    def _merge_tracked_revision(self, series: Dict[str, Any]) -> List[Dict[str, Any]]:
+        """Known revisions of a series, guaranteed to include the tracked one.
+
+        The revisions catalog is not guaranteed a row for the tracked
+        revision (manual linking can record only newer versions), so a
+        synthesized entry built from the series row is appended when it
+        is missing.
+        """
+        revs = list(series.get('_revisions') or [])
+        tracked = series.get('revision', 1)
+        if any(r.get('revision') == tracked for r in revs):
+            return revs
+        if not series.get('message_id'):
+            return revs
+        revs.append(
+            {
+                'change_id': series.get('change_id', ''),
+                'revision': tracked,
+                'message_id': series.get('message_id', ''),
+                'subject': series.get('subject'),
+                'link': '',
+                'found_at': series.get('added_at') or '',
+                'thread_blob': '',
+                'fingerprint': series.get('fingerprint'),
+                'source': 'tracked',
+                'is_rethreaded': bool(series.get('is_rethreaded')),
+                'message_count': series.get('message_count'),
+                'seen_message_count': series.get('seen_message_count'),
+                'last_update_check': series.get('last_update_check'),
+                'last_activity_at': series.get('last_activity_at'),
+            }
+        )
+        revs.sort(key=lambda r: r.get('revision') or 0)
+        return revs
+
     def _checkout_new_series(self) -> None:
         """Retrieve series, build am-ready mbox, and show base selection."""
         series = self._selected_series

-- 
2.53.0

