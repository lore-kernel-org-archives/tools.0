Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC971C36
	for <tools@linux.kernel.org>; Wed, 26 Oct 2022 18:12:09 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id o2so11210595qkk.10
        for <tools@linux.kernel.org>; Wed, 26 Oct 2022 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0LPpvX2+N4mBGCLI9yoVf0LoH2S8SU7O56Mxxmadjs=;
        b=m/+kbEBhNGqpVRicWKsZCkQTXPWRyHTbOoDNqJa/6sjclqWBRURWmsV8517/+Gr3VY
         4olMqeXAbyauHKdSQCvZ96CJc30+226ZnGP+SQWw0JCeWtvovP9BcGRAreLaEmc4hFoq
         gZncA6eV0WDCez7OPPr48W5MAqitcCQ2zmU2m9Nld5Hdi8kgaGTi1sq+NtiJARAkwsHq
         NA7cx+1PcJTN8pR2cEdZbR2uT6PeQtUUkcrydeHcKgZisM0vrAcE8+TBZF4NhjU/yPhW
         mwkvq4O0rfM+6jvP0SOBEgLVABLZMe+yNP3Sxmu+E4WHZ/ASQ6bBNPnsdwvCCF3IC1Ju
         EwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0LPpvX2+N4mBGCLI9yoVf0LoH2S8SU7O56Mxxmadjs=;
        b=P5x1lM2wQgG2aI3XjpCyNNsXJW67A/3ozeppfOcTT63hMmtWlbiVW+ToCVw4P1kgL7
         xik4WuIKqA+xNUC4PhULnZz6ZI87QlZGLYb3v8YlgwOPPhwQA3f/6dVTUSMllxoLShEI
         3k7dYvR2bAB0uxoQpWhvnrTHHVAr3FTPKAXq45Ssb0lCt8R741/TcArEtka5vqunydSi
         LFn53/Nr6FRVnNgs8iiaRhUOkkRrJGE8Y7rYF4Ig3DLMmU110C+MxvkyF9Lhrm2h06VH
         h0df7dsBpsCyGVuz31vpJ80/jOS5EEz0AAEg6bsyafrtaCxaP/RDnBc47SaGVu1Xun2k
         BS/g==
X-Gm-Message-State: ACrzQf2oXTDCZxMvGqBmld/qljjZnZ2DRbEI83UKa3e/7znVQ9giZAFE
	khGd13RfCtXs9Nwz5W0jSZU=
X-Google-Smtp-Source: AMsMyM4ydSdOiM/N4hqjLgDFxKxn205eZcA41mUiqFDeQ2BppL2B4mG1shWoTA2x8E24FVlEQaoItQ==
X-Received: by 2002:a05:620a:13f3:b0:6ee:92b9:fe2f with SMTP id h19-20020a05620a13f300b006ee92b9fe2fmr31286653qkl.477.1666807928023;
        Wed, 26 Oct 2022 11:12:08 -0700 (PDT)
Received: from localhost.localdomain (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id m17-20020a05622a055100b003994bbe91bdsm3575569qtx.60.2022.10.26.11.12.07
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2022 11:12:07 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: levraiphilippeblain@gmail.com
Cc: konstantin@linuxfoundation.org,
	tools@linux.kernel.org
Subject: [RFC PATCH] Fix 'LoreSeries::make_fake_am_range' with renamed, then modified file
Date: Wed, 26 Oct 2022 14:11:59 -0400
Message-Id: <20221026181159.49623-1-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e759026c-4f49-cc2a-7885-10b88212d20e@gmail.com>
References: <e759026c-4f49-cc2a-7885-10b88212d20e@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---

This seems to fix it, I can send a proper patch with full commit message if you
think the design/direction is good.

Sorry for the resend, forgot the list!

 b4/__init__.py | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 4456414..d9cebc9 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -640,16 +640,16 @@ class LoreSeries:
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
@@ -793,29 +793,33 @@ class LoreSeries:
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
+                       # renamed file, make sure to not add the new name later on
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
 
@@ -1517,12 +1521,13 @@ class LoreMessage:
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

base-commit: 2a16f701dfae031ed89b58505bbf50846b13518d
-- 
2.29.2

