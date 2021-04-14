Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1C6D13
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 14:29:29 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lWgFx-0003D0-Pv; Wed, 14 Apr 2021 16:12:37 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lWgFx-0006wI-EZ; Wed, 14 Apr 2021 16:12:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: tools@linux.kernel.org
Subject: [PATCH 1/2] list-archive-maker: collect recipents in lists instead of strings
Date: Wed, 14 Apr 2021 16:12:34 +0200
Message-Id: <20210414141235.26630-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org

This is more pythonic and should also be quicker to execute.

Note there is an (intended) side effect of this change. If cc already
contains "twentyone@example.com" and pair[1] is "one@example.com", the
latter was detected as already contained in cc.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 list-archive-maker.py | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/list-archive-maker.py b/list-archive-maker.py
index 7e1d276bdf62..b4050198e16a 100755
--- a/list-archive-maker.py
+++ b/list-archive-maker.py
@@ -139,8 +139,8 @@ def process_archives(sources, outdir, msgids, listids, rejectsfile):
             # Remove headers not in WANTHDRS list and any Received:
             # lines that do not mention the list email address
             newhdrs = []
-            to = ''
-            cc = ''
+            to = []
+            cc = []
             recvtime = None
             is_our_list = False
             for hdrname, hdrval in list(msg._headers): # noqa
@@ -196,32 +196,26 @@ def process_archives(sources, outdir, msgids, listids, rejectsfile):
 
                 elif lhdrname == 'to':
                     for pair in email.utils.getaddresses([hdrval]):
-                        if cc.find(pair[1]) >= 0:
+                        if pair[1] in cc:
                             # already in Cc, so no need to add it to To
                             continue
-                        if len(to) and to.find(pair[1]) < 0:
-                            to += ', %s' % email.utils.formataddr(pair)
-                        else:
-                            to += email.utils.formataddr(pair)
+                        to.append(email.utils.formataddr(pair))
 
                 elif lhdrname == 'cc':
                     for pair in email.utils.getaddresses([hdrval]):
-                        if to.find(pair[1]) >= 0:
+                        if pair[1] in to:
                             # already in To, so no need to add it to CCs
                             continue
-                        if len(cc) and cc.find(pair[1]) < 0:
-                            cc += ', %s' % email.utils.formataddr(pair)
-                        else:
-                            cc += email.utils.formataddr(pair)
+                        cc.append(email.utils.formataddr(pair))
 
                 else:
                     newhdrs.append((hdrname, hdrval))
 
             if len(to):
-                newhdrs.append(('To', to))
+                newhdrs.append(('To', ', '.join(to)))
 
             if len(cc):
-                newhdrs.append(('Cc', cc))
+                newhdrs.append(('Cc', ', '.join(cc)))
 
             if not is_our_list:
                 # Sometimes a message is cc'd to multiple mailing lists and the

base-commit: 45172ee760eb6210d9c153b6fe92888c79b662b0
-- 
2.29.2

