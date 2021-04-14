Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825026D13
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 14:29:25 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lWgFx-0003D1-Pv; Wed, 14 Apr 2021 16:12:37 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lWgFx-0006wK-Ex; Wed, 14 Apr 2021 16:12:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: tools@linux.kernel.org
Subject: [PATCH 2/2] list-archive-maker: better handle mails with misencoded real names
Date: Wed, 14 Apr 2021 16:12:35 +0200
Message-Id: <20210414141235.26630-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210414141235.26630-1-u.kleine-koenig@pengutronix.de>
References: <20210414141235.26630-1-u.kleine-koenig@pengutronix.de>
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

Without this change list-archive-maker just dies with an Exception

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 list-archive-maker.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/list-archive-maker.py b/list-archive-maker.py
index b4050198e16a..eed4807dfab8 100755
--- a/list-archive-maker.py
+++ b/list-archive-maker.py
@@ -62,6 +62,13 @@ WANTHDRS = {'return-path',
 
 __VERSION__ = '2.0'
 
+def formataddr(pair):
+    try:
+        return email.utils.formataddr(pair)
+    except UnicodeEncodeError:
+        # This might happen if the realname is encoded in a broken way; just
+        # drop the real name then.
+        return email.utils.formataddr((None, pair[1]))
 
 def process_archives(sources, outdir, msgids, listids, rejectsfile):
     outboxes = {}
@@ -199,14 +206,14 @@ def process_archives(sources, outdir, msgids, listids, rejectsfile):
                         if pair[1] in cc:
                             # already in Cc, so no need to add it to To
                             continue
-                        to.append(email.utils.formataddr(pair))
+                        to.append(formataddr(pair))
 
                 elif lhdrname == 'cc':
                     for pair in email.utils.getaddresses([hdrval]):
                         if pair[1] in to:
                             # already in To, so no need to add it to CCs
                             continue
-                        cc.append(email.utils.formataddr(pair))
+                        cc.append(formataddr(pair))
 
                 else:
                     newhdrs.append((hdrname, hdrval))
-- 
2.29.2

