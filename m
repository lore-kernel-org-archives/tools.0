Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AE3C06B
	for <tools@linux.kernel.org>; Thu, 30 Nov 2023 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8eSS-0005uc-OP; Thu, 30 Nov 2023 11:39:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8eSS-00Cbrz-BV; Thu, 30 Nov 2023 11:39:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8eSS-00BTVT-2S; Thu, 30 Nov 2023 11:39:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: tools@linux.kernel.org
Cc: kernel@pengutronix.de
Subject: [PATCH b4] mbox: Suggest git am -3 if b4 am -3 was used
Date: Thu, 30 Nov 2023 11:39:26 +0100
Message-ID: <20231130103925.987426-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=H1h1kwTd6nHc2/cCNpvYk955ysa3lXDggG4lWd5kriA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlaGZdoVP4QNUKoNvUIVOH4jQW/ixo4D70eSC5p bQPRrPf/oGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWhmXQAKCRCPgPtYfRL+ TtP4CACIVO52Hh2xF5rFAEPvkYdahDJoeHNvbLRFCx0u/+zbZsOyDqtXXLhvG7ZKLnuW63i026E EJ/4UiRVpADa9acDI1lfq4UyaM+hfeE5mEWjnJws7bzo6Die163JWHLvHUABl3B2jinEHNeoNmW F7hWtAf947+IcLA+RLaBIvORPpx2wsBP0yWD8ZAM3r9V6FFUSi0S14fYKWL7DWnMXcJzY7++CbI 9HGPDFHsaCGYumuZubmP1WSBT3auoxH7EqVqtCOs2bq6GJpozclsI7JJzI77qpi5iYwfDiGKpmi QWep9hjHEq017i6uGCLewbq6gqN9Je5SZu70YLWseWWZgQSS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@linux.kernel.org

Preparing the patches for a 3-way merge is only sensible if they are
applied benefiting from that additional information. So add -3 to the
git am cmdline suggested in the output of b4 am -3.
---
 b4/mbox.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 054bab7bac1d..feba53465e77 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -418,7 +418,7 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
     if base_commit is not None:
         logger.critical('       git checkout -b %s %s', gitbranch, base_commit)
     if cmdargs.outdir != '-':
-        logger.critical('       git am %s', am_filename)
+        logger.critical('       git am %s%s', '-3 ' if cmdargs.threeway else '', am_filename)
     thanks_record_am(lser, cherrypick=cherrypick)
 
 

base-commit: 5c0668ec3daeae4cc8c6425db360e7a80e060201
-- 
2.42.0.586.gbc5204569f7d.dirty

