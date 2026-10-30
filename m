Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356937;
	b=qAUTQco0Q2Z+UB76zZOr2cjdTvzDBYdyYv/6n2oHCSCqBwq/6RSEUaQfIiUOROsIs9kQ
	 wssb4Zu2HDvA7Cn/vRNoDbEE7/yO3fX3uvV4LMTwuip5QrtYtdHaMxXwZWVBrM6tZDEx+
	 Ohf4wxqduF/876j4uXN+Pd/WHunFDnIx9tBy7Dubp4ZywAYe3AUONnRUnrgIIsV3r4Vuz
	 v3lIdkMjFpxl9Za+QG6hTEixzJtzghYZ8c+FUTN5Dgh1RnAh5aYAI7QvJGHcfSp3Wgyyp
	 A+qjvV3KFWqnjR1qdOV8F15iJ7qYC64MEk9XTmL/balQGpZmwJh9BaL9oxAy9eXgr+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356937;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=PLE4eIIBe581feNGJrz4DrNwBqCGQ0/wkG/nFAQ8ERU=;
	b=DneKZfSCM+h4smyhDsBb7NZn5Rgr8X5G4lH0SBtq7UV2udfPLCuFETrMhTfM4dJvIOO+
	 e2iiGEiv5jCfIboRsh+/+N/j2Mg6a6Nx/LhXlf6yF4imMIX3B7qhOiIETKbRxmFPEI9C9
	 kndIXVeSVY0VSSuSHtcWSAkgSPA/GVKoGkZrFov7bN+XYbjdoq+W4liEkwxWtiZfhCX/+
	 Sh3fwxgsPBKy/GhHbUt/qDHhfGEaik4MJyauTG0ED/LkuVeZ23Vj1D12+1rb1MQvXg094
	 CxfDtrNQcjpkQr5CnjGWKsAh9uB93F21abshT+RtTLpXbZv1jxNKk2Hd8GbroOmJA9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C3Njmjw+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564B606A31D
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C3Njmjw+
Received: by smtp.kernel.org (Postfix)
	id 369C71F000C1; Fri, 30 Oct 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793356936;
	b=rSKfNMVPmzo0fXT5x97XI2nHh8XLygkgRGtO5TyDfhBTnl7qkkDm/MbrIQrdH0VyTQH9
	 J9GMC3bEeguiQdeQbMJdUCgletfynWOcsntZkzWjul2QXTTgGuZ3wilreP5oQCkufahHV
	 DG/ILtFhtJut9JvwMK4HPq0RPsTNQgg0DFsgMjeei37IpPyMEbVBwrD+tptuOTANlEkeb
	 zPaD0lAsU5ks8kcq5L6916WAdlD9g4V3S8zIPPUXXsSlsac/3f+RMuu7Rd1qJDN8L9ONG
	 KBN9+7eRPIGn2rhbWOHfoRHd7SGhKzYYRQQHK40vG65QIeRX7K3S0JgYcCf9XsVNjzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793356936;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=PLE4eIIBe581feNGJrz4DrNwBqCGQ0/wkG/nFAQ8ERU=;
	b=23tuMD813ChfoPqJpsk+SeNYLeNmsjOq3YjUn6i6gbfkdj7/MBCsHGHKNKTVaNyUsm+K
	 hiHyGOJy3rWscFIcfda4ACDYJ6mwxZlU8EsWQzKTnw7lIliKQkR+m5rQu/NEjcbll48nq
	 sb3t1os30+qop6LXG4CGhMPMnnaHC0rIPRhLTZH0wiZ1+pp9NB8vvj7pe0XEoqskz6oJ5
	 StY31U+H/ZrI+u2qVx9gU8dpsU5LRAMsf1LSzO9fdT+ohbzkqtkhMVDMm/Tx1gZJ8gzrc
	 aqVzJ4BJLQ45yVqU2j9or15XkVRD14j70YoMxXOJX7m+kqM9EKh51urxQVb64/d3IQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C3Njmjw+;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59AB11F00A02
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C3Njmjw+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 59AB11F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B061C49F5E
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:43:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87FC6603C2;
	Fri, 30 Oct 2026 10:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CDFA1032909B;
	Fri, 30 Oct 2026 11:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793356933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PLE4eIIBe581feNGJrz4DrNwBqCGQ0/wkG/nFAQ8ERU=;
	b=C3Njmjw+/TxcGhniIhqdGKnBQ15M44ObAtzctI6Ao3aLV7P2jhPfpds/dndqx/2DUHH/FC
	Oik/L/v3Pr+WqAX77Rr+L4ueFxYwmtfdFXTy+HK4eyrbm0cTqv2LBP/je1nwQOkZEjqL0q
	YWRkQuc/ninONAvGE/r4Z5JZadg5wt6evwiBy0QgC8udGhEzzhIjBM4oliO9MXKzRbu+jI
	ybvymQA6qZmnb8namvMvZwZfmZAOIEW+JtfMWscrvHiPzAtHwotado3NFLloS2nAyCVfyh
	ry1MnZ8SeMOqmu8I/gve/usQ5+Y1z4zb9em08IRMzLVxVNhv7vNYfDZDcADa/g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 30 Oct 2026 11:41:59 +0100
Subject: [PATCH b4 2/2] shazam: pass series URL to git am as env variable
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-am-env-vars-v1-2-ddaa12797156@bootlin.com>
References: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
In-Reply-To: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7fZp+QxN7ueqG0Pk6p/gKGI/nL3Zzy99fC3lXwi4cuM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5HR7ifqKk1sIZjI0YT64L2y4KSHx6yREXuOnF
 KKAmkaJO9qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauR0ewAKCRDRgEFAKaOo
 NlyoEACPUpi6c66Vk+nLThZNae/wlsDyBQJ1AwcG01r2hNDBZGfbJejqLPbk4DXR3DLNc0zD1+1
 I4Ogkfu5aKHXSKbCwE+mrQXEzGFstWEYmHwCNUQcBKAQy8xe9m6vrbamPJS2J9U72BXdYuF2ZMw
 qE1R/H6yps9TnZ2qQsezfFvLZug6erWLohefK3wToBmFr5RWmuo/Af843RSZf6O4rMvM/aUHN2w
 +AN1yfcG+R7/tZ/XrJD76/Wxxy1Y/NdB+38f7fHcGWZkwQxrQRVCXP4GS5McH7Rz1fCebSjqU9z
 Uo95f9uwZ01kW9J+suY/Js913skTbZPbujdLUSla4VwYGO62rst99CDn4OcKAyG07FjaeOdloiA
 jcCV72ytrQFJT3s83CgUHKfYVwBClbdkJyr0ZepVOXVUzxQc57W+Xto2ovDu4lXAZ3blsPa9de8
 s3XHq3HL0T3rcbRiPmi6/ZbVTOIRKwM8cJSZ1h7jP+bg2Na4FCns9ymXZCWKBXCZbfTiaL0tXyV
 +qIUCXumCYfyD4RaFZ6v751SE2DS+dv+2+dp7ueUHceKBTaI1CPTq/LDkk/HO5lJJ/AXjqPF83H
 kYoWo9tCYFWyOnO8GIphTfr/F46Q0KID6qguPHzYI/2Z0kAVwNww+deO0TpHjCQT91ev1qi7g9d
 JdznF0k8cNqfsZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

When applying patches when shazam, store the series URL in
the B4_SERIES_LINK environment variable, which is then available to any
git-am hooks.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/maintainer/am-shazam.rst | 32 ++++++++++++++++++++++++++++++++
 src/b4/mbox.py                |  9 ++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index f63cf3b..c4d9ffc 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -370,6 +370,38 @@ of using some other base.
    The default merge base is now the nearest annotated tag, not the
    ``base-commit:`` of the series.
 
+.. _shazam_env_variables:
+
+Environment variables available to git hooks
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When applying patches, some environment variables are available to git hooks:
+
+.. glossary::
+   :sorted:
+
+   :term:`B4_SERIES_URL`
+     The patch/series URL rendered from :term:`b4.linkmask`.
+
+This information can then be used in git hooks. For example, to create a git
+note containing :term:`B4_SERIES_URL` for each applied commits:
+
+.. code-block:: none
+   :caption: Snippet from ``.git/config``
+
+   [hook "b4-post-applypatch"]
+     event = post-applypatch
+     command = ~/.local/bin/b4-post-applypatch
+
+.. code-block:: sh
+   :caption: Content of ``~/.local/bin/b4-post-applypatch``
+
+   #!/usr/bin/env sh
+
+   git notes add HEAD --message "Link: $B4_SERIES_URL"
+
+.. versionadded:: v0.17
+
 .. _shazam_conflict_resolution:
 
 Dealing with patches that don't apply cleanly
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 817d617..5211128 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -425,6 +425,8 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         logger.critical('ERROR: linkmask must contain %s for the message-id')
         sys.exit(1)
 
+    linkurl = linkmask % top_msgid
+
     if cmdargs.subcmd == 'am':
         wantname = cmdargs.wantname
         if cmdargs.maildir or config.get('save-maildirs', 'no') == 'yes':
@@ -464,7 +466,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
         if am_cover and lser.has_cover and not cmdargs.nocover:
             lser.save_cover(am_cover)
 
-        linkurl = linkmask % top_msgid
         if cmdargs.quiltready:
             q_dirname = os.path.join(outdir, f'{slug}.patches')
             save_as_quilt(am_msgs, q_dirname)
@@ -515,7 +516,10 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             sp.whitespace_split = True
             amargs = list(sp) + ['--patch-format=mboxrd']
             ecode, out = b4.git_run_command(
-                topdir, ['am'] + amargs, stdin=ambytes, logstderr=True, rundir=topdir
+                topdir, ['am'] + amargs, stdin=ambytes, logstderr=True, rundir=topdir,
+                extra_env={
+                    'B4_SERIES_URL': linkurl,
+                }
             )
             logger.info(out.strip())
             if ecode == 0:
@@ -523,7 +527,6 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             sys.exit(ecode)
 
         base_commit = get_merge_base(topdir, first_body, lser, cmdargs)
-        linkurl = linkmask % top_msgid
 
         merge_template = DEFAULT_MERGE_TEMPLATE
         if config.get('shazam-merge-template'):

-- 
2.55.0

