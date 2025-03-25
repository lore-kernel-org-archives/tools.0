Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400C2512EE
	for <tools@linux.kernel.org>; Tue, 25 Mar 2025 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742932933; cv=none; b=PaBOKyySu1P2IMOayNT7QYoNFIRv3KILhDeF+T8hiT+++pxjzNwryNB72Iau9fcnS/Kg0ZRpL2kKf8EKrYIqTa04GlBBAvwGLXrNJsxNAMAaAp3evBSL1mxR3OchBj5SrqyoxMw3MFxxyNWQ11gzuEZw2NZrgFj1ysovFo4+BaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742932933; c=relaxed/simple;
	bh=wh0KnIGpAH1Uo8zhYB8/d29lDKT1jZWmttWdBUMgNNA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sKwFHh1BXruPaF1S7/bfkJ2tB8pPUw1WoQ9bV4mWo/KVmjW1HVhcGE2df4Q57braP/EEQmzVXi8lj7GjB7y5ypVLlz8Z7viWtzBCiqWxpFOr8UtpJ23FN3pLuljlQ4R6I+w+7qpI4IerG7ONrxjJiHvBqNkJ8X1Z/3rHCEjh4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2fl8uwaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2fl8uwaE"
Received: by smtp.kernel.org (Postfix)
	id 9CAA4C4CEE9; Tue, 25 Mar 2025 20:02:12 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00514C4CEE4
	for <tools@kernel.org>; Tue, 25 Mar 2025 20:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00514C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so902193a12.1
        for <tools@kernel.org>; Tue, 25 Mar 2025 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742932928; x=1743537728; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fow+gjYHdmCnopxmzqs7ZgIrDe26DgHRbPTILkzxSvs=;
        b=2fl8uwaEsTjtJth/bFxH7HTikJVcQpY7ssQHvvneC2eI+rvWZev52zPK9AqoMNC3te
         OA0QkTh8fQxK24sRv8mGupj+CgMhUh2Qla7prVPfdxfRjYl+kJFSEJQAJTvQo2O3o9Ar
         UMT3qJgjyyuo2pWt8OadWjtIyuqS6qggGXwncXMq6VE4pAeuG0VsMpL+4nI7rb6qlfgl
         1w2uiq1Heg3/a4CroNwKiXFjXDvMY0VeWUGU5rjULmGQl7jvFRkf378MRz9++IXuk20g
         KbVOaXab5EeDfr1eh2To2ET+fdigmmOvAFGFyN5PSxO5/rhiHvvkg+Cum4Dp4C+gbsV2
         M5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742932928; x=1743537728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fow+gjYHdmCnopxmzqs7ZgIrDe26DgHRbPTILkzxSvs=;
        b=DhA/aRqSDt43ygaPOQ/inNFa9OXwnU7a56/pspojs079PDagpjGMFgLMqgROay/8Uz
         ZJodDbNX8XQ26SvQzaFneylwo7HjQ8B4q1QQip53HTB/mg+cRkBkR4muny/Wnh5wAZiz
         MNuSjbAnKyQCxKYpnYyMslTeaiHrG+cArL+1GbsEkyJmD/I17DJRAECEAICyFrZwZjwo
         KWmZmoh/QVVjGtJ3sOCX4bUihn4ODHb7FeEkPx0PvIFnq4i/gHW0GbeZKXuAw9h16ujZ
         kf6/JBZjQZ3taoAZNb3u+Od5viBEoQ5WVfeh2l7wqIZ3Zz80ZCUWHVRxYCyOKrklD+/q
         +mvw==
X-Gm-Message-State: AOJu0YxWEGT2hYvEdAFs/ImNwcsbt2PZS10N7lITgZvdfRaEdit4ni6J
	E2BMAIDpLQKL7cqR0562854EIdVdZllqWRyh50WeagAr2YFvZk9BzLL3JLWzSmYHrtndb4lJOHJ
	0
X-Gm-Gg: ASbGncv0i0H5yDHdjPa//tLkWqKWng7r0hC9raYQlw0M/LudxdZolbbj9Aq62rOe7bg
	7BJPmKly948KV7tmM0JFB5ak1BB712mJrOUWGrLGKF+48Bi1zoHN+5XbkFEVak/1xFt5OvmjGGc
	JqoEK1NrK+j51Wm0qcEJEC0ToxJ3wvdBsNZGqx3y/N+6nm1bXP3lcLxIgEBFmeb4TfslcUnBQyn
	DNhtnS8aeK6f8Viefq2dT2geJk4HgnyXQrddGYs3Y47Re2oHHV87nx6y0OiUk/RaOAShEkvmIHY
	nwkBMC+VYbqw11m+sQNvu1HfglrKiJMWMeQVTWBisvvU2VEdYyahubwN6xRX
X-Google-Smtp-Source: AGHT+IFvT2n7xHBT5qdDIGohsn4zD1R2n4DvWb2wF0UZeu4q9QWGSwO9Xs7STsyzeYHvEnZQebknvg==
X-Received: by 2002:a05:6402:13cc:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5ebcd468e56mr16162023a12.17.1742932927961;
        Tue, 25 Mar 2025 13:02:07 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ecf76fcbedsm2631606a12.67.2025.03.25.13.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 13:02:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH wotmate] Put a representation of the trust path in the key files
Date: Tue, 25 Mar 2025 21:01:21 +0100
Message-ID: <20250325200120.1601271-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3688; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=wh0KnIGpAH1Uo8zhYB8/d29lDKT1jZWmttWdBUMgNNA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn4wuQ+ULBjQudqMIMeWKFZWViV16GDfGJfhvNc BhcFszN+LyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+MLkAAKCRCPgPtYfRL+ TjzgB/4iULck5OHeeiP55MFv38/BjrK6OVhCGYqlf+7R2yrqOgN211vYzCqh8WRga8Defy7OUsV kBsQEk6SkpJIk/7gnSr8Z5Mne6BdBSlukNnIRYZYKn7oLsVINal3p+QeELOnoP5ussgRIcbW2zj tCe9Ol4xwiEy6mDvEDJuTQN+sKzNsNvkH8yxa3yzRY7GHOwCwzffR9qVZCcUhfRxI0QAHp2P6lH EdyZNGM3fuqjDzWct+8KvlWHmmrfQHC069E4BWYYxObU5PXw3bMBDxX/5TxFOtVxAra0tGb55PV 4HWHOwuysjB/LO4esfwEFUAkN5kOvuweHcFmAXqHtQrt31sV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now changes to the trust paths are hardly reviewable when looking
at the git history because they only have an effect on the generated
.svg. However these also change when the installed graphviz changes and
the diffs are hardly understandable.

For that reason put a text representation of the graph into the key
files.

A nice side effect of this change is that for a trust path

	Linus -> A -> B -> C

the graph for C is regenerated if B's trust path was shortend to

	Linus -> B
---
Hello Konstantin,

after applying this patch to wotmate all graphs in the pgpkeys repo get
updated on the next import. So I suggest to do something like:

	touch empty
	korg-update-pgpkeys empty

before this patch is applied. And then repeat that after patch
application to have the changes not intermixed with the next key update.
It might be a good idea to disable the lint step for this procedure to
be sure that all keys' graphs are updated?

Having said that I experimented with:

	cat keys/* > keyring
	korg-update-pgpkeys keyring

with the intention that the signatures by keys that were removed
recently are dropped. This introduces some changes however that I don't
understand. That might be related to

	https://dev.gnupg.org/T7583

(but I'm on Debian's 2.2.45 that doesn't suffer from the originally
reported problem).

 export-keyring.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/export-keyring.py b/export-keyring.py
index 6cf95f99738d..3e455f941b98 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -104,12 +104,20 @@ if __name__ == '__main__':
         args = ['-a', '--export', '--export-options', cmdargs.key_export_options, kid]
         keydata = wotmate.gpg_run_command(args, with_colons=False)
         keyout = os.path.join(keydir, '%s.asc' % kid)
+
+        key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
+        if not len(key_paths):
+            logger.debug('Skipping %s due to invalid WoT', kid)
+            continue
+
+        key_paths_repr = '\n'.join('\n `-> '.join(wotmate.get_uiddata_by_pubrow(c, rowid) if rowid != to_rowid else "." for rowid in kp) for kp in key_paths).encode('utf-8')
+
         # Do we already have a file in place?
         if os.path.exists(keyout):
             # Load it up and see if it's different
             with open(keyout, 'rb') as fin:
                 old_keyexport = fin.read()
-                if old_keyexport.find(keydata) > 0:
+                if old_keyexport.find(keydata) > 0 and old_keyexport.find(key_paths_repr) > 0:
                     logger.debug('No changes for %s', kid)
                     continue
 
@@ -117,17 +125,12 @@ if __name__ == '__main__':
         args = ['--list-options', 'show-notations', '--list-options',
                 'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
         header = wotmate.gpg_run_command(args, with_colons=False)
-        keyexport = header + b'\n\n' + keydata + b'\n'
+        keyexport = header + b'\n\n' + key_paths_repr + b'\n\n' + keydata + b'\n'
 
         if not wotmate.lint(keydata):
             logger.debug('Skipping %s due to bad linter results', kid)
             continue
 
-        key_paths = wotmate.get_key_paths(c, from_rowid, to_rowid, cmdargs.maxdepth, cmdargs.maxpaths)
-        if not len(key_paths):
-            logger.debug('Skipping %s due to invalid WoT', kid)
-            continue
-
         with open(keyout, 'wb') as fout:
             fout.write(keyexport)
             logger.info('Wrote %s', keyout)
-- 
2.47.1

