Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2237FF7F
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535184; cv=none; b=RSz011J6m1YsEMw+0TYUawZxSxYQEiE3uLEEhVUSJJ86tmWtoFtTxFbYke/kJ/LM0GTQKyBbwGw46iVKB2TIoEzSqOPKtVa0mrtTXrO7xMw0o1Lb8YOfVKB0SDpl4nqYE1WnrRf+970PkuF+IE3DoVAHHYwpVDIxnOWjEYV1ML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535184; c=relaxed/simple;
	bh=pVGfcYcAVrSgjUcNwlnvA6sWe8+2hBiVzowcP/KXUhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgYXWSu27jumfTSVt2OmFW/BGAHYR0BtAyUyxZSaLnbtNDvLRR0IATP0k31EATD5ipjJFCKl1w+YxX69KGSy0WUWpsBYOtFFW1+QZoDU3ipYvrksGijk8Ky1zcGx+yxQH72RvFdc9ctj8wFaS76Dn7ZDcCByz0bOju4L5o6HsII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4fT3yhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4fT3yhb"
Received: by smtp.kernel.org (Postfix)
	id 1E5FD1F00ACA; Fri, 31 Jul 2026 21:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411EF1F00AC4;
	Fri, 31 Jul 2026 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535183;
	bh=EJ7YwE6PNQIsr34Osq2s0wxGGroswV8Us1AVDCwJYTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F4fT3yhbHJLtCe3YTks/q4iR6wePsZZde+gjwjkkm0xWSvf9us5V6x+nVS1JcypKr
	 psrEPGtvxxb3EhzVmtCOSfWta330CqrNoGkdJSxLq9BEskUsnmVFr1kz9xtgY0bz18
	 TwTA+b6+EC2jqTgGY+7Au9KsiShms/cpKS4bbELT2bCiL1SNZ+IcrK3XpFRxstA3Dg
	 n2I5MkVJh+MDfkNW8/qvmEwtxpmC4Ryx6OR87D0KTy4S8u90TOZJLC4h+1AkFWvCiL
	 KaLzucvC0G2rc+QPck4tS3fWJKu9zKdmoS659DY9g+6oMz0wHf7w/30vqB5QRyL+Xs
	 xVjlS9ymg/WJw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:22 +0200
Subject: [PATCH b4 v2 41/44] review-tui: catch the exit a failed checkout
 reports itself with
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-41-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396; i=brauner@kernel.org;
 h=from:subject:message-id; bh=pVGfcYcAVrSgjUcNwlnvA6sWe8+2hBiVzowcP/KXUhY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2VnOr0jelPlcnuhxeaHRtO7OaxZ7V+e0/6YKj6L
 N8pki+XdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzE8R8jw7Gn4SYLZizZ+H/L
 DMMVDzbLvzr348m5L1YvL75askm6MS+akWH+Ss8pz9u/7Zl54WLKw36t6Us5Nm5676c/Z5uP9G2
 bTD5uAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

create_review_branch() exits rather than raises, and SystemExit is
not an Exception, so a failed checkout unwound past the handler and
took the session down. This is the path every series enters review
through. Catch the exit and report "see above"; the reason is already
on the screen we are suspended into.

The conflict handler also created the branch a second time from
inside the except block, out of reach of the handler beside it. Move
the resolve around the am alone; the create is then written once and
covered.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_tracking_app.py | 55 ++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index c547d7c..ac3a575 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1918,16 +1918,29 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                         )
 
             _is_rt = bool(series.get('is_rethreaded'))
+            # create_review_branch() reports failure by exiting rather than
+            # raising, and SystemExit is not an Exception, so catch it too --
+            # letting it out of here unwinds straight through the suspend and
+            # takes the session down over one series that would not apply.
             try:
                 logger.info('Base: %s', base_commit)
-                b4.git_fetch_am_into_repo(
-                    topdir,
-                    ambytes=ambytes,
-                    at_base=base_commit,
-                    origin=linkurl,
-                    am_flags=['-3'],
-                    resolve=True,
-                )
+                # Only the am can conflict, and it runs before anything is
+                # created, so the resolve belongs around it rather than around
+                # the whole block: creating the branch is then written once and
+                # covered by the handler below on both routes to it.
+                try:
+                    b4.git_fetch_am_into_repo(
+                        topdir,
+                        ambytes=ambytes,
+                        at_base=base_commit,
+                        origin=linkurl,
+                        am_flags=['-3'],
+                        resolve=True,
+                    )
+                except b4.AmConflictError as cex:
+                    if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
+                        _wait_for_enter()
+                        return
 
                 # Create the review branch
                 b4.review.create_review_branch(
@@ -1944,27 +1957,11 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 )
                 logger.info('Review branch created: %s', branch_name)
                 checkout_success = True
-            except b4.AmConflictError as cex:
-                if not b4.resolve_am_conflict_in_shell(topdir, cex, origin=linkurl):
-                    _wait_for_enter()
-                    return
-                # Create the review branch from resolved result
-                b4.review.create_review_branch(
-                    topdir,
-                    branch_name,
-                    base_commit,
-                    lser,
-                    linkurl,
-                    linkmask,
-                    num_prereqs=0,
-                    identifier=self._identifier,
-                    status='reviewing',
-                    is_rethreaded=_is_rt,
-                )
-                logger.info('Review branch created: %s', branch_name)
-                checkout_success = True
-            except Exception as ex:
-                logger.critical('Error creating review branch: %s', ex)
+            except (Exception, SystemExit) as ex:
+                # SystemExit only carries the exit code; create_review_branch()
+                # has already said why on its way out.
+                reason = 'see above' if isinstance(ex, SystemExit) else str(ex)
+                logger.critical('Error creating review branch: %s', reason)
                 _wait_for_enter()
 
         if not checkout_success:

-- 
2.53.0

