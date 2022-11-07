Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93ABA55
	for <tools@linux.kernel.org>; Mon,  7 Nov 2022 13:41:04 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id fz10so6852624qtb.3
        for <tools@linux.kernel.org>; Mon, 07 Nov 2022 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ1D98Og0RlzbZGK3Cftr9O29Xv1CoD4y0q0wWlWafw=;
        b=InY4yhvmzvbkg6MuZ8dwclFoYpjBxKD9OcRtwhfiIAXKeBctoK5bTyuz9wo+IXh0Gc
         +Wt7t2A09hL8rzHqRop7f0dhguVsZUJU31gjIe30bpBjdbFXZUkVBWSKLvX8pcK9O07T
         R1KtYy5oriIbhBb5Ebcl75qQOWYUsYtWcldiLi+AB1UcnJjEMQykMZYaXhY8ivpCUWlC
         owQWil5qz68jb9ycXpDmCB9bgK8idWJiEynV88xZsIkDy0xgc7u6LRd4tLaFF1Bv73pE
         /nxwA+ImZ5O6HnIUkKiuUrd4yKxKmItqqFKEjYiEup6fRQqHkjOi5NFq4aJX+PWb0EUl
         q84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ1D98Og0RlzbZGK3Cftr9O29Xv1CoD4y0q0wWlWafw=;
        b=fqFRe+aw5mOMubfYsNnO/RiqUIYphqDegKPXtV2m4wCJbYoLjNfMh8a9oxR0vIFCuk
         clZKih2Z5ghAN9j3z/fRP1J9JRGWSysot3B1BBviGig+BNhzqOzMK9MFt1pDKhQJgY0V
         t3atjI2T8EMQskabZk40+4BIeIlWyTztmCPLozCV6+pOGD4Hwi8zDeYq9te1SpCK4ya2
         nY1lNEM+zb+NBlVJ78Qv/ou0DsNixVpqe6nWccx/QwRQBBw3vZmb6EQB3bi7KyVm+mF7
         UXV/LTjTdt58e8AIA+A7JB3WIByRffonTu32UcNHYnUkYGPn5ka2Qk/OfOQw5AKjXI5o
         C/JQ==
X-Gm-Message-State: ACrzQf0ihwnD72II6G3fS/lgxBOWZuAOAz8C151DK9JYMfbV1qKvyDlE
	lRXOJI3sgRoSp77HK/S+1hjcDArgUYY=
X-Google-Smtp-Source: AMsMyM6yLEfD9KYz9xd5Y+cZyz9KNQnultvZ3ubp55izlndhK62aIHZ4yuxiYZ9yD72hSD9ewWbORw==
X-Received: by 2002:ac8:5714:0:b0:3a5:757d:dc8d with SMTP id 20-20020ac85714000000b003a5757ddc8dmr9725418qtw.402.1667828463183;
        Mon, 07 Nov 2022 05:41:03 -0800 (PST)
Received: from localhost.localdomain (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id ca23-20020a05622a1f1700b00398ed306034sm6069824qtb.81.2022.11.07.05.41.01
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Nov 2022 05:41:02 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: [PATCH b4] Fix 'LoreSeries::make_fake_am_range' with renamed, then modified file
Date: Mon,  7 Nov 2022 08:40:54 -0500
Message-Id: <20221107134054.75514-1-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221031195132.bnezxkjboseihynx@meerkat.local>
References: <20221031195132.bnezxkjboseihynx@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoking 'b4 diff', LoreSeries::make_fake_am_range is used to
create the old and new versions of a series in a temporary worktree.

The code is currently unprepared for a series that renames a file
and then modifies it in a subsequent commit.

The first issue is that LoreMessage::get_indexes fails to set
blob_indexes for a renamed file since the 'diff --git' header for such a
change has different file names for the "old" and "new" file, but that
function skips any diff where "old" and "new" do not match. Fix that by
removing that condition.

The second issue is that LoreSeries::make_fake_am_range itself is
unprepared for a series that renames a file and then modifies it in a
separate commit. This is because when processing each commit to create
the "Initial fake commit", the file is added to the index with its new
name when the commit that modifies it is processed. This causes the 'git
am' invocation to fail at the earlier rename patch, because the new file
name is already in the index (since it was created in the "Initial fake
commit").

Fix this by also recording the new file name in the 'blob_indexes'
tuple, in addition to the old file name and hash, and making use of this
new information in 'make_fake_am_range' by explicitely checking for
rename patches when processing each commit to create the "Initial fake
commit", adjusting the 'seenfiles' list accordingly. Note that we must
also adjust the other user of 'blob_indexes', LoreSeries::populate_indexes.

For consistency, also rename local variables:
- in 'get_indexes', rename 'curfile' to 'oldfile'
- in 'populate_indexes', rename 'fn' (filename) and 'bh' (blob hash) to
  'ofn' and 'obh' (old ")
- in 'make_fake_am_range', rename 'fn' and 'fi' (file index) to 'ofn'
  and 'ofi' (idem)

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---

Here is a patch. I was not sure if I should make the same logic changes in
populate_indexes as I do in make_fake_am_range... I tried to read the code
paths where populate_indexes is used to see if the same situation could occur,
but I was not sure. 

 b4/__init__.py | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 4456414..6c66893 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -640,16 +640,16 @@ def populate_indexes(self):
         for lmsg in self.patches[1:]:
             if lmsg is None or lmsg.blob_indexes is None:
                 continue
-            for fn, bh in lmsg.blob_indexes:
-                if fn in seenfiles:
+            for ofn, obh, nfn in lmsg.blob_indexes:
+                if ofn in seenfiles:
                     # if we have seen this file once already, then it's a repeat patch
                     # it's no longer going to match current hash
                     continue
-                seenfiles.add(fn)
-                if set(bh) == {'0'}:
+                seenfiles.add(ofn)
+                if set(obh) == {'0'}:
                     # New file, will for sure apply clean
                     continue
-                self.indexes.append((fn, bh))
+                self.indexes.append((ofn, obh))
 
     def check_applies_clean(self, gitdir: str, at: Optional[str] = None) -> Tuple[int, list]:
         if self.indexes is None:
@@ -793,29 +793,33 @@ def make_fake_am_range(self, gitdir):
                     logger.critical('ERROR: some patches do not have indexes')
                     logger.critical('       unable to create a fake-am range')
                     return None, None
-                for fn, fi in lmsg.blob_indexes:
-                    if fn in seenfiles:
+                for ofn, ofi, nfn in lmsg.blob_indexes:
+                    if ofn in seenfiles:
                         # We already processed this file, so this blob won't match
                         continue
-                    seenfiles.add(fn)
-                    if set(fi) == {'0'}:
+                    seenfiles.add(ofn)
+                    if set(ofi) == {'0'}:
                         # New file creation, nothing to do here
-                        logger.debug('  New file: %s', fn)
+                        logger.debug('  New file: %s', ofn)
                         continue
+                    if not ofn == nfn:
+                        # renamed file, make sure to not add the new name later on
+                        logger.debug('  Renamed file: %s -> %s', ofn, nfn)
+                        seenfiles.add(nfn)
                     # Try to grab full ref_id of this hash
-                    ecode, out = git_run_command(gitdir, ['rev-parse', fi])
+                    ecode, out = git_run_command(gitdir, ['rev-parse', ofi])
                     if ecode > 0:
-                        logger.critical('  ERROR: Could not find matching blob for %s (%s)', fn, fi)
+                        logger.critical('  ERROR: Could not find matching blob for %s (%s)', ofn, ofi)
                         logger.critical('         If you know on which tree this patchset is based,')
                         logger.critical('         add it as a remote and perform "git remote update"')
                         logger.critical('         in order to fetch the missing objects.')
                         return None, None
-                    logger.debug('  Found matching blob for: %s', fn)
+                    logger.debug('  Found matching blob for: %s', ofn)
                     fullref = out.strip()
-                    gitargs = ['update-index', '--add', '--cacheinfo', f'0644,{fullref},{fn}']
+                    gitargs = ['update-index', '--add', '--cacheinfo', f'0644,{fullref},{ofn}']
                     ecode, out = git_run_command(None, gitargs)
                     if ecode > 0:
-                        logger.critical('  ERROR: Could not run update-index for %s (%s)', fn, fullref)
+                        logger.critical('  ERROR: Could not run update-index for %s (%s)', ofn, fullref)
                         return None, None
                 mbx.add(lmsg.msg.as_string(policy=emlpolicy).encode('utf-8'))
 
@@ -1517,12 +1521,13 @@ def get_indexes(diff: str) -> Set[tuple]:
             if line.find('diff ') != 0 and line.find('index ') != 0:
                 continue
             matches = re.search(r'^diff\s+--git\s+\w/(.*)\s+\w/(.*)$', line)
-            if matches and matches.groups()[0] == matches.groups()[1]:
-                curfile = matches.groups()[0]
+            if matches:
+                oldfile = matches.groups()[0]
+                newfile = matches.groups()[1]
                 continue
             matches = re.search(r'^index\s+([\da-f]+)\.\.[\da-f]+.*$', line)
-            if matches and curfile is not None:
-                indexes.add((curfile, matches.groups()[0]))
+            if matches and oldfile is not None:
+                indexes.add((oldfile, matches.groups()[0], newfile))
         return indexes
 
     @staticmethod

base-commit: cb6764b0d024316eb4a8b3bec5988d842af3b76d
-- 
2.29.2

