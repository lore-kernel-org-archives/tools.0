Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601341;
	b=gvJR4JWFpV/56K6BY+o86MyrP+OvbnWBttpgIMi3/+YCUnhb4ERr/YAkaZDJobr8mA+e
	 iP2UEIXsMRuymw+nyTy15IiqlZdaX2lKzboeB0MtcqYVJ0NmlzXf1ZZYPwMQTtbBN/CMH
	 +do2HGsvpQQsyeoyRjWmpuc+Qd95ethnwEpZYihxKuGL4Zr3zYJp8eoirM43bOr2wn9O/
	 z+E6rFMqMPK/z/aXckHLTIAk7qCruxHZFM4iZAJgYhdnHUw3Ca153cPCD+RF+pkS+HrWH
	 9TwX8kNV37/ZFdvIbNCDyltin4+2iXelSxM3HOcnVChZPNHIkYWwXU3ojjGw7P+jxaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601341;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6MeO6qckXwAceZ0myuwRZ5jStoEk/3Ona1FvDehELtU=;
	b=IrhZlkSk7jsyIl/HNgv3vXQH3+IdNQQBwrZ+vm0jvxI+SXN+pYA+6IFFyB0bqfvxxppb
	 rc5pSwlBcc6USdP2aIBEb8rlIYFPaEqyjw4gbxi1D8WdZehmlDri24BabBq1OGZd5RTqK
	 a3WBWlIyvi+j845gbZwyQAKxQ8ElaSZ7O1RkTfbnsNJUgjnuNOpsMNMLbtD3ds/F19Zw8
	 PMJdUBaCxfuPKdfcU5802/3YIRoD4I10eAsjiGGkp6WEOO58RnMyuOAvC9xWDdgUXYStq
	 EEKZlAaSAaJqI/p6vWapiWrHSQqV89VqWIZKkNnwaTEFPT0RW6wRZiyXQubl5jPtnFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGV5mPia;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40D7606A881
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGV5mPia
Received: by smtp.kernel.org (Postfix)
	id 763E01F01575; Fri, 13 Nov 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794601341;
	b=xYmOvxc6prTL2xgNQVL0qWDEleA3DBRQPlaqAa02I8ivyQyovvQwAxHqy86l29PjDq6s
	 Qxz+QegMYxqxV28VoGk5RG1CzTOo1/+UyVqetTYW5gQHQMBBQTRs1AjAwhhOWaP0S03uI
	 aCkE8O0ACGhlGLT10w4pRK29v60XFKPWjnRxOgW10LzZ63algY35vuoOBqvntxLXomLTo
	 MDL9lMdRTrjqyo/3ULi/cF4aOrNepb8+64HKiXnYwhflsKr/1CI5h5J1Khm4b9e4VckhU
	 p5YFCzv+UuUCnC1lDPeXngSYuOKY3dlDp6qKFCP60QjvuGArbeElasV/UE7BM2zVqaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=6MeO6qckXwAceZ0myuwRZ5jStoEk/3Ona1FvDehELtU=;
	b=vdqZbaNRizLF9t1F0qf8Xwb093+ZX+HHJbMiKUQyRA8uDggorw0MQ6P2ZcUslTeagDZp
	 YJmbC4CQqiEzHVTsEg6zwxuQBoAud4z3hL6xjyYOQO572g6IBfMR2gPDFR9ENzAnRxlCg
	 EPm+deUnejUhuNXcQbIaNunZxJTi9HXYOs+jQU12OAxFX3o3dbQlVlVdsJb3x5rrpwHUM
	 0x2q4j8gnlDNyY7wwcEGoFt8pnFohMYmbrXlpFCyoBNbIm7FRIWzxXtgzaUOTr109dxcS
	 wpJ4O9SrSpfmXAIV/Lcu5W33nHeJnWGWXcocVdlz/6BHExWcXq4W9nANNorO6WeeV+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGV5mPia;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 224F31F000C6
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:22:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGV5mPia
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 224F31F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8629ef48703so290911a34.3
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601335; x=1795206135; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MeO6qckXwAceZ0myuwRZ5jStoEk/3Ona1FvDehELtU=;
        b=rGV5mPiaMeD30Q3sB7C3DLOQwj1FEEGS62pYP1KfPKSxY2sGvlzEgWjHY28cvhIKO6
         yhwIim41qT2E/Wk/T7+s+JnKKN0fXF7jv0QU7anHRAluVjP6kISpEmyegXIO8IIWehYU
         VbQg+yf7NZh4SZgkpT6QQPTXQYyJNW7S8aiD9iRCJiI79J2BRR2AjIOGDf4mdWaBv+gq
         rceagJwIkuI/IuIzOuK6rTq376el1qyYyu4moZrkA38NiWiQc4P+MO7Cw5WjPY5epDGy
         K670ka9rodK7I0Rr0qqQmrLAbisJigbnaiXl5syFYVRkE5QPacggP+zTnBLmGb1Y/1CX
         i9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601335; x=1795206135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MeO6qckXwAceZ0myuwRZ5jStoEk/3Ona1FvDehELtU=;
        b=0XmQYpSHN+wHDCUNGmqTOPmWwftqutBj3P0Cy56rnP8olgZWohVb+CoN/OQfl5RYpo
         oXTh2uNRdzfo9XqtByEecQ1mNFdnUUynMmJ0kGjASLBd3BqNSUAUBMw3wvWlo0actEQY
         hYhQu4UMO1QMnF8f03PAHe/BfobEft5WUfb7UFAAhgT/UAfhnXW9RXY539ab1OPvag98
         39bcuPVMwyDAfyPl35XRBX/zR7UlAvSKXFw8qOtk7hJBPx6HAGmBjUibNpPdRiLavA1f
         qwxT/QDCIXE/es4JNzYyh/enYNZcFwzLQJm2CejDGV0JjfXupcfVrTXuFcpHu50ktIn5
         LTUw==
X-Gm-Message-State: APuU4Z+zIMdmc1PENnsC8Oxa3dHNF74PCEU6B5OvhJt88SYqLlW1GfJz
	nxzNZxYZfd95ydcnixhvcBIyV9ZLP3RUHFbyWRLnQ45kwjEGLYw10luMKsfJoVyP
X-Gm-Gg: AYBFou0CZtEp44byDdPoifqJXufPqPzdBiRDQmxLsgKjWGle9vBg0Va+NXpnEm94Z1+
	gILblqZmSIX5HrmefSSaokTB6lsEYjW1AcsTkn2YQ4NOSWh8XJYAG6P/4Ytmf3qS+lA1cjNBYsE
	/7l93xShvs4CJxEG5VdmgLFy9FNsxPywhUs3c7Qn2kr9diwILa+kAzZYenVdfSQGk8CJgbyy4ZK
	BgFt5YX3QvRJZAPBIIiUUbntjb0KoA+cmryPVz81WkGlaO8Deq+R9H3DpBdgRpJQgKLGpL/OLvp
	ZWhW8HycUeFgmrepuOaCaMtXJr4WAT2xEdXTFEvywb+pm/kzssyfVBLJyFFDCnghHuW2mq2e06E
	ESmuVquZOslRmGASeNOusHgN+wLnuiN/zLABwHY9KzRmVOf6QWWepNdnqPUK/2LiQghjPHHVUKU
	4+6xL2+LhsTwq4N541hmV8TFipitWh2tkKS2aQZBF+gbfW1R0XjmcyYQfvdr9fASHELbfZprYMJ
	/q3gAB2CbPUNC7UaC5MOn8szzRP2RccP5kxyBEixrt5vqovXQQjXUig9g4qPd58I8SOG8rY06CL
	RPMpbDBhgv7WfmbGuoCnXNqSQRCTsMv90PTAGA5zjUmx6P7joB13PPiEYMmQTp017mn7/kSIORx
	kxXg7Cy7pYn4g6ey3kBMgpmIpJNYGy65qhem5wH99E2UZQzhfaZKr/5bJ84C87r7SVCBNgbuDtY
	mp7dVqblTW33SEllsgOPdWQwbQH6p0bKYHko6UeqtfL+3vHU93hMA=
X-Received: by 2002:a05:6830:2b21:b0:862:884e:b4a7 with SMTP id 46e09a7af769-8628980aa1cmr3654224a34.7.1794601334701;
        Fri, 13 Nov 2026 12:22:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e98ebsm3585809a34.12.2026.11.13.12.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 13:02:17 -0700
Subject: [PATCH b4 4/5] send: resume interrupted SMTP submissions
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
Message-Id: <20261113-submit-b4-send-resume-v1-v1-4-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Save regular SMTP submissions before delivery and add --resume to continue
their pending recipients with the original messages. Refuse a fresh send
while the series has an unfinished submission, and serialize send and
bookkeeping through a per-series lock.

Resume uses the saved envelope sender and message bytes even if the current
commits, cover letter or sender defaults have changed. Explicit recipient
exclusions still apply. Support inspecting pending mail with --dry-run or
-o, and require --resolve-uncertain after manually verifying a transaction
whose delivery outcome is unknown.

Complete sent-tag creation and revision tracking only after every recipient
has been accepted. Preserve the intended cover/tracking update so an
interrupted reroll can be completed without sending mail again. If the
branch has changed, finish delivery but leave that branch untouched until
its original state is restored for bookkeeping.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/contributor/send.rst     |  78 ++++++-
 src/b4/command.py             |  10 +
 src/b4/ez.py                  | 305 ++++++++++++++++++++++++++-
 src/b4/man/b4.1               |   7 +
 src/b4/man/b4.1.rst           |   7 +
 src/tests/test_send_resume.py | 470 +++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 868 insertions(+), 9 deletions(-)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 6cec79f..df34741 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -288,10 +288,76 @@ The following happens after you send your patches:
 * b4 automatically edits the cover letter to add changelog entries
   containing a pre-populated link to the just-sent series
 
+Resuming an interrupted SMTP submission
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. versionadded:: v0.17
+
+To continue a stopped SMTP submission later (for example, after a sending
+quota resets), run from the same branch::
+
+    b4 send --resume
+
+B4 saves the complete, signed messages before submitting any of them and
+records which recipients the SMTP server accepted. Resume sends only to
+the remaining recipients. Message-IDs, dates, subjects, threading,
+signatures, and To:/Cc: headers stay unchanged, including when only some
+recipients of a message still need a copy. No ``RESEND`` prefix is added.
+
+An ordinary ``b4 send`` refuses to start another submission while one is
+unfinished. Resume uses the saved messages even if the commits, cover
+letter or configured sender have changed. SMTP server settings and
+credentials may change; delivery still uses the original saved envelope
+sender and recipients. Recipient and signing options are not accepted with
+``--resume``. Explicit ``email-exclude`` restrictions still apply.
+
+To inspect the pending messages without sending anything, use::
+
+    b4 send --resume -o /tmp/pending
+
+The saved state lives under ``.git/b4-send/`` (the common Git directory
+for linked worktrees), not in b4's expiring cache. It includes the signed
+messages and recipient lists but no SMTP credentials. Keep this directory
+until delivery and bookkeeping are complete. It is local state, not part
+of the commits or something transferred by ``git push``.
+
+After all recipients have been accepted, b4 creates the sent tag and
+rerolls the series normally if the branch and cover/tracking still match
+the saved submission. Otherwise delivery finishes, but b4 leaves the
+changed branch alone. Restore the original branch state and run
+``b4 send --resume`` to finish the bookkeeping without sending again.
+The same command recovers an interruption between delivery and completing
+those steps. SMTP acceptance is not a guarantee of final delivery; check
+for later bounces as usual.
+
+Uncertain delivery
+^^^^^^^^^^^^^^^^^^
+
+A lost connection or interrupted process may leave b4 unable to tell
+whether the server accepted the current message. Resume then stops rather
+than risk duplicate delivery. The error identifies the affected
+Message-ID. Check the server's records or the recipients before recording
+the outcome::
+
+    b4 send --resume --resolve-uncertain=sent
+    b4 send --resume --resolve-uncertain=unsent
+
+Use ``sent`` only when all recipients in that interrupted transaction
+were accepted, or ``unsent`` when none were. These options affect only
+that transaction, require confirmation, and continue the remaining
+submission. Do not guess: a mailing-list archive alone does not establish
+delivery to every directly copied recipient. A partial or still-unknown
+outcome needs further reconciliation before either option is safe.
+
+Resume applies to regular, b4-prepared SMTP submissions started with this
+version. Web submissions, local sendmail commands, previews, reflections,
+and ``--resend`` retain their existing behavior. Failures from older b4
+versions cannot be resumed because no delivery state was saved.
+
 Resending your series
 ~~~~~~~~~~~~~~~~~~~~~
-If something went wrong, or if you need to resend the series because
-nobody paid attention to it the first time, it's easy to do this with
+If you need to resend a complete series because nobody paid attention
+to it the first time, it's easy to do this with
 ``--resend vN``. B4 automatically generates the series from the tagged
 historical version created during the previous sending attempt and sends
 it out.
@@ -359,3 +425,11 @@ Command line flags
 ``--resend V``
   Resend the specified previously sent version.
 
+``--resume``
+  Continue an interrupted SMTP submission using its saved messages and
+  pending recipients. May be combined with ``--dry-run`` or ``-o`` to
+  inspect the saved messages without sending.
+
+``--resolve-uncertain {sent,unsent}``
+  With ``--resume``, record the verified outcome of the single uncertain
+  SMTP transaction before continuing. See the cautions above.
diff --git a/src/b4/command.py b/src/b4/command.py
index 18d9a9e..44c9209 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1350,6 +1350,16 @@ def setup_parser() -> argparse.ArgumentParser:
         const='latest',
         help='Resend a previously sent version of the series',
     )
+    sp_send.add_argument(
+        '--resume',
+        action='store_true',
+        help='Resume an interrupted SMTP submission using its saved messages',
+    )
+    sp_send.add_argument(
+        '--resolve-uncertain',
+        choices=('sent', 'unsent'),
+        help='With --resume, record the verified outcome of an interrupted SMTP transaction',
+    )
     sp_send.add_argument(
         '--no-sign',
         action='store_true',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 2441bad..d1c779d 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -7,6 +7,7 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import argparse
 import base64
+import copy
 import datetime
 import email
 import email.policy
@@ -34,6 +35,12 @@ from typing import Any, Dict, List, NamedTuple, Optional, Set, Tuple, Union
 import b4
 import patatt
 from b4._rewrite import ThirdpartyCommitterError, rewrite_commits
+from b4._send import (
+    SendSession,
+    State,
+    pending_session,
+    series_directory,
+)
 
 can_codespell = importlib.util.find_spec('codespell_lib') is not None
 
@@ -3217,6 +3224,9 @@ def check(cmdargs: argparse.Namespace) -> None:
 
 
 def cmd_send(cmdargs: argparse.Namespace) -> None:
+    if cmdargs.resume and (cmdargs.auth_new or cmdargs.auth_verify):
+        logger.critical('--resume cannot be combined with web authentication')
+        sys.exit(1)
     if cmdargs.auth_new:
         auth_new()
         return
@@ -3224,6 +3234,238 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         auth_verify(cmdargs)
         return
 
+    if cmdargs.resolve_uncertain and not cmdargs.resume:
+        logger.critical('--resolve-uncertain requires --resume')
+        sys.exit(1)
+    if cmdargs.resume and any(
+        (
+            cmdargs.to,
+            cmdargs.cc,
+            cmdargs.resend,
+            cmdargs.preview_to,
+            cmdargs.reflect,
+            cmdargs.send_web,
+            cmdargs.no_sign,
+            cmdargs.no_trailer_to_cc,
+            cmdargs.not_me_too,
+            cmdargs.force_cover_letter,
+        )
+    ):
+        logger.critical(
+            '--resume uses saved messages; recipient, signing and transport-mode options cannot be changed'
+        )
+        sys.exit(1)
+    if cmdargs.resolve_uncertain and (cmdargs.dryrun or cmdargs.output_dir):
+        logger.critical('Cannot resolve delivery status in a dry run')
+        sys.exit(1)
+
+    is_prep_branch(mustbe=True)
+    _cover, tracking = load_cover(strip_comments=False)
+    directory = series_directory(tracking['series']['change-id'])
+    try:
+        directory.parent.mkdir(mode=0o700, exist_ok=True)
+        directory.mkdir(mode=0o700, exist_ok=True)
+        with b4.lockfile_nb(str(directory / 'send.lock')):
+            session = pending_session(directory)
+            if cmdargs.resume:
+                if session is None:
+                    logger.info(
+                        'No interrupted SMTP submission to resume for this series.'
+                    )
+                    return
+                _resume_send(cmdargs, session)
+                return
+            if session and not (
+                cmdargs.dryrun
+                or cmdargs.output_dir
+                or cmdargs.reflect
+                or cmdargs.preview_to
+            ):
+                raise RuntimeError(
+                    'An unfinished submission exists; use b4 send --resume'
+                )
+            _cmd_send(cmdargs, directory)
+    except (RuntimeError, OSError, ValueError) as exc:
+        logger.critical('CRITICAL: %s', exc)
+        logger.critical('Send state: %s', directory)
+        logger.critical(
+            'To continue an interrupted SMTP submission, run: b4 send --resume'
+        )
+        sys.exit(1)
+    except KeyboardInterrupt:
+        logger.info(
+            'Interrupted. Saved SMTP progress can be continued with b4 send --resume.'
+        )
+        sys.exit(130)
+
+
+def _cover_hash(cover: str, tracking: Dict[str, Any]) -> str:
+    return hashlib.sha256(
+        json.dumps([cover, tracking], sort_keys=True).encode()
+    ).hexdigest()
+
+
+def _send_source() -> Tuple[str, str, str, str]:
+    branch = b4.git_get_current_branch()
+    if branch is None:
+        raise RuntimeError('Not currently on a branch, unable to send')
+    cover, tracking = load_cover(strip_comments=False)
+    fingerprint = _cover_hash(cover, tracking)
+    head = b4.git_revparse_obj('HEAD')
+    tree = b4.git_revparse_obj('HEAD^{tree}')
+    if not head or not tree:
+        raise RuntimeError('Cannot identify the submission commits')
+    return branch, head, tree, fingerprint
+
+
+def _check_send_source(session: SendSession, finishing: bool = False) -> None:
+    state = session.state
+    branch, head, tree, fingerprint = _send_source()
+    allowed = {state.cover_hash}
+    # Branch-description storage writes the cover and tracking separately.
+    # Accept only the exact intermediate state of our saved reroll.
+    if (
+        finishing
+        and state.partial_reroll_hash is not None
+        and get_cover_strategy() == 'branch-description'
+    ):
+        allowed.add(state.partial_reroll_hash)
+    if (
+        b4.git_get_repo_status()
+        or (branch, head, tree) != (state.branch, state.head, state.tree)
+        or fingerprint not in allowed
+    ):
+        if finishing:
+            raise RuntimeError(
+                'All messages were accepted, but the branch or cover/tracking changed. '
+                'Restore it and run b4 send --resume to complete bookkeeping without repeating delivery.'
+            )
+        raise RuntimeError(
+            'The branch or cover/tracking changed since this submission was saved'
+        )
+
+
+def _finish_send(session: SendSession) -> None:
+    state = session.state
+    if not session.delivered() or state.in_flight is not None:
+        raise RuntimeError('Cannot reroll an unfinished submission')
+    if b4.git_get_current_branch() != state.branch:
+        raise RuntimeError(
+            f'All messages were accepted. Check out {state.branch} and run '
+            'b4 send --resume to complete bookkeeping without repeating delivery.'
+        )
+    cover, tracking = load_cover(strip_comments=False)
+    series = tracking['series']
+    revision = f'v{state.revision}'
+    recorded = series.get('history', {}).get(revision, [])
+    if state.cover_message_id not in recorded:
+        _check_send_source(session, finishing=True)
+        if state.next_cover is None:
+            state.next_cover, state.next_tracking = _reroll_cover(
+                cover, tracking, state.cover_message_id
+            )
+            state.partial_reroll_hash = _cover_hash(state.next_cover.strip(), tracking)
+            session.save()
+        assert state.next_tracking is not None
+        reroll(
+            state.branch,
+            state.tag_message,
+            state.cover_message_id,
+            cover_update=(state.next_cover, state.next_tracking),
+        )
+        _cover, tracking = load_cover(strip_comments=False)
+        series = tracking['series']
+    tag, _revision = get_sent_tagname(state.change_id, SENT_TAG_PREFIX, state.revision)
+    if (
+        series['change-id'] != state.change_id
+        or state.cover_message_id not in series.get('history', {}).get(revision, [])
+        or series['revision'] <= state.revision
+        or b4.git_revparse_obj(f'{tag}^{{tree}}') != state.tree
+    ):
+        raise RuntimeError(
+            'Delivery is complete, but sent-series bookkeeping is incomplete; no messages will be repeated on --resume'
+        )
+    state.finished = True
+    session.save()
+    logger.info(
+        'All %d messages accepted; sent-series bookkeeping completed.',
+        len(state.messages),
+    )
+
+
+def _get_resume_smtp(
+    session: SendSession, *, resolved_sent: bool = False
+) -> b4.SMTPConnector:
+    state = session.state
+    excludes = {addr.lower() for addr in b4.get_excluded_addrs()}
+    for index, message in enumerate(state.messages):
+        if not message.pending() or (index == state.in_flight and resolved_sent):
+            continue
+        if {addr.lower() for addr in message.recipients} & excludes:
+            raise RuntimeError(
+                'Saved recipients include an address now excluded by email-exclude; refusing to send'
+            )
+    smtp, _fromaddr = b4.get_smtp()
+    if not isinstance(smtp, b4.SMTPConnector):
+        raise RuntimeError(
+            'Resuming requires an SMTP server, not a local sendmail command'
+        )
+    return smtp
+
+
+def _resume_send(cmdargs: argparse.Namespace, session: SendSession) -> None:
+    state = session.state
+    logger.info('Saved submission: <%s>', state.cover_message_id)
+    pending = [index for index, msg in enumerate(state.messages) if msg.pending()]
+    for index in pending:
+        message = state.messages[index]
+        logger.info('  %s', message.subject)
+        b4.print_pretty_addrs([('', addr) for addr in message.pending()], '    Pending')
+    if state.in_flight is not None:
+        logger.warning(
+            'Delivery is uncertain for <%s>', state.messages[state.in_flight].message_id
+        )
+    if cmdargs.dryrun or cmdargs.output_dir:
+        for index in pending:
+            data = session.message_bytes(index)
+            if cmdargs.output_dir:
+                dest = pathlib.Path(cmdargs.output_dir)
+                dest.mkdir(parents=True, exist_ok=True)
+                slug = b4.LoreSubject(state.messages[index].subject).get_slug(sep='-')
+                (dest / f'{slug}.eml').write_bytes(data)
+            else:
+                logger.info(
+                    '    | %s', data.decode().rstrip().replace('\n', '\n    | ')
+                )
+        logger.info(
+            'DRYRUN: %d messages have pending recipients; send state unchanged.',
+            len(pending),
+        )
+        return
+    if state.in_flight is not None and not cmdargs.resolve_uncertain:
+        raise RuntimeError(
+            'Verify the uncertain delivery before using --resume --resolve-uncertain=sent or =unsent'
+        )
+    if cmdargs.resolve_uncertain and state.in_flight is None:
+        raise RuntimeError('There is no uncertain delivery to resolve')
+    if session.delivered():
+        _finish_send(session)
+        return
+    smtp = _get_resume_smtp(session, resolved_sent=cmdargs.resolve_uncertain == 'sent')
+    if cmdargs.resolve_uncertain:
+        logger.warning(
+            'Recording the uncertain transaction as %s after confirmation.',
+            cmdargs.resolve_uncertain,
+        )
+    logger.info('Only pending recipients will receive the original saved messages.')
+    input('Press Enter to resume or Ctrl-C to abort')
+    if cmdargs.resolve_uncertain:
+        session.resolve(cmdargs.resolve_uncertain)
+    session.send(smtp)
+    _finish_send(session)
+
+
+def _cmd_send(cmdargs: argparse.Namespace, directory: pathlib.Path) -> None:
     mybranch = b4.git_get_current_branch()
     if mybranch is None:
         logger.critical('CRITICAL: Not currently on a branch, unable to send')
@@ -3236,6 +3478,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     tag_msg = None
     cl_msgid = None
     _, tracking = load_cover(strip_comments=True)
+    source = _send_source()
     if cmdargs.resend:
         if cmdargs.resend == 'latest':
             revstr = tracking['series']['revision'] - 1
@@ -3691,6 +3934,37 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             logger.critical(ex)
             sys.exit(1)
 
+        if isinstance(smtp, b4.SMTPConnector) and not (
+            cmdargs.dryrun or cmdargs.reflect or cmdargs.resend or cmdargs.preview_to
+        ):
+            if tag_msg is None:
+                raise RuntimeError(
+                    'Cannot save submission bookkeeping without a cover/tag message'
+                )
+            branch, head, tree, cover_hash = source
+            series = tracking['series']
+            prepared = b4.prepare_mail(send_msgs, patatt_sign=sign)
+            state = State(
+                change_id=series['change-id'],
+                revision=series['revision'],
+                branch=branch,
+                head=head,
+                tree=tree,
+                cover_hash=cover_hash,
+                tag_message=tag_msg,
+                cover_message_id=cl_msgid,
+                fromaddr=fromaddr,
+                messages=[],
+            )
+            session = SendSession.prepare(
+                directory / f'v{state.revision}', state, prepared
+            )
+            _check_send_source(session)
+            logger.info('Saved SMTP submission in %s', session.directory)
+            session.send(smtp)
+            _finish_send(session)
+            return
+
         try:
             sent = b4.send_mail(
                 smtp,
@@ -3762,7 +4036,12 @@ def get_sent_tagname(
 
 
 def reroll(
-    mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX
+    mybranch: str,
+    tag_msg: str,
+    msgid: str,
+    tagprefix: str = SENT_TAG_PREFIX,
+    *,
+    cover_update: Optional[Tuple[str, Dict[str, Any]]] = None,
 ) -> None:
     # Remove signature
     chunks = tag_msg.rsplit('\n-- \n')
@@ -3837,18 +4116,34 @@ def reroll(
             gitargs = ['tag', '-a', '-F', '-', tagname, tagcommit]
             ecode, out = b4.git_run_command(topdir, gitargs, stdin=tag_msg.encode())
             if ecode > 0:
-                # Not a fatal error, complain about it and move on
                 logger.info('Could not tag %s as %s:', tagcommit, tagname)
                 logger.info(out)
+                if cover_update is not None:
+                    raise RuntimeError('Unable to create sent tag')
 
         except RuntimeError as ex:
             logger.critical('Error tagging the revision: %s', ex)
+            if cover_update is not None:
+                raise
 
     else:
         logger.info('NOTE: Tagname %s already exists', tagname)
 
     logger.info('Recording series message-id in cover letter tracking')
-    cover, tracking = load_cover(strip_comments=False)
+    if cover_update is None:
+        cover, tracking = load_cover(strip_comments=False)
+        cover_update = _reroll_cover(cover, tracking, msgid)
+    new_cover, tracking = cover_update
+    logger.info('Created new revision v%s', tracking['series']['revision'])
+    logger.info('Updating cover letter with templated changelog entries.')
+    store_cover(new_cover, tracking)
+
+
+def _reroll_cover(
+    cover: str, tracking: Dict[str, Any], msgid: str
+) -> Tuple[str, Dict[str, Any]]:
+    tracking = copy.deepcopy(tracking)
+    revision = tracking['series']['revision']
     vrev = f'v{revision}'
     if 'history' not in tracking['series']:
         tracking['series']['history'] = dict()
@@ -3887,9 +4182,7 @@ def reroll(
     else:
         new_cover = cover + '\n\n---\n' + prepend
 
-    logger.info('Created new revision v%s', newrev)
-    logger.info('Updating cover letter with templated changelog entries.')
-    store_cover(new_cover, tracking)
+    return new_cover, tracking
 
 
 def show_revision() -> None:
diff --git a/src/b4/man/b4.1 b/src/b4/man/b4.1
index 22ad531..b6d6b65 100644
--- a/src/b4/man/b4.1
+++ b/src/b4/man/b4.1
@@ -415,6 +415,13 @@ actually sending them.
 Send a \(dqpreview\(dq version of the series for someone to check before
 submitting it upstream.
 .TP
+.B \fBb4 send \-\-resume\fP
+Continue an interrupted SMTP submission, preserving the saved messages
+and sending only to recipients not yet accepted by the server. Use
+\fB\-\-resume \-o DIR\fP to inspect pending messages without sending. If a
+transaction\(aqs outcome is uncertain, b4 stops until it is verified and
+explicitly recorded with \fB\-\-resolve\-uncertain=sent\fP or \fB=unsent\fP\&.
+.TP
 .B \fBb4 trailers \-u\fP
 Retrieve any code\-review trailers provided for your series and apply
 them to the current branch.
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index ded7d6e..5f5ee39 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -379,6 +379,13 @@ For options, see the output of ``b4 prep --help``, ``b4 trailers
   Send a "preview" version of the series for someone to check before
   submitting it upstream.
 
+``b4 send --resume``
+  Continue an interrupted SMTP submission, preserving the saved messages
+  and sending only to recipients not yet accepted by the server. Use
+  ``--resume -o DIR`` to inspect pending messages without sending. If a
+  transaction's outcome is uncertain, b4 stops until it is verified and
+  explicitly recorded with ``--resolve-uncertain=sent`` or ``=unsent``.
+
 ``b4 trailers -u``
   Retrieve any code-review trailers provided for your series and apply
   them to the current branch.
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
index 823e74e..dea603b 100644
--- a/src/tests/test_send_resume.py
+++ b/src/tests/test_send_resume.py
@@ -1,6 +1,7 @@
 """Interrupted submissions use frozen mail and never repeat accepted recipients.
 
-SMTP connections use mocks or a loopback-only server.
+SMTP connections use mocks or a loopback-only server. Integration tests use
+disposable Git repos and exercise formatting, signing, state and rerolling.
 """
 
 import base64
@@ -19,11 +20,15 @@ from unittest.mock import Mock
 import pytest
 
 import b4
+import b4.command
+import b4.ez
 import patatt
 from b4._send import (
     RetryableSendError,
     SendSession,
     State,
+    pending_session,
+    series_directory,
 )
 
 COVER = '20261113-an-intentionally-long-change-id-for-testing-wire-headers-v4-0-0123456789ab@example.org'
@@ -298,6 +303,451 @@ def test_large_series_recovers_original_suffix(tmp_path: Path) -> None:
     ]
 
 
+def run_send(*args: str) -> None:
+    parsed = b4.command.setup_parser().parse_args(['--no-stdin', 'send', *args])
+    b4.ez.cmd_send(parsed)
+
+
+@pytest.fixture(params=['branch-description', 'commit', 'tip-commit'])
+def send_repo(
+    gitdir: str, monkeypatch: pytest.MonkeyPatch, request: pytest.FixtureRequest
+) -> Path:
+    b4.MAIN_CONFIG.update(
+        {
+            'prep-cover-strategy': request.param,
+            'prep-pre-flight-checks': 'disable-all',
+        }
+    )
+    prep_args = ['--no-stdin', 'prep', '-n', 'smtp-resume']
+    if request.param == 'tip-commit':
+        base = b4.git_get_current_branch()
+        assert base is not None
+        prep_args = ['--no-stdin', 'prep', '-e', base]
+        assert b4.git_run_command(None, ['checkout', '-b', 'b4/smtp-resume'])[0] == 0
+    else:
+        b4.ez.cmd_prep(b4.command.setup_parser().parse_args(prep_args))
+    for n in range(2):
+        Path(gitdir, f'send-{n}.txt').write_text(f'Change {n}\n')
+        assert b4.git_run_command(None, ['add', f'send-{n}.txt'])[0] == 0
+        assert b4.git_run_command(None, ['commit', '-m', f'Change {n}'])[0] == 0
+    if request.param == 'tip-commit':
+        b4.ez.cmd_prep(b4.command.setup_parser().parse_args(prep_args))
+    _cover, tracking = b4.ez.load_cover()
+    b4.ez.store_cover(
+        'Two changes\n\nA cover letter.\n\nTo: list@example.org\n', tracking
+    )
+    monkeypatch.setattr(b4, 'SENDEMAIL_CONFIG', {'smtpserver': 'smtp.example.org'})
+    monkeypatch.setattr('builtins.input', lambda _prompt: '')
+    return series_directory(tracking['series']['change-id'])
+
+
+def configure_smtp(monkeypatch: pytest.MonkeyPatch, smtp: FakeSMTP) -> None:
+    def get_smtp(dryrun: bool = False) -> Tuple[Any, str]:
+        return (None if dryrun else smtp.connector()), str(b4.USER_CONFIG['email'])
+
+    monkeypatch.setattr(b4, 'get_smtp', get_smtp)
+
+
+def interrupt_send(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> Tuple[SendSession, FakeSMTP]:
+    smtp = FakeSMTP({}, smtplib.SMTPDataError(421, b'temporary'))
+    configure_smtp(monkeypatch, smtp)
+    with pytest.raises(SystemExit) as exc:
+        run_send('--no-sign')
+    assert exc.value.code == 1
+    session = pending_session(send_repo)
+    assert session is not None
+    return session, smtp
+
+
+def test_cli_resume_and_reroll(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    saved, first = interrupt_send(send_repo, monkeypatch)
+    _cover, tracking = b4.ez.load_cover()
+    assert tracking['series']['revision'] == 1
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    monkeypatch.setattr(
+        b4.ez,
+        'get_prep_branch_as_patches',
+        Mock(side_effect=AssertionError('must not regenerate')),
+    )
+    run_send('--resume')
+    assert second.calls[0] == first.calls[1]
+    assert len(second.calls) == 2
+    _cover, tracking = b4.ez.load_cover()
+    assert tracking['series']['revision'] == 2
+    assert tracking['series']['history']['v1'] == [saved.state.cover_message_id]
+    assert pending_session(send_repo) is None
+    run_send('--resume')
+    assert len(second.calls) == 2
+
+
+def test_fresh_send_is_blocked_while_pending(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    _saved, smtp = interrupt_send(send_repo, monkeypatch)
+    generate = Mock(side_effect=AssertionError('must not regenerate'))
+    monkeypatch.setattr(b4.ez, 'get_prep_branch_as_patches', generate)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    generate.assert_not_called()
+    assert len(smtp.calls) == 2
+
+
+@pytest.mark.parametrize('what', ['head', 'cover', 'dirty', 'sender', 'excluded'])
+def test_resume_uses_saved_submission_after_changes(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, what: str
+) -> None:
+    saved, first = interrupt_send(send_repo, monkeypatch)
+    original_cover, original_tracking = b4.ez.load_cover(strip_comments=False)
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    if what == 'head':
+        assert (
+            b4.git_run_command(None, ['commit', '--allow-empty', '-m', 'Changed'])[0]
+            == 0
+        )
+    elif what == 'cover':
+        cover, tracking = b4.ez.load_cover()
+        b4.ez.store_cover(cover + '\nAnother paragraph.\n', tracking)
+    elif what == 'dirty':
+        Path('send-0.txt').write_text('uncommitted')
+    elif what == 'sender':
+        monkeypatch.setattr(
+            b4, 'get_smtp', lambda: (second.connector(), 'other@example.org')
+        )
+    else:
+        b4.MAIN_CONFIG['email-exclude'] = 'list@example.org'
+    changed_head = b4.git_revparse_obj('HEAD')
+    changed_cover = b4.ez.load_cover(strip_comments=False)
+    if what == 'sender':
+        run_send('--resume')
+        assert pending_session(send_repo) is None
+    else:
+        with pytest.raises(SystemExit) as exc:
+            run_send('--resume')
+        assert exc.value.code == 1
+        assert b4.git_revparse_obj('HEAD') == changed_head
+        assert b4.ez.load_cover(strip_comments=False) == changed_cover
+    if what == 'excluded':
+        assert not second.calls
+    else:
+        assert len(second.calls) == 2
+        assert second.calls[0] == first.calls[1]
+        assert all(call[0] == saved.state.fromaddr for call in second.calls)
+        assert SendSession.load(saved.directory).delivered()
+    if what in {'head', 'cover', 'dirty'}:
+        monkeypatch.setattr(
+            b4, 'get_smtp', Mock(side_effect=AssertionError('all accepted'))
+        )
+        with pytest.raises(SystemExit):
+            run_send('--resume')
+        assert b4.ez.load_cover(strip_comments=False) == changed_cover
+        assert b4.git_run_command(None, ['reset', '--hard', saved.state.head])[0] == 0
+        if b4.ez.get_cover_strategy() == 'branch-description':
+            b4.ez.store_cover(original_cover, original_tracking)
+        run_send('--resume')
+        assert pending_session(send_repo) is None
+        assert b4.ez.load_cover()[1]['series']['revision'] == 2
+
+
+def test_resume_export_never_connects_or_updates_progress(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, tmp_path: Path
+) -> None:
+    saved, _first = interrupt_send(send_repo, monkeypatch)
+    before = (saved.directory / 'state.json').read_bytes()
+    monkeypatch.setattr(
+        b4, 'get_smtp', Mock(side_effect=AssertionError('must not connect'))
+    )
+    out = tmp_path / 'outgoing'
+    run_send('--resume', '-o', str(out))
+    assert sorted(path.read_bytes() for path in out.glob('*.eml')) == sorted(
+        saved.message_bytes(n) for n in (1, 2)
+    )
+    assert (saved.directory / 'state.json').read_bytes() == before
+    run_send('--resume', '--dry-run')
+    assert (saved.directory / 'state.json').read_bytes() == before
+
+
+@pytest.mark.parametrize(
+    'option',
+    [
+        ('--to', 'other@example.org'),
+        ('--cc', 'other@example.org'),
+        ('--no-sign',),
+        ('--reflect',),
+        ('--resend',),
+        ('--use-web-endpoint',),
+        ('--force-cover-letter',),
+    ],
+)
+def test_resume_disallows_message_changes(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, option: Tuple[str, ...]
+) -> None:
+    _saved, smtp = interrupt_send(send_repo, monkeypatch)
+    with pytest.raises(SystemExit):
+        run_send('--resume', *option)
+    assert len(smtp.calls) == 2
+
+
+def test_series_lock_prevents_parallel_senders(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    _saved, smtp = interrupt_send(send_repo, monkeypatch)
+    with b4.lockfile_nb(str(send_repo / 'send.lock')), pytest.raises(SystemExit):
+        run_send('--resume')
+    assert len(smtp.calls) == 2
+
+
+@pytest.mark.parametrize('after_reroll', [False, True])
+def test_bookkeeping_recovery_sends_no_mail(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, after_reroll: bool
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    original = b4.ez.reroll
+
+    def interrupted(*args: Any, **kwargs: Any) -> None:
+        if after_reroll:
+            original(*args, **kwargs)
+        raise RuntimeError('interrupted bookkeeping')
+
+    monkeypatch.setattr(b4.ez, 'reroll', interrupted)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    assert len(smtp.calls) == 3
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.delivered()
+    monkeypatch.setattr(b4.ez, 'reroll', original)
+    monkeypatch.setattr(
+        b4, 'get_smtp', Mock(side_effect=AssertionError('all accepted'))
+    )
+    run_send('--resume')
+    assert pending_session(send_repo) is None
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+
+
+def test_interrupted_cover_tracking_update_is_completed_once(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    original = b4.ez.store_cover
+    intermediate_cover = None
+
+    def interrupted(cover: str, tracking: Dict[str, Any], new: bool = False) -> None:
+        nonlocal intermediate_cover
+        intermediate_cover = cover
+        if b4.ez.get_cover_strategy() == 'branch-description':
+            branch = b4.git_get_current_branch()
+            b4.git_set_config(None, f'branch.{branch}.description', cover)
+        raise OSError('interrupted while saving cover/tracking')
+
+    monkeypatch.setattr(b4.ez, 'store_cover', interrupted)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    assert len(smtp.calls) == 3
+    assert b4.ez.load_cover()[1]['series']['revision'] == 1
+    monkeypatch.setattr(b4.ez, 'store_cover', original)
+    monkeypatch.setattr(
+        b4, 'get_smtp', Mock(side_effect=AssertionError('all accepted'))
+    )
+    run_send('--resume')
+    cover, tracking = b4.ez.load_cover(strip_comments=False)
+    assert intermediate_cover is not None
+    assert cover == intermediate_cover.strip()
+    assert cover.count('Changes in v2:') == 1
+    assert tracking['series']['revision'] == 2
+    assert len(tracking['series']['history']['v1']) == 1
+    assert pending_session(send_repo) is None
+
+
+def test_failed_tag_creation_does_not_advance_revision(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    original = b4.git_run_command
+
+    def fail_tag(topdir: Any, args: List[str], **kwargs: Any) -> Tuple[int, str]:
+        if args[0] == 'tag':
+            return 1, 'cannot create tag'
+        return original(topdir, args, **kwargs)
+
+    monkeypatch.setattr(b4, 'git_run_command', fail_tag)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    assert len(smtp.calls) == 3
+    assert b4.ez.load_cover()[1]['series']['revision'] == 1
+    monkeypatch.setattr(b4, 'git_run_command', original)
+    monkeypatch.setattr(
+        b4, 'get_smtp', Mock(side_effect=AssertionError('all accepted'))
+    )
+    run_send('--resume')
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+    assert pending_session(send_repo) is None
+
+
+def test_signed_bytes_are_not_resigned(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    def sign(data: bytes) -> bytes:
+        return b'X-Developer-Signature: frozen-test-signature\n' + data
+
+    signer = Mock(side_effect=sign)
+    monkeypatch.setattr(patatt, 'rfc2822_sign', signer)
+    first = FakeSMTP({}, smtplib.SMTPDataError(550, b'limit'))
+    configure_smtp(monkeypatch, first)
+    with pytest.raises(SystemExit):
+        run_send()
+    assert signer.call_count == 3
+    saved = pending_session(send_repo)
+    assert saved is not None
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    signer.side_effect = AssertionError('must not sign again')
+    run_send('--resume')
+    assert second.calls[0][2] == first.calls[1][2]
+    assert b'X-Developer-Signature: frozen-test-signature\r\n' in second.calls[0][2]
+
+
+def test_dryrun_does_not_create_a_submission(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, tmp_path: Path
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    run_send('--no-sign', '-o', str(tmp_path / 'out'))
+    assert pending_session(send_repo) is None
+    assert not smtp.calls
+
+
+@pytest.mark.parametrize('outcome,count', [('sent', 1), ('unsent', 2)])
+def test_cli_reconciles_uncertain_delivery(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, outcome: str, count: int
+) -> None:
+    first = FakeSMTP({}, TimeoutError('no final response'))
+    configure_smtp(monkeypatch, first)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.state.in_flight == 1
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    with pytest.raises(SystemExit):
+        run_send('--resume')
+    assert not second.calls
+    before = (saved.directory / 'state.json').read_bytes()
+    with pytest.raises(SystemExit):
+        run_send('--resume', '--resolve-uncertain', outcome, '--dry-run')
+    assert (saved.directory / 'state.json').read_bytes() == before
+    run_send('--resume', '--resolve-uncertain', outcome)
+    assert len(second.calls) == count
+    assert pending_session(send_repo) is None
+
+
+def test_resume_uses_same_state_from_subdirectory(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    saved, _first = interrupt_send(send_repo, monkeypatch)
+    child = Path('nested') / 'directory'
+    child.mkdir(parents=True)
+    monkeypatch.chdir(child)
+    assert series_directory(saved.state.change_id) == send_repo
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    run_send('--resume')
+    assert len(second.calls) == 2
+
+
+def test_no_snapshot_is_published_when_signing_fails(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    signer = Mock(side_effect=patatt.SigningError('test failure'))
+    monkeypatch.setattr(patatt, 'rfc2822_sign', signer)
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    with pytest.raises(SystemExit):
+        run_send()
+    assert not smtp.calls
+    assert pending_session(send_repo) is None
+
+
+@pytest.mark.parametrize('option', ['--reflect', '--preview-to'])
+def test_non_submission_modes_do_not_create_resume_state(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch, option: str
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    args = ['--no-sign', option]
+    if option == '--preview-to':
+        args.append('preview@example.org')
+    run_send(*args)
+    assert len(smtp.calls) == 3
+    assert pending_session(send_repo) is None
+    assert b4.ez.load_cover()[1]['series']['revision'] == 1
+
+
+def test_finish_failed_snapshot_update_is_idempotent(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    original = SendSession.save
+
+    def fail_if_finished(self: SendSession) -> None:
+        if self.state.finished:
+            raise OSError('disk full after reroll')
+        original(self)
+
+    monkeypatch.setattr(SendSession, 'save', fail_if_finished)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign')
+    assert len(smtp.calls) == 3
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+    monkeypatch.setattr(SendSession, 'save', original)
+    run_send('--resume')
+    assert len(smtp.calls) == 3
+    assert pending_session(send_repo) is None
+    assert b4.ez.load_cover()[1]['series']['revision'] == 2
+
+
+def test_new_revision_can_be_sent_after_completion(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    smtp = FakeSMTP()
+    configure_smtp(monkeypatch, smtp)
+    run_send('--no-sign')
+    assert pending_session(send_repo) is None
+    run_send('--no-sign')
+    assert len(smtp.calls) == 6
+    assert b4.ez.load_cover()[1]['series']['revision'] == 3
+    assert pending_session(send_repo) is None
+
+
+def test_source_change_at_resume_confirmation_only_defers_bookkeeping(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    _saved, _first = interrupt_send(send_repo, monkeypatch)
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+
+    def change_branch(_prompt: str) -> str:
+        b4.git_run_command(
+            None, ['commit', '--allow-empty', '-m', 'Changed during prompt']
+        )
+        return ''
+
+    monkeypatch.setattr('builtins.input', change_branch)
+    with pytest.raises(SystemExit):
+        run_send('--resume')
+    assert len(second.calls) == 2
+    saved = pending_session(send_repo)
+    assert saved is not None and saved.delivered()
+
+
 @pytest.mark.parametrize('failure', ['data', 'recipient'])
 def test_real_smtplib_against_local_server(session: SendSession, failure: str) -> None:
     """Exercise actual SMTP responses without delivering or relaying any mail."""
@@ -441,3 +891,21 @@ def test_resumed_signatures_verify_without_private_key(
         results = patatt.validate_message(data, [str(tmp_path / 'keys')])
         assert len(results) == 1
         assert results[0][0] == patatt.RES_VALID
+
+
+def test_resume_respects_exclusions_in_frozen_headers(
+    send_repo: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    first = FakeSMTP({}, {'test-override@example.com': (450, b'later')})
+    configure_smtp(monkeypatch, first)
+    with pytest.raises(SystemExit):
+        run_send('--no-sign', '--cc', 'test-override@example.com')
+    saved = pending_session(send_repo)
+    assert saved is not None
+    assert 'list@example.org' in saved.state.messages[1].accepted
+    b4.MAIN_CONFIG['email-exclude'] = 'list@example.org'
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    with pytest.raises(SystemExit):
+        run_send('--resume')
+    assert not second.calls

-- 
2.53.0

