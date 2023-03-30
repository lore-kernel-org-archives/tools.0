Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986DC1C3E
	for <tools@linux.kernel.org>; Thu, 30 Mar 2023 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680174614; x=1711710614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lSQNzDUljqDB5iIR3Ki76cRU5ph8DflvunyFY20Tiao=;
  b=FzEy9RWnlq0XPmIGq2pUkgdYF13E4aIeb1/v+7hmiGhdzaqcO9w/6Uof
   tBQkd4lmpcoZLwNSkgCVmzn2dJebnqTMx2bu6HyqkdE+GvpOfpRhko2ub
   agt9h1oQRiQs4DvRLFmAtACGv4yYfvf/O6mSJpUIXhC+F+X9UwjXzcEZB
   8EvHGv1i8TfLMAjPjN/aB6aln295N76xVBniO9mGMGWzmRyz1+UwVxidh
   wvW8wKfZDCJ/MSyQUTdd5rMjp+z4H5J5OrBHv+Ewvx2OFKMaGR0Z5MGWJ
   6GuYpaTNOXwL9gzYK8hS773CB9UZDysfhvIWqFjRZtWOIyMLfZMofkXmY
   w==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="scan'208";a="207415726"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 04:10:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 04:10:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 04:10:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <tools@linux.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] shazam: warn when overriding base-commit with --merge-base
Date: Thu, 30 Mar 2023 12:09:10 +0100
Message-ID: <20230330110909.355701-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906; i=conor.dooley@microchip.com; h=from:subject; bh=lSQNzDUljqDB5iIR3Ki76cRU5ph8DflvunyFY20Tiao=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmquZf/f3RJyE07amUgtz01/zf7rHdltqK1C3f+trFx0zjP uGFCRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACay+RPD/1BjDSXFIgHzk7sdPktaH9 eSsjkxUSb/04kQj4DmcBm9q4wM0xaymVcZbJb1CFI74Pht732Viz3MQlvmRYSun2x3/hw3BwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If the --merge-base argument is provided, base-commit information that
was provided by the submitter is ignored. This behaviour is intentional,
but warning the user that this has happened (and what the intended base
was) is helpful.

To be able to do this, base-commit can't be set from mergebase until
after parsing the submission and attempting to guess it.

Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This should be a valid test:
b4 shazam -H --merge-base v6.3-rc1 20230330064321.1008373-2-jeeheng.sia@starfivetech.com

I wasn't 100% sure if it should go before or after the base commit
guessing code.
---
 b4/mbox.py | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 7060564..a983092 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -211,24 +211,22 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         logger.critical(' Link: %s', linkurl)
 
     base_commit = None
-    if cmdargs.mergebase:
-        base_commit = cmdargs.mergebase
+
+    matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
+    if matches:
+        base_commit = matches.groups()[0]
     else:
-        matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
+        # Try a more relaxed search
+        matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
         if matches:
             base_commit = matches.groups()[0]
-        else:
-            # Try a more relaxed search
-            matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
-            if matches:
-                base_commit = matches.groups()[0]
 
     if base_commit and topdir:
         # Does it actually exist in this tree?
         if not b4.git_commit_exists(topdir, base_commit):
             logger.info(' Base: base-commit %s not known, ignoring', base_commit)
             base_commit = None
-        else:
+        elif not cmdargs.mergebase:
             logger.info(' Base: using specified base-commit %s', base_commit)
 
     if not base_commit and topdir and cmdargs.guessbase:
@@ -246,6 +244,12 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         except IndexError:
             logger.critical(' Base: failed to guess base')
 
+    if cmdargs.mergebase:
+        if (base_commit):
+            logger.warn(' Base: overriding submitter provided base-commit %s', base_commit)
+        base_commit = cmdargs.mergebase
+        logger.info(' Base: using CLI provided base-commit %s', base_commit)
+
     if cmdargs.subcmd == 'shazam':
         if not topdir:
             logger.critical('Could not figure out where your git dir is, cannot shazam.')
-- 
2.39.2

