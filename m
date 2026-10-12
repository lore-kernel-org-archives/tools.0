Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BD31E82E
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784724; cv=pass; b=fLqapWhnAQMjJYucbF8DHHIxcYuv2gFQaKllruTaHqDOmItgpj/Bac9PFjhyQZOFkDYCzWjQHI4rmb3atkUAdEVRisgUpu6nEAj9K3gcJzZl4WIgSVUnja/ZKKX3ZckMT0/3atzHSW1qVgjTLXu0BAP+/Fu9lcsiDLaoB5Daxaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784724; c=relaxed/simple;
	bh=/titSd3uh7cIkEcYS2Xis0VKgoV98K5UE6ur2Dsijts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=US6w3503mv3iPafuqm1//VWFGhCyzY0wzf5xdcK+BDmCwwRcgtFwCA1t6PK5sjvBt/U6aDDxZlUQswfF6HG+0a82zNyQcsFPHWzJjWaAXZY89G2+dD6jiKCbhMLEer+5iXSgjEvHiU12DVlabP28iZ+wBGyhIOe6puhR6QW2jxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEgB6bgt; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEgB6bgt"
Received: by smtp.kernel.org (Postfix)
	id 0A4BE1F0089C; Mon, 12 Oct 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784722;
	b=0aTI7l/Pf2dEwhCI2PuR7Kb0QEE68wSeaLg6hygA7czYPqk4V/hEoP0jGmj4qHoukYwU
	 qPxReBNKlo+/T8o5nEgS8XV58uJh3JMAvxinL5K3oRyKPeuVGY6zgV2WLAwQ9+mxpqVI3
	 iWkz5ATO/oSMxIfsB9Tdgj9JbADHaZZ+m8a4501qHLkVZeRY9mCsaA0172jSuyrZurC7z
	 +vBL3KIihfFEQ/T3fq2dBOIw/XGvZFaGnVGuqb8u5bncNOfM/rNReyfuQOnogBrsqQKJQ
	 b9AY1z1evbF/4JSVtLc685kB7cE7vBJXrQ4merbBueVTFgPLjAqXEaBJSNE9x3p7G4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=EyZgh9jGpgmx3i0TApHZhLLodnzOnGMmTCC1e6jpxtc=;
	b=fGyqQ8/M1qTTb/2rYS3CsxPO75X79PnM6SORCtIHqClL6PiqjGpLkSlvtBLxBsCjRlhY
	 Wz1ceck9uJ/KU+CVRl1Vh1ghmUSztBu4i/pIX7vbm/Zf1dmL/VOwM/3Y+/QcDKopwP5EM
	 W1YiIvta3P6n0m2RGYLUPsV0CO+qPyHSux16rZFD4wEvJU/09V4aZQOmlXaMeouHwPBat
	 AR4DYP320INZp7s1qOEqyo34vC0xp3toDtGZ5utxc8KYiJxXThp4mkUAGL21FtOglz8qN
	 hbGfPfNPP9yR83CWh/hHdbMKzMHf0eq26uCSZaNYn1EinNHUM6rDpnNHLK0jycxoDMw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aEgB6bgt;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21DAF1F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aEgB6bgt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 21DAF1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2062141eec.1
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784721; x=1792389521; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyZgh9jGpgmx3i0TApHZhLLodnzOnGMmTCC1e6jpxtc=;
        b=aEgB6bgtj9ysDhX+B/rLKl50Qmzbw4W0AeQgmtSu3J6bmrCL1HQmK3oj5BFhtu9/HD
         tyMKpfC+HS2+CQpSQbcDfqC9loo/tFP8tULmlzufELHPE9O0OwdQ0BwA7hq/MId4MfaL
         CfFVCje+Fk8IrbckUBsxvUMlWvlqJxQE3m12aOqPIT6EFgj6RHIFUSo1Uh3zIk9+mpNh
         8uDT5ic4pE8L5zvJ4BWfIYfDkeu1nYMq418FnOtlyCEByRtgErIEzLVqM/tlO422xrz9
         Qkolir+pR3jgxAOkmQyPUB4Z/pUGRAVZTrY+SHtQi/Bagpa7pgfaaOY5UnYSijqOLNx7
         4DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784721; x=1792389521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyZgh9jGpgmx3i0TApHZhLLodnzOnGMmTCC1e6jpxtc=;
        b=wrMiuQyTb0n+DlQenNfrEz9IiRjHSS3JyUiLPpwOWXkXi7+y1GVIB+bC42j2fSe5m5
         tx5772GnN93QU1Of13SUOZ+YSqutwi1yZxD7d/krVROBr5b3+Mluz43gEG4x/6nuA7oK
         pZx1ayu5yS0BFRzlj4LbDCCMrpCBk+iigHBiH2rGZFTSh2skVBzYG21aMyVSrE08LSjJ
         lUeJa+BIDI0ThNgskWPoXQq4YIR+Y9raPLdQwJsb8z2k9K9UbjSSxgccbRkGJKQGdgoN
         IdhEuJxnDXXkIZAJtnD91BMDEEfBY2AUhtP7N1IpKh4JZDSejrGfJSbVL+eyjPtO4PTj
         Sjrw==
X-Gm-Message-State: AFq9FYKp93a7g3KBmex8bOumYv6bxcjbWH8KHisE6EJHG3DGjW3L8jN7
	sguRYsP35W9msfHhh/1iW74q5pSMxZAS0ZQN0nLpkUIYGRI6R9tejerR
X-Gm-Gg: AYBFou3ffsqCckqo1JvLhpnIzAv1sg0meTUfpr/PhRyC4nVZvJTmBL0A58q9QYTs3Dm
	5D4EY3N1haHVPFjFhI5aJOk9xrtRngvTsaey90xFNtwyplDkEOEwGtStYbzbbRWUnjlb1E5krrx
	KEl5E/aOX5cju4Mxpbgyyxerk2nfGignmBsExM0ke1tqQRqI6evcp/ARsEwdBvxwGQShLB1BPW1
	99VPz1x78LAju/bEdCSb51mUJgSmGLm16NPU0suzJE7zt8o/W2DnZwsolh1buJtEOMTBeHkzEuz
	Ly1eaza9Qv6r8eW70bCsvWt3MV/hBxTilCmBKWkWB75ZItJh7FS8QPu7cdWXTUepERpJTnamLWE
	L3xxOU2d4x0o7uQn6FYOM0sC5dlRQ6jpZDzWElSYK7zAa4za68Tbxqm3SKH3Gk61ZNB55wVegrK
	zcwszEKGbwMQFxnTEWWU4fmk6LsiAP1UgMMeFdjGp24nd5/+IqP24u0fhxil3jGw7lBLs7dbLvA
	czJ+T31ItqN1u+K6qPjZqBy/VJVO+RgGzyiU8OyKcrLtQA2c9T6CEk9gy4o+RY=
X-Received: by 2002:a05:7300:fd03:b0:351:4866:255c with SMTP id 5a478bee46e88-3537e058277mr16493544eec.32.1791784720986;
        Sun, 11 Oct 2026 22:58:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Oct 2026 22:58:27 -0700
Subject: [PATCH b4 v2 2/5] b4: implement --bcc and send-series-bcc config
 option
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-send-series-bcc-v2-2-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

Allow using blind carbon copy when sending entire series (no per-patch
Bcc).

Handle BCC addresses directly in send_mail() as envelope recipients
without adding and stripping temporary Bcc: message headers, and include
BCC recipients in JSON submission payload when sending via the web
endpoint. Also display configured BCC recipients in review TUI
confirmation dialog.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 docs/config.rst              | 13 +++++-
 docs/contributor/send.rst    | 11 ++++-
 src/b4/__init__.py           | 36 ++++++++++++----
 src/b4/command.py            |  3 ++
 src/b4/ez.py                 | 27 +++++++++++-
 src/b4/review_tui/_modals.py | 15 +++++++
 src/tests/test___init__.py   | 99 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 192 insertions(+), 12 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 32d1dc1..6b606b6 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -46,8 +46,8 @@ unrestricted:
   on the series you are preparing yourself
 - ``prep-pre-flight-checks`` -- which pre-flight checks are enabled
 - ``send-*`` -- recipient and addressing options, such as
-  ``send-series-to``, ``send-series-cc``, ``send-auto-to-cmd`` and
-  ``send-auto-cc-cmd``
+  ``send-series-to``, ``send-series-cc``, ``send-series-bcc``,
+  ``send-auto-to-cmd`` and ``send-auto-cc-cmd``
 - ``*mask`` -- URL templates such as ``midmask`` and ``linkmask``
 - ``*template*`` -- message templates
 - ``trailer*`` -- trailer-handling options
@@ -1117,6 +1117,15 @@ Contributor-oriented settings
      .. versionchanged:: v0.15
         Added ``shallow`` config value.
 
+   :term:`b4.send-series-bcc`
+     A comma-separated list of addresses to always add to the "Bcc:" list.
+     Recipients in this list will always receive the series regardless of
+     any exclusion filters (such as the ``--not-me-too`` flag or the
+     :term:`b4.email-exclude` configuration setting).
+     See :ref:`prep_recipients`.
+
+     Default: ``None``
+
    :term:`b4.send-series-cc`
      A comma-separated list of addresses to always add to the "Cc:" header.
      See :ref:`prep_recipients`.
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 52d2da5..7138569 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -338,8 +338,17 @@ Command line flags
   configuration file using the :term:`b4.send-series-cc` option (see
   :ref:`contributor_settings`).
 
+``--bcc``
+  Additional email addresses to include into the Bcc: list. Recipients
+  in this list will always receive the series regardless of any
+  exclusion filters (such as the ``--not-me-too`` flag or the
+  :term:`b4.email-exclude` configuration setting). Separate multiple
+  entries with a comma. You can also set this in the configuration
+  file using the :term:`b4.send-series-bcc` option (see
+  :ref:`contributor_settings`).
+
 ``--not-me-too``
-  Removes your own email address from the recipients. This can be set in
+  Removes your own email address from the To: or Cc: recipients. This can be set in
   the configuration using the :term:`b4.send-me-too`, setting to ``no``.
   (see :ref:`contributor_settings`).
 
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 3a3d12a..2c0d3f1 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5826,6 +5826,7 @@ def send_mail(
     msgs: Sequence[EmailMessage],
     fromaddr: Optional[str],
     destaddrs: Optional[Union[Set[str], List[str]]] = None,
+    bccaddrs: Optional[Union[Set[str], List[str]]] = None,
     patatt_sign: bool = False,
     dryrun: bool = False,
     output_dir: Optional[str] = None,
@@ -5836,6 +5837,20 @@ def send_mail(
     if output_dir is not None:
         dryrun = True
 
+    bcc_set: Set[str] = set()
+    if bccaddrs is not None:
+        bcc_set = set(bccaddrs)
+    else:
+        config = get_main_config()
+        cfg_bcc = config.get('send-series-bcc')
+        if isinstance(cfg_bcc, str) and cfg_bcc:
+            bcc_set = {
+                x[1]
+                for x in cleanup_email_addrs(
+                    email.utils.getaddresses([cfg_bcc]), set(), None
+                )
+            }
+
     if patatt_sign:
         # Signing is the one step here that can block indefinitely: with a PGP
         # key patatt shells out to gpg, which may be waiting on a pinentry
@@ -5843,6 +5858,16 @@ def send_mail(
         logger.info('Signing %s messages with patatt', len(msgs))
 
     for msg in msgs:
+        if not destaddrs:
+            alldests = email.utils.getaddresses([str(x) for x in msg.get_all('to', [])])
+            alldests += email.utils.getaddresses([str(x) for x in msg.get_all('cc', [])])
+            myaddrs = {x[1] for x in alldests}
+        else:
+            myaddrs = set(destaddrs)
+
+        if bcc_set:
+            myaddrs.update(bcc_set)
+
         if not msg.get('X-Mailer'):
             msg.add_header('X-Mailer', f'b4 {__VERSION__}')
         msg.set_charset('utf-8')
@@ -5885,14 +5910,6 @@ def send_mail(
             logger.info('    | %s', bdata.decode().rstrip().replace('\n', '\n    | '))
             logger.info('    --- DRYRUN: message ends ---')
             continue
-        if not destaddrs:
-            alldests = email.utils.getaddresses([str(x) for x in msg.get_all('to', [])])
-            alldests += email.utils.getaddresses(
-                [str(x) for x in msg.get_all('cc', [])]
-            )
-            myaddrs = {x[1] for x in alldests}
-        else:
-            myaddrs = set(destaddrs)
 
         tosend.append((myaddrs, bdata, ls))
 
@@ -5911,6 +5928,9 @@ def send_mail(
             'action': wpaction,
             'messages': [x[1].decode() for x in tosend],
         }
+        if bcc_set and not reflect:
+            req['bcc'] = list(bcc_set)
+
         ses = get_requests_session()
         res = ses.post(web_endpoint, json=req)
         try:
diff --git a/src/b4/command.py b/src/b4/command.py
index 596ae41..1d57f12 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1244,6 +1244,9 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_send.add_argument(
         '--cc', nargs='+', metavar='ADDR', help='Addresses to add to the Cc: list'
     )
+    sp_send.add_argument(
+        '--bcc', nargs='+', metavar='ADDR', help='Addresses to add to the Bcc: list'
+    )
     sp_send.add_argument(
         '--not-me-too',
         action='store_true',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 618abb9..71b4648 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2927,6 +2927,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     excludes: Set[str] = set()
     pccs: defaultdict[str, List[Tuple[str, str]]] = defaultdict(list)
 
+    bccdests = list()
+
     if cmdargs.preview_to or cmdargs.no_trailer_to_cc:
         todests = list()
         ccdests = list()
@@ -2965,6 +2967,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     tos: Set[str] = set()
     ccs: Set[str] = set()
+    bccs: Set[str] = set()
     if cmdargs.preview_to:
         tos.update(cmdargs.preview_to)
     else:
@@ -2978,6 +2981,18 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         scc = config.get('send-series-cc')
         if isinstance(scc, str) and scc:
             ccs.add(scc)
+        if cmdargs.bcc:
+            bccs.update(cmdargs.bcc)
+        sbcc = config.get('send-series-bcc')
+        if isinstance(sbcc, str) and sbcc:
+            bccs.add(sbcc)
+    if bccs:
+        seen_bcc: Set[str] = set()
+        for pair in email.utils.getaddresses(list(bccs)):
+            if pair[1] in seen_bcc:
+                continue
+            seen_bcc.add(pair[1])
+            bccdests.append(pair)
     if ccs:
         for pair in email.utils.getaddresses(list(ccs)):
             if pair[1] in seen:
@@ -2993,6 +3008,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     allto = list()
     allcc = list()
+    allbcc = list()
     alldests = set()
 
     if todests:
@@ -3003,6 +3019,10 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         allcc = b4.cleanup_email_addrs(ccdests, excludes, None)
         logger.debug('allcc: %s', allcc)
         alldests.update(set([x[1] for x in allcc]))
+    if bccdests:
+        allbcc = b4.cleanup_email_addrs(bccdests, set(), None)
+        logger.debug('allbcc: %s', allbcc)
+        alldests.update(set([x[1] for x in allbcc]))
 
     logger.debug('alldests: %s', alldests)
 
@@ -3042,7 +3062,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
     # Give the user the last opportunity to bail out
     if not cmdargs.dryrun:
-        if not len(alldests):
+        if not len(allto):
             logger.critical('CRITICAL: Could not find any destination addresses')
             logger.critical('          try b4 prep --auto-to-cc or b4 send --to addr')
             sys.exit(1)
@@ -3116,6 +3136,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         logger.info('---')
         b4.print_pretty_addrs(allto, 'To')
         b4.print_pretty_addrs(allcc, 'Cc')
+        b4.print_pretty_addrs(allbcc, 'Bcc')
         logger.info('---')
         for commit, msg in patches:
             if not msg:
@@ -3272,6 +3293,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         )
         sys.exit(1)
 
+    send_bcc = [x[1] for x in allbcc]
+
     if endpoint:
         # Web endpoint always requires signing
         if not sign:
@@ -3286,6 +3309,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 None,
                 send_msgs,
                 fromaddr=None,
+                bccaddrs=send_bcc,
                 patatt_sign=True,
                 dryrun=cmdargs.dryrun,
                 output_dir=cmdargs.output_dir,
@@ -3308,6 +3332,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 smtp,
                 send_msgs,
                 fromaddr=fromaddr,
+                bccaddrs=send_bcc,
                 patatt_sign=sign,
                 dryrun=cmdargs.dryrun,
                 output_dir=cmdargs.output_dir,
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 8704e87..13e3464 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -642,6 +642,19 @@ class SendScreen(ModalScreen[bool]):
         self._msgs = msgs
 
     def compose(self) -> ComposeResult:
+        config = b4.get_main_config()
+        cfg_bcc = config.get('send-series-bcc')
+        series_bcc = (
+            {
+                x[1]
+                for x in b4.cleanup_email_addrs(
+                    email.utils.getaddresses([cfg_bcc]), set(), None
+                )
+            }
+            if isinstance(cfg_bcc, str) and cfg_bcc
+            else set()
+        )
+        bcc_count = len(series_bcc)
         text = Text()
         text.append(f'Send {len(self._msgs)} review email(s)?', style='bold')
         text.append('\n')
@@ -657,6 +670,8 @@ class SendScreen(ModalScreen[bool]):
                 recip_parts.append(f'{to_count} To')
             if cc_count:
                 recip_parts.append(f'{cc_count} Cc')
+            if bcc_count:
+                recip_parts.append(f'{bcc_count} Bcc')
             if recip_parts:
                 text.append(f'\n          {", ".join(recip_parts)}')
             text.append('\n')
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 96bea89..85d580c 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2355,6 +2355,105 @@ class TestSignBeforeConnect:
         assert smtp is None
 
 
+class TestSendMailBcc:
+    def test_send_mail_bcc_envelope(self) -> None:
+        seen_dests: List[List[str]] = []
+        seen_bodies: List[bytes] = []
+
+        class _RecordingSMTP:
+            def sendmail(self, fromaddr: str, destaddrs: List[str], bdata: bytes) -> None:
+                seen_dests.append(list(destaddrs))
+                seen_bodies.append(bdata)
+
+        def _connect() -> Any:
+            return _RecordingSMTP()
+
+        msg = email.message.EmailMessage()
+        msg['From'] = 'alice@example.org'
+        msg['To'] = 'bob@example.org'
+        msg['Cc'] = 'carol@example.org'
+        msg['Subject'] = 'Test patch'
+        msg.set_content('Diff content')
+
+        sent = b4.send_mail(
+            b4.SMTPConnector(_connect),
+            [msg],
+            fromaddr='alice@example.org',
+            bccaddrs=['dave@example.org', 'eve@example.org'],
+        )
+        assert sent == 1
+        assert len(seen_dests) == 1
+        assert set(seen_dests[0]) == {'bob@example.org', 'carol@example.org', 'dave@example.org', 'eve@example.org'}
+        assert b'Bcc:' not in seen_bodies[0]
+
+    def test_send_mail_bcc_web_endpoint(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        posted_payload: Dict[str, Any] = {}
+
+        class _FakeResponse:
+            def json(self) -> Dict[str, Any]:
+                return {'result': 'success'}
+
+        class _FakeSession:
+            def post(self, url: str, json: Dict[str, Any]) -> _FakeResponse:
+                posted_payload.update(json)
+                return _FakeResponse()
+
+        monkeypatch.setattr(b4, 'get_requests_session', lambda: _FakeSession())
+
+        msg = email.message.EmailMessage()
+        msg['From'] = 'alice@example.org'
+        msg['To'] = 'bob@example.org'
+        msg['Subject'] = 'Test patch'
+        msg.set_content('Diff content')
+
+        sent = b4.send_mail(
+            None,
+            [msg],
+            fromaddr='alice@example.org',
+            bccaddrs=['dave@example.org'],
+            web_endpoint='https://example.org/_submit',
+        )
+        assert sent == 1
+        assert posted_payload.get('action') == 'receive'
+        assert posted_payload.get('bcc') == ['dave@example.org']
+
+    def test_send_mail_bcc_from_config(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        seen_dests: List[List[str]] = []
+        seen_bodies: List[bytes] = []
+
+        class _RecordingSMTP:
+            def sendmail(self, fromaddr: str, destaddrs: List[str], bdata: bytes) -> None:
+                seen_dests.append(list(destaddrs))
+                seen_bodies.append(bdata)
+
+        def _connect() -> Any:
+            return _RecordingSMTP()
+
+        monkeypatch.setitem(b4.MAIN_CONFIG, 'send-series-bcc', 'dave@example.org, eve@example.org')
+
+        msg = email.message.EmailMessage()
+        msg['From'] = 'alice@example.org'
+        msg['To'] = 'bob@example.org'
+        msg['Cc'] = 'carol@example.org'
+        msg['Subject'] = 'Test patch'
+        msg.set_content('Diff content')
+
+        sent = b4.send_mail(
+            b4.SMTPConnector(_connect),
+            [msg],
+            fromaddr='alice@example.org',
+            bccaddrs=None,
+        )
+        assert sent == 1
+        assert len(seen_dests) == 1
+        assert set(seen_dests[0]) == {
+            'bob@example.org',
+            'carol@example.org',
+            'dave@example.org',
+            'eve@example.org',
+        }
+        assert b'Bcc:' not in seen_bodies[0]
+
 def _fake_editor(tmp_path: pathlib.Path, body: str) -> str:
     """A stand-in $EDITOR that runs *body* and leaves the buffer alone."""
     script = tmp_path / 'fake-editor.sh'

-- 
2.56.0.385.gd3acb90ef8-goog

