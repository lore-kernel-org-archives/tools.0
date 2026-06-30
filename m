Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB838F928
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826898; cv=none; b=D7PcxT5yJVQHVLha4D880YUuNiwXB/rWVUWfDXr43dClKqkQsc2mkXB91VFg/z1z3bADbevKOxA99OYYivRDc50ME9Cyp38JJQb4VcKZs0egao7iKshCM2j5nCk+fbRtAK41u2NfXLUq4CAI2nt0aIWw2YIrOQ0dMFpqnX1zl4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826898; c=relaxed/simple;
	bh=xZJtZ/gsk2N4UCmt3tKOqgu6GebTaMSTUlF7Fk9q5K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXt837glUtQLX2bmCt7U6lTEbe86k2Xv5QGD7tVpBqkzo37FjV6p7g1B2Ou2XUGBBZNvie2jSMxzJQLAILL5NF93EVKYhiPBlskL9F8kDjQkXk845Ck1zKM2Q+ajN/3bnZCxGn7m1+CqFyws7eHATfy7m+5gHTGHUfqSsX39pZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiMfHkqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiMfHkqs"
Received: by smtp.kernel.org (Postfix)
	id 762DD1F00A3D; Tue, 30 Jun 2026 13:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5381F000E9;
	Tue, 30 Jun 2026 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826897;
	bh=0B9vxZw9wiu3KUa2+yyzvgzOIgNDs0PuONw3+KdTRTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AiMfHkqsVaZyV8dMe1R1RXMm30evu5ZBkaWsNmqzS65CgetFEReYCOGgw+QBg8Kzn
	 8jF7dtpkE9QvqSe1CPF5U8Uev7SqX+OXZWz/pNi2H4RSLnn+XQD1ByMHuC50tBCLbe
	 z9JNgj4GXIhMN/RON3icP2z5Ez0UsAPazuKHPgcf9aawh+Q/inc4Sgwk0npp4d8sX/
	 4HiP5icrsBnmokfJLF4kBOJgK/3tSghODDj8AqpB4ImcI9VqNgiREsg/JWVulBg0GC
	 mwSfZjWTRqpT4zq6qDqX/RXoXeKOkCvYJtuVXuNFYdDBlhp3V8+2717wpiAPO8RXww
	 jlXi/2dmFyKEg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 30 Jun 2026 15:41:32 +0200
Subject: [PATCH b4 1/2] review-tui: fall back to '(no subject)' for null
 Patchwork series names
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-review-tui-null-series-name-v1-1-67d7c9334454@kernel.org>
References: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
In-Reply-To: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-7d1c2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xZJtZ/gsk2N4UCmt3tKOqgu6GebTaMSTUlF7Fk9q5K8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ5H+/bYnS95EJPsl68+/mFEd5WVn6nusV6tZ+L+6oxh
 rMvKmvuKGVhEONikBVTZHFoNwmXW85TsdkoUwNmDisTyBAGLk4BmEhaCsP/whs2abI9X7ibAp2L
 4x41b1x0wXSp7YNVxtkvo1ou/3sRxPA/rMohZ+oX8yulKQ8+dV9fxVl+V9/BNOyd5cdnUksmMyr
 zAgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Patchwork returns "name": null for a series posted without a cover letter.
Several spots in the Patchwork app read it with
series.get('name', '(no subject)'), whose default only applies when the key
is *absent* -- a present-but-None name passes straight through as None.

On the bulk set-state path that None reached ApplyStateModal and was handed
to a Label, which Textual cannot render:

    VisualError: unable to display 'NoneType' type; must be a str, Rich
    renderable, or Textual Visual object

so opening the apply-state dialog for such a series crashed the whole TUI
during layout. The track/hide/unhide notification paths shared the same
latent bug, displaying a literal "None" in place of the placeholder.

Use the `series.get('name') or '(no subject)'` idiom already used by the
list-row renderer so a null name consistently becomes the placeholder.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_pw_app.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index e70d017..9faf785 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -766,7 +766,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             return
 
         if len(targets) == 1:
-            label = targets[0].get('name', '(no subject)')
+            label = targets[0].get('name') or '(no subject)'
         else:
             label = f'{len(targets)} series ({len(patch_ids)} patches)'
         self.push_screen(
@@ -822,7 +822,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             self.notify('Series already tracked', severity='information')
             return
 
-        series_name = item.series.get('name', '(no subject)')
+        series_name = item.series.get('name') or '(no subject)'
         msgid = item.series.get('msgid', '')
         if not msgid:
             self.notify('No message-id available for this series', severity='error')
@@ -932,7 +932,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             return
         self._hidden_ids.add(sid)
         self._save_local_data()
-        title = item.series.get('name', '(no subject)')
+        title = item.series.get('name') or '(no subject)'
         self.notify(f'Hidden: {title}', timeout=3)
         await self._refresh_list()
 
@@ -955,7 +955,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             return
         self._hidden_ids.discard(sid)
         self._save_local_data()
-        title = item.series.get('name', '(no subject)')
+        title = item.series.get('name') or '(no subject)'
         self.notify(f'Restored: {title}', timeout=3)
         await self._refresh_list()
 

-- 
2.53.0

