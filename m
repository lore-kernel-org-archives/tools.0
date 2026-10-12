Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9433AE18A
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784726; cv=pass; b=AInNFb/za8qOwWotJLHr0cNWKhCDyzyp4WDR2mxH3Emz1HQi1+45rrRqpW7Mj0F+yHI1g5Q6GopFJDnC0EgIbcmqSJ+oQMe/HG5v7CAc5/T6nUCwC9XegfX2kOqGE/OsS71SbT2aVMo9tw457ELOvzTf0Jr2sZIv5KTtQ7o+yws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784726; c=relaxed/simple;
	bh=ZHeR8DL9rn4uERakRjKb3JBdQe6A3SeRrltHlQFBq68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmzDRHUkFjLTqfviu0JDFWOBrIJPyl4iZ3OhLDitLjLNI6sFFCYY8ObhAvsejT+aMN3vnFOtfCGxCrbgSyXRzzrQAIruOZPASjuAmVJNtt+r2DoDehtL4vRV5vaLGKDYb0qb8BRVdnuPC5llLn5HJzFunQoI8+U2ET2iulXmkAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvZQoafh; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvZQoafh"
Received: by smtp.kernel.org (Postfix)
	id 699351F0089C; Mon, 12 Oct 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784725;
	b=xal23x34krUCFwAToZSnIZJfEqVjHztcPrj+97hhjjl6P/P+04RcsWMpcg1mMpHLiJNv
	 IsQ68LyFNEBaZrvJjIXtFILjJ/c27o1LAJSyjNMtLR/qAxkpsvkr7PGEfjtOLe9FYjjYE
	 7e5BzXcQ1bxoYqXUgC+84nEqTp12eyuHCwlqYbPwm1fOJD+wwl0CcgzTKLV5VgRKTdbkM
	 De136pQ4DT5ht43uy7ho/TXseXonr4vwCPvci5TQ/wRYWZNJvrrONCJsH9Bm8woEP/pnQ
	 5L2apInFC8ODU/FiBKuVjvqW4PSLrQDZmSVuJ2y38ZVQe/F2K068qxi1yEp0egYKAEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Pai6deZZUxw36Yv/EtG9Z9BpgzTlTot/xavwjzz/yQM=;
	b=m5ZQuH2LgjT8dyxMn8BJBNB/TLQ0bYe+60Cs+w+6/DkpAgSX+z7WjLhdJD5MzvIlw8DF
	 tQATyWsc9Ejd5hAqzetbgxwEhFvJrjQb5UOy6wa+JOg7LrUDjWs71OqKx04T4zkfUJZdt
	 Uq4EYelEpMTHxJQBv9eVNeJyGlpMYzCpHpQKO4/u7H2ttYLzZp+Sk3DsS8VNLgSl5RpYV
	 0ifh5KXE6hmaua4sDZ6kTagFKi+3bm6LCL1C7eeMFIrJWymPjTW7GypK/lLnXVomEi2Sv
	 Sxwia2K7OenEX5oNIjbJi7niGuLXmu/LIe80fUifbkBuL7EacOv4zQ4BbvVWe0TQg7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dvZQoafh;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C16E61F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dvZQoafh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C16E61F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2577530eec.0
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784724; x=1792389524; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pai6deZZUxw36Yv/EtG9Z9BpgzTlTot/xavwjzz/yQM=;
        b=dvZQoafhsC9y4bUXu+aLixbt+mcfOkUOc/VwwsO0vqz+tDJYxN6gO1hLmaufBtwEpe
         T4fuOLdiAubTqcHIpVvEKfDpxmkwugnkFPrQ1bbig9DGDTroTjHef4yAH10KD5+MfSdS
         zbcd+IHsk9ArPprh1zxzMjlovEqtBvr1y2MwZM2ff3IJMWIx8CQXZ5Kg0sWiXWuUGZoH
         qtTiEIYWYeYitVK0wF4hTMktzDL+J55iU0YBqB+gDEDLm/hXp/0lnFMPcgiCQIY6BM0h
         xvJVhGqT9ROfzfJnlterW3eERPLAzVmmqPRGG/fOXzwqXfaqC+u0bkmVe2nVj9kGQLpW
         t33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784724; x=1792389524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pai6deZZUxw36Yv/EtG9Z9BpgzTlTot/xavwjzz/yQM=;
        b=dz0/l4L0mDbsio4mEFvzGMiGaHdrhkAoPrLHxWXHbw5Z98A9W3+HD8/J4iS8nANMTw
         RM2K8Xlnep0YCkAJZ+6JVMEnj4hE21INr+XJtKnSp1NLoT3viVqCIZnBme7DArhgldhR
         EQ0gKP4k7i68uM/1Lkuem01cSr1wdDhHKfioQQid1jbGdGENt1FvGsD56lPQlxJtsnza
         5ivb9BNPq+xy/I/AFdjGjZKdR9K9qQEFwpy/mEN20F/uPHOPDmOFlo1NUo0Hm7MlYKPv
         gFsVdrzx9kVgrYx+MLhZ077+hjsfSUBK2ZkVuK2Y1stwjZDLI121ZllSkCLaltOWheeF
         O7/A==
X-Gm-Message-State: AFq9FYIJmtIHLsAVms/bOUc3PwzDfNDdUW0WaFTIpQjKU3NHS7tzCVev
	A22qk/xw4qE36lmsSFV2Y7Ks3jwPWb5wlsiZUq9qmHOFw8OGoJ2mWdlH
X-Gm-Gg: AYBFou1wd54ynAdxb43lM3RiE6X7vLxDTUpahX6jM0+jXYoxuoFYIf70Xh6BAqw7/3i
	EDmaEOohFgUhiogHoqADQ/crYnUA/I0rjlqPfQrVxgUrDBFHnb1aMZSS7XKrcqHCHatpwiW82kg
	O4YOkQKU1rYOsiyf/sPPBq0ZVwL0PVdinBphQBfqb0c1JZ8JFWp1gE9GjREzyObFa3IFUOozl46
	BE6pzQzyegd3p9oVbV8+uyu7+7LFPRCaW94vUz4eD0GkU0dowYcZ9xRwBHvzH/JyuEPzIvqWYDq
	CRFusZGvaWKF1U8Tq1BrWe0S+ZNXaaeR4Qs8ZdJHfdLXVBtVEw3dxjM3Fpz1T6OrKa5JapjpiK7
	ptOq3YMOq00h0tb84duz1PuTbqPNHXOlc+uW+TFRl7LYK6uaTb8WmIuG2JF5PnfhRWQ5S82+/bG
	KdzxrvxZuNPI6u94WhrmpPu1nFOvXtY+VzGbUU0rZ/b8PksirThNvZiNuDgxtyfp75uCypBx0wX
	oXi6QTxdPeBZnOzcVXz/oUb5+BfH8rpVp9wsrjau9yGyo4Hf1Vyzlvn3+2xr/oUhullzkDkvA==
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr12357873eec.7.1791784723761;
        Sun, 11 Oct 2026 22:58:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Oct 2026 22:58:29 -0700
Subject: [PATCH b4 v2 4/5] b4: reject Bcc trailers in patches and cover
 letter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-send-series-bcc-v2-4-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

b4 send does not support per-patch or cover-letter Bcc: trailers.
Without an explicit check, a Bcc: trailer containing an email address
is parsed as a person trailer and silently added to the public Cc:
header, leaking the intended blind recipient.

Explicitly abort with a critical error in get_cover_dests() and
cmd_send() when a person Bcc: trailer is encountered, checking before
commit-only, deduplication, or --no-trailer-to-cc / --preview-to
filters while stripping the patch diff first so diff lines and
non-person prose do not trigger false positives.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 src/b4/ez.py         | 62 +++++++++++++++++++++++++---------------
 src/tests/test_ez.py | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+), 23 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 71b4648..b2c33fa 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2278,6 +2278,12 @@ def get_cover_dests(
         elif mtr.lname == 'cc' and mtr.addr is not None:
             ccs.append(mtr.addr)
             mtrs.remove(mtr)
+        elif mtr.lname == 'bcc' and mtr.addr is not None:
+            logger.critical('CRITICAL: Bcc trailers in patches are not supported.')
+            logger.critical(
+                '          Please remove them and use --bcc or send-series-bcc configuration.'
+            )
+            sys.exit(1)
     cbody = b4.LoreMessage.rebuild_message(htrs, cmsg, mtrs, basement, sig)
     return tos, ccs, cbody
 
@@ -2935,31 +2941,41 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
     else:
         seen.update([x[1] for x in todests])
         seen.update([x[1] for x in ccdests])
-        # Go through the messages to make to/cc headers
-        for commit, msg in patches:
-            if not msg:
+
+    # Go through the messages to make to/cc headers
+    for commit, msg in patches:
+        if not msg:
+            continue
+        body, _ = b4.LoreMessage.get_payload(msg)
+        btrs, _ = b4.LoreMessage.find_trailers(b4.DIFF_RE.split(body, maxsplit=1)[0])
+        for btr in btrs:
+            if btr.type != 'person':
                 continue
-            body, _ = b4.LoreMessage.get_payload(msg)
-            btrs, _ = b4.LoreMessage.find_trailers(body)
-            for btr in btrs:
-                if btr.type != 'person':
-                    continue
-                if btr.addr is None:
-                    logger.debug('Skipping trailer %s with no address', btr.lname)
-                    continue
-                if btr.addr[1] in seen:
-                    continue
-                if commit:
-                    cpccs = pccs[commit]
-                    if btr.addr not in cpccs:
-                        cpccs.append(btr.addr)
-                    continue
-                seen.add(btr.addr[1])
-                if btr.lname == 'to':
-                    todests.append(btr.addr)
-                    continue
-                ccdests.append(btr.addr)
+            if btr.lname == 'bcc':
+                logger.critical('CRITICAL: Bcc trailers in patches are not supported.')
+                logger.critical(
+                    '          Please remove them and use --bcc or send-series-bcc configuration.'
+                )
+                sys.exit(1)
+            if cmdargs.preview_to or cmdargs.no_trailer_to_cc:
+                continue
+            if btr.addr is None:
+                logger.debug('Skipping trailer %s with no address', btr.lname)
+                continue
+            if btr.addr[1] in seen:
+                continue
+            if commit:
+                cpccs = pccs[commit]
+                if btr.addr not in cpccs:
+                    cpccs.append(btr.addr)
+                continue
+            seen.add(btr.addr[1])
+            if btr.lname == 'to':
+                todests.append(btr.addr)
+                continue
+            ccdests.append(btr.addr)
 
+    if not (cmdargs.preview_to or cmdargs.no_trailer_to_cc):
         excludes = b4.get_excluded_addrs()
         conf_me_too = str(config.get('send-me-too', 'yes')).lower()
         if cmdargs.not_me_too or conf_me_too in {'no', 'n', 'false', '0'}:
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index ccfe0dc..6a9a883 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1483,3 +1483,84 @@ def test_prep_cover_and_deps_flags_are_mutually_exclusive() -> None:
         parser.parse_args(['prep', '--edit-cover', '--cover-from-file', '-'])
     with pytest.raises(SystemExit):
         parser.parse_args(['prep', '--show-deps', '--deps-from-file', '-'])
+
+
+def test_send_rejects_per_patch_bcc_trailer(
+    prepdir_commit: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """A Bcc: trailer in a patch commit must be rejected by `b4 send` rather
+    than silently added to the per-patch / cover-letter Cc list.
+    """
+    with open(os.path.join(prepdir_commit, 'file1.txt'), 'a') as fh:
+        fh.write('diff context line\nBcc: diff-context@example.com\n')
+    b4.git_run_command(prepdir_commit, ['add', 'file1.txt'])
+    valid_commit_msg = (
+        'feat: test bcc false positives\n\n'
+        'Bcc: headers are stripped before signing.\n\n'
+        'Signed-off-by: Test Author <author@example.com>\n'
+    )
+    ecode, _ = b4.git_run_command(prepdir_commit, ['commit', '-m', valid_commit_msg])
+    assert ecode == 0
+
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        [
+            '--no-stdin',
+            '--no-interactive',
+            '--offline-mode',
+            'send',
+            '--dry-run',
+            '--to',
+            'list@example.com',
+        ]
+    )
+    b4.ez.cmd_send(cmdargs)
+
+    with open(os.path.join(prepdir_commit, 'file1.txt'), 'a') as fh:
+        fh.write('bcc trailer test\n')
+    b4.git_run_command(prepdir_commit, ['add', 'file1.txt'])
+    commit_msg = (
+        'feat: test bcc trailer rejection\n\n'
+        'Bcc: Secret Person <secret@example.com>\n'
+        'Signed-off-by: Test Override <test-override@example.com>\n'
+    )
+    ecode, _ = b4.git_run_command(prepdir_commit, ['commit', '-m', commit_msg])
+    assert ecode == 0
+
+    flag_sets = [
+        ['--dry-run'],
+        ['--dry-run', '--no-trailer-to-cc'],
+        ['--preview-to', 'preview@example.com'],
+    ]
+    for extra_flags in flag_sets:
+        caplog.clear()
+        cmdargs = parser.parse_args(
+            [
+                '--no-stdin',
+                '--no-interactive',
+                '--offline-mode',
+                'send',
+                '--to',
+                'list@example.com',
+            ]
+            + extra_flags
+        )
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            with pytest.raises(SystemExit) as ex:
+                b4.ez.cmd_send(cmdargs)
+        assert ex.value.code == 1
+        assert 'Bcc trailers in patches are not supported' in caplog.text
+
+
+def test_cover_rejects_bcc_trailer(caplog: pytest.LogCaptureFixture) -> None:
+    cbody = (
+        'Subject: [PATCH 0/1] Cover letter\n\n'
+        'Cover letter body\n\n'
+        'Bcc: Secret Person <secret@example.com>\n'
+        'Signed-off-by: Test Author <author@example.com>\n'
+    )
+    with caplog.at_level(logging.CRITICAL, logger='b4'):
+        with pytest.raises(SystemExit) as ex:
+            b4.ez.get_cover_dests(cbody)
+    assert ex.value.code == 1
+    assert 'Bcc trailers in patches are not supported' in caplog.text

-- 
2.56.0.385.gd3acb90ef8-goog

