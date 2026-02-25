Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D6726B764
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025080; cv=none; b=k02NrMbauoUqxcmhEDqweY6O8laY5WKgYRmJ1hOBkKHIVxFfABQEKN83L++WONfW69L+V7NmJFjEN3jjQRR0hq07CRcgFhWW45iEtwIb/D4Gl9LNTOp0l+XpLSChU7fwpdkxzZQg9pjGtVTg+NaQlh/w0fxro8jzUaHJXTWoRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025080; c=relaxed/simple;
	bh=mV3/3wFcuWz/VmVy9ZM/Y3XbMsV6IjX/SixAuLVgpv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nNVUoQPe9DK+Tpg0zEhNX5PRkAnynUCQieppYXsJR6blagr29zcvMSX8IgnUECRoAtf178Bfa6es88Xt4br38Lky0UaSbR03GmeRqp31PfEksRfVZTREDPqVqXKvUcwagCp4Xe8FzFDMjdtKN2FEF3ymLj7cZltFHjq+fYcenhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=daA5U1LU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="daA5U1LU"
Received: by smtp.kernel.org (Postfix)
	id 69D7AC19421; Wed, 25 Feb 2026 13:11:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A160BC116D0
	for <tools@kernel.org>; Wed, 25 Feb 2026 13:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A160BC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2AE91A1352;
	Wed, 25 Feb 2026 13:11:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 703E75FDE6;
	Wed, 25 Feb 2026 13:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 787D710369285;
	Wed, 25 Feb 2026 14:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772025067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=L62URBeU7Vg7k+NZ5wJL6c+SShHADPlyj7FdHAY1vtg=;
	b=daA5U1LUkXSlB9qEmq0C/3bnSo9h5jyZTyTcsHRBMSxz915O5KE9W/T90nJKV1c0jWAWnL
	3jr35k+2LwJG2hWVShN34xRkvW5mHAntlw02lmdVdsR14r9NrCFwEAYVen0VXvO2R0e3cI
	VhmDdmuoKyry0WdQkvfwv2L87rbbnN32/zh+6n9zahuHCwHImNjUrnrNjnqU/hqQYzrZCI
	bM1LFklUiRWYuRk+xJQ/8uXcNqdV072g6gNcVDRn0yKzVjM1dOHIjyB+A0oxtkHQQAMh0U
	/eyfOJS/y5kn49rP3L5Ng4lIO+T021b/f8u+e0jIN8MwOgoLc1duy3FLh3gPiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 25 Feb 2026 14:11:01 +0100
Subject: [PATCH b4 v2] docs: document --set-presubject and
 b4.send-presubject
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-docs-presubject-v2-1-09f90b52db02@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBREr9L8tZiCpY2uvIfpAuiv/UZLA0g0D
 XeXoluXM/NmZgWPjtDDqVrBYSRPds5C7Cowk5qvyGjIGkQt2poLzgZrPFsc+qe+oQmsVhIPrek
 aLTXkVo5GepXFC+gG+q/3w7epjZrIB+ve5Tbywv59iJxlsxVSie44ciPP2tpwp3lv7AP6lNIHz
 gvYicYAAAA=
X-Change-ID: 20260121-docs-presubject-0a5e36c74b5b
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mV3/3wFcuWz/VmVy9ZM/Y3XbMsV6IjX/SixAuLVgpv8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnvTrH3LS9vj06dl3qZQ9WtDxnrxHCjn1umgZh
 LPOE0OZ2fGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZ706wAKCRDRgEFAKaOo
 NmGbD/wM8pSETEVVt+I/qf3SbCBR/ATn6wg2wPWoRpM23Kb6+82A9tQYml8ztYezTdzp4oOullM
 ZzKstEUAaUYvNbRncCVrDNMUjgoDJnBe2DhrO+L57Qw1/Xwzaxaxr5EzwmeIDHrLZ/SjQ3WX5CA
 uHdIrUmZK/dGkwkOsEFq+HVK/nFmzn9bJnkIjW9FZmHsDI5ZwOtbFbKA4OlAdd7RoVfXjvk+8Vi
 TWHCxX6SWmbw1C/9Q8uhO/+fOHjR2YgpANd9azMnxaZzvqM7XhNOhn/jflWFMTNXykOKK24vUKy
 NmwF6KcUwMXq1UZCfqiY/Qp//gkUZjxk+Yb9L4zBb8XEx6YPbIhs20HYE0n6c8otdQQNsSZRaQk
 u5uxP+tYJrMYn9qblcB7ISvKpLCrB5G09sOZGZUGf48BD/8XGkAHF24obRMOZOt5egGR0ToKFat
 mYK7HegKuYzUFzD1XgHULxyhN8qP7Ky15ZsucbZQEdY2WbkI3qUrAt6m3LRSQ4D0fjPbegvgrt4
 td19Yu7PSv6qPVaD2FZ8DgoN3H3qljpGnP/Kam0lQd5jSCl7JIaaRcu6LuAkN3xVzUlgnlRFGFR
 WXbZpdFdNTvtlxVwaFLGLnNTv+CR2Wn1A8U3+mPtVXm5/DU5ohYcxytDafiUSl1Rs58bD/wOb90
 Gg01kgqnzEwe0NQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Document the b4 prep --set-presubject option and b4.send-presubject
setting, added by commit d7232f5db2e4 ("Add support for setting a
presubject").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rebase on master and fix the conflicts
- Link to v1: https://patch.msgid.link/20260121-docs-presubject-v1-1-d625a279f1c5@bootlin.com
---
 docs/config.rst           | 13 +++++++++++++
 docs/contributor/prep.rst | 23 +++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index d2a80c2..fd4ca3e 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -485,6 +485,19 @@ Contributor-oriented settings
 
      .. versionadded:: v0.11
 
+   :term:`b4.send-presubject`
+     Identifiers to include before ``[PATCH]``. These **must** be enclosed
+     with brackets. For example::
+
+         [b4]
+         send-presubject = "[myproject]"
+
+     This setting can be replaced for a series with ``b4 prep --set-presubject``.
+
+     Default: ``None``
+
+     .. versionadded:: v0.15
+
    :term:`b4.send-same-thread`
      When sending a new version of a series, send it in the same thread as
      the previous version. The config supports the following values:
diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index e6b45c7..1ec119b 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -490,6 +490,29 @@ modifying defaults for some of these flags.
 
   .. versionadded:: v0.13
 
+``--set-presubject [PRESUBJECT]``
+  If you want to include a project name or any other identifier before the
+  subject of your patch, you can define them via this command. These are
+  placed **before** ``[PATCH ...]`` in the subject, and **must** be
+  enclosed with brackets.
+
+  For example, running the following command::
+
+      b4 prep --set-presubject "[myproject]"
+
+  Will render your patch(es) as follows::
+
+      [myproject][PATCH ...] <title>
+
+  These do not collide with prefixes set with ``--set-prefixes`` or
+  ``--add-prefixes`` or patch versions, which are located next to ``PATCH``
+  in the subject.
+
+  To remove any presubject you previously set, you can run ``b4 prep
+  --set-presubject ''``.
+
+  .. versionadded:: v0.15
+
 ``--cleanup [BRANCHNAME]``
   Archive and delete obsolete prep-managed branches and all git objects
   related to them, such as sent tags. Run without parameters to list

---
base-commit: 858baa2b2eeb93ea1b0e1b57adfb77e4a126043e
change-id: 20260121-docs-presubject-0a5e36c74b5b

