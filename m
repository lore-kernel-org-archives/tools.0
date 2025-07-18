Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1132BEC24
	for <tools@linux.kernel.org>; Fri, 18 Jul 2025 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752840261; cv=none; b=Ffo3IWCjaVnYs9CZK56/ZvrlycB8aTFvXvS/RauaRd6ZbO1QRbCvEh7Nvbd7pMnmLDU/l3+DGszOmhRV03PpCntQLGmhWBDjeIZ5+VdLkIVyXJxvPePHtAKPAJPCNGimNw4yr5SSA7XV/CEBpyvD1IEwhKV+IXtZMaxDXjpVoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752840261; c=relaxed/simple;
	bh=HfvKEaDgcm+0p1WhgfrhZP7gDf+//5bUJXOKqvgdWtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j4NOvtdtohzqsTRNEiGnKVGmT6Q/U0k2LQkfYbrmzEDZrdoVlo/Z30IgiGaP+x0UzMwkTYby9tXxvM4nFejjVViNkyI2LyzNEYTALBXqjC1ufQBrlxXz/U7yizyQf7NQY4ronj4qbUO+BCok88OLofChbfJAr1XU7LvjTAAXtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C99C3C4CEF4; Fri, 18 Jul 2025 12:04:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 044A6C4CEEB
	for <tools@kernel.org>; Fri, 18 Jul 2025 12:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 044A6C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1ucjp0-00055j-SJ; Fri, 18 Jul 2025 14:04:14 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 18 Jul 2025 14:04:04 +0200
Subject: [PATCH b4] Fix broken fallback to user.email
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-fromaddr-v1-1-8bc274dce855@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIADM4emgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3bSi/NzElJQiXQuDVHPjpCSztBSjFCWg8oKi1LTMCrBR0UpJJkq
 xtbUAKbm9kV4AAAA=
X-Change-ID: 20250718-fromaddr-80e73bb6fd2d
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-16fbf
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=HfvKEaDgcm+0p1WhgfrhZP7gDf+//5bUJXOKqvgdWtw=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYsiosrDjdzsZlVg2fe3n41Uv6/bWKs0Rs/zx6Mf2N5b39
 wfW7OTq6yhlYRDjYJAVU2SJVZNTEDL2v25WaRcLM4eVCWQIAxenAEzE4AnD/wTJrJx1L65Ki+6W
 mG9TnPSdn92BMV5Vr1pu+/EzbluaNjL8zzpxe3LC9zyDh266azqDrM6kfJzYurW/NCxs/cm2uU6
 NrAA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: tools@kernel.org

After conversion to string, fromaddr becomes "None" as a string literal,
so the user.email fallback would never be reached if sendemail.from is
unset, eventually leading to `smtplib.SMTPSenderRefused` (<None>: sender
address must contain a domain').

Convert to string after the check.

Fixes: 742e017c1b ("Cleanup: initial round addressing typing issues reported by mypy")
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 src/b4/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e..c116344 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3949,8 +3949,10 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
 def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
     sconfig = get_sendemail_config()
     # Limited support for smtp settings to begin with, but should cover the vast majority of cases
-    fromaddr = str(sconfig.get('from'))
-    if not fromaddr:
+    fromaddr = sconfig.get('from')
+    if fromaddr:
+        fromaddr = str(fromaddr)
+    else:
         # We fall back to user.email
         usercfg = get_user_config()
         fromaddr = str(usercfg['email'])

---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250718-fromaddr-80e73bb6fd2d

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

