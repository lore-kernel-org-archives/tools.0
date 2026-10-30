Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356936;
	b=v/GnSN6jbwXUbAhMlSsFYu2UwCy0aYKYko5y+X/I7aiW2DZop/yVmxGtLxegdRaY5a4M
	 rvtifXjD60bFYsKLfnerHMfSIKODdaTLfn+0Iiaq4VHZ3NGd/39Rf+2HXQvkDwKtdgdKN
	 Ssd0jKxgKDH+R8tluXQVCuL7H9M5p4+KWXifh1mjM0czntXyKBz4CIOu7mcReg07ml10j
	 BQqaD5uoQwrfpmdATHj0U3Vd6NCznmBgn9/JXu8LZlwdGEHRUi5BMkWiB0DRUMlgYkS0w
	 KGxp+lNqzUxCXtgRGAHnx06xYQZXh4mfmVpOounvvVLOQ2oWSrmxa9Dy63aBi1rEBhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356936;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:Received:
	 Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=Pt0XoUdjnTP3W1a3f6R9wdrMh+wTW5akxI/YILXxUw0=;
	b=b2tyxOHk/6/v4ArtBKYbKwL1AyKE/RNbjkMHWP7dRm3Xjr0wGLMtIlp40+cRYwrquyrg
	 sp/sDAbG4+J3GmFlySo0ui6lfrY4U6NaS/Y5g75SeOh9DZFBIQL8xbf6f1q/fNy4DHLQM
	 1ExS4y2D6l42F9AM5+p/UvdrCju4WxDfH0GMx2M6sATUQBoq97167fX5pXZJ9sfEn2wNg
	 WwgWpSPPCWMYS3upmezT6mo3p1iP1mAzuoxtNnpJxKmH/dZq0qlcOS+jiWbe9JKs2gwCw
	 w4la32RcGXTihwowc1e/y1fysEYPlf9mg+GtKxbYww2wjIQdnI31DJ7qOO8GhrYTo5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="l/sEKGYv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9723606A31C
	for <tools@linux.kernel.org>; Fri, 30 Oct 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l/sEKGYv
Received: by smtp.kernel.org (Postfix)
	id 9456A1F00A15; Fri, 30 Oct 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793356935;
	b=lQ4vgLASRJGcYbLypl62TKIGFRn8S+fYysy1drmyNIvcstj+uBXyTJASEg5onK+GLQU1
	 iB7WHoGv8T5nfgEC9COJfuQor4hmCL/BVihA8Yx1Hdi+HRoAgcTPOff4svFDxVOnuzqFu
	 tH+dF75zBiEwWgcJUK9qrtLHTZeq6Dda8UBn6SEUnWXlzdi26On5321ertThsd67DsuQ/
	 4Bzmxlut0yS4iSacx0ESEdVJ5P7vNSLz6SqNQEoP2UBXt9i6uPneSvJi8cX9ecdLmV1Da
	 mVhJgesGnj6AvMQ6bMhuXJxV8cIrl2xzDGe2Vsdlj+saguZAkSilssqSatVzRW1JS3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793356935;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=Pt0XoUdjnTP3W1a3f6R9wdrMh+wTW5akxI/YILXxUw0=;
	b=XExIFx/hMFXn2KuJI/DGI5+HQum1mFkICtpJD3gurGo2vSGJRtz187POlBGPMOvgm3fE
	 YNEZ8x3Zk+nKafCQ/v6Vlv8B5cyrzdkZ8DDcidX4bUC4GIYC2c22jPtCedOT1SehA3jfX
	 /AHTo/XA7Cb4npo1Jvr4hK+yXC7RrmhMS+on2SL8veFtXGK9vWBAuWSqHODgW0VFJywNr
	 9uWXDa8SgHZ1Wn7c7yAEMmTetUCtkm8iUGQokn1iOwHogrt6ujEw4gEwRMgSTqLY4U+z2
	 SklLVzVS2LPE03b9+op6anrvbEmZ48ibQvvwu2oQwXlSP8pMZMcsjKJW7M6IqvATJvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="l/sEKGYv";
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AF091F0093A
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l/sEKGYv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9AF091F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD2DA1A13C0
	for <tools@kernel.org>; Fri, 30 Oct 2026 10:42:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF175603C2;
	Fri, 30 Oct 2026 10:42:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB24F10328D09;
	Fri, 30 Oct 2026 11:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793356932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pt0XoUdjnTP3W1a3f6R9wdrMh+wTW5akxI/YILXxUw0=;
	b=l/sEKGYvmignvzcuIrgRcbXsa3GQG83WcjRFpQ08rmxx5A6lSQVp2QrKitDHERe8H2iw8R
	nZzBohJdkxuTFnOtOoXv/m7AONtgV488ApFGGTtfd3E82LVX108JhjPk2AAw4Y3jPWuldU
	eZ6a03RSWsVLS8v7MT5cyrK1LwJeCq7UvzO+zpIYa0H3SY9ABc7YFWeXQxjxo+lEXn4zRW
	OsTZJ3Gpanun2ND5y5KfP3BHyt0FFwX/qx7sPwOBK9nZKxrbde2PqfAosIltGEY9u7m9sE
	iR46jQVZyTmTDMS2EroGF6kacUWkDtTf9RFwh0zleJqr2mqSQX3Jjy+G3OA1Qw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 30 Oct 2026 11:41:58 +0100
Subject: [PATCH b4 1/2] b4: support passing extra env variables to git
 commands
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
Message-Id: <20261030-am-env-vars-v1-1-ddaa12797156@bootlin.com>
References: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
In-Reply-To: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PBf+/mIHvvV98m9tI/drQaAlclxiukQwi0yG88cfCYM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5HR7BVX3Yviu1yCUPzpzeIYlkACiwqhanTVNc
 ntEf/b6XJmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauR0ewAKCRDRgEFAKaOo
 NqHsEACULnl+9t0k6sA+26ENwJ2Usu1r0VOX7NATquK2o5WTq+oaMann1DHUqonbNe844U1Fbv2
 /k0tghgieuHHhzG9FmGcdj0EtRcviXlD61GPVxuD4qd3ZRR9DMsUQaXkXmRTfSdKoCN56ZOTZhw
 iQY8Gch5+SwpyIN6v6vo3iy/BgXsZnioEo0V49gQ4WmS8/WicSnM4cjvx58jwocrUyBRtt1RXCX
 jEDGMMZ6IeJNAxbdcOk9v9gVdix6R34rQVU4CGtpKtYd7IK+y+8bVAFWiS8EDl3MSbKOChO4gU1
 w3081YFZid84wzAW4wg38tIEsIUfcmofqiRphWlDnj3SyXxJneKCoupKP5LzqJUC8ScidX4vRmi
 WejWMf6hdHzCkh37MIxjqF45Srhpwhy53vvyzSrgpHRf/3nr++TqMWE5hdhSW6kFal1fb/Ui5a2
 71z67phEuSitQx7jawkARLQQuOn+nAuCfU3rapm1FLMQVNbt/FCBR3CShkLIUstyzlYR1eHoNZw
 gx1GXpOQjPeQMjo/IR4CWkyborWXu1pfumuk92P5Q499ltkWtGk93LLBQhdtYlw495wLOeO1a3u
 3iyB9yKfxlgqbIVHiaechfCgp6UJGpFwflD67E3L/znc8/GM88IVbeOyMXInl5mYAmosLEwdkv+
 AUB9yFxl0X1bmyQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

In preparation for the next commit, add support for passing extra
environment variables to Git commands. Add an optional extra_env
dictionary argument which updates the one from os.environ and pass it to
the subprocess call.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 src/b4/__init__.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec..277d303 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4306,11 +4306,16 @@ class LoreAttestorPatatt(LoreAttestor):
 
 
 def _run_command(
-    cmdargs: List[str], stdin: Optional[bytes] = None, rundir: Optional[str] = None
+    cmdargs: List[str], stdin: Optional[bytes] = None, rundir: Optional[str] = None,
+    extra_env: Optional[Dict[str, str]] = None
 ) -> Tuple[int, bytes, bytes]:
     if rundir:
         logger.debug('Running in %s', rundir)
 
+    env = os.environ
+    if extra_env:
+        env.update(extra_env)
+
     logger.debug('Running %s', ' '.join(cmdargs))
     # Pass cwd to the child process rather than os.chdir()-ing the whole
     # process. Process cwd is global state; mutating it is not thread-safe and
@@ -4322,6 +4327,7 @@ def _run_command(
         stdin=subprocess.PIPE,
         stderr=subprocess.PIPE,
         cwd=rundir,
+        env=env,
     )
     (output, error) = sp.communicate(input=stdin)
 
@@ -4353,6 +4359,7 @@ def git_run_command(
     logstderr: bool = ...,
     decode: Literal[False],
     rundir: Optional[str] = ...,
+    extra_env: Optional[Dict[str, str]] = None,
 ) -> Tuple[int, bytes]: ...
 
 
@@ -4365,6 +4372,7 @@ def git_run_command(
     logstderr: bool = ...,
     decode: Literal[True] = ...,
     rundir: Optional[str] = ...,
+    extra_env: Optional[Dict[str, str]] = None,
 ) -> Tuple[int, str]: ...
 
 
@@ -4376,6 +4384,7 @@ def git_run_command(
     logstderr: bool = False,
     decode: bool = True,
     rundir: Optional[str] = None,
+    extra_env: Optional[Dict[str, str]] = None,
 ) -> Tuple[int, Union[str, bytes]]:
     cmdargs = ['git', '--no-pager']
     if gitdir:
@@ -4401,7 +4410,7 @@ def git_run_command(
 
     cmdargs += args
 
-    ecode, out, err = _run_command(cmdargs, stdin=stdin, rundir=rundir)
+    ecode, out, err = _run_command(cmdargs, stdin=stdin, rundir=rundir, extra_env=extra_env)
 
     U = TypeVar('U', str, bytes)
 

-- 
2.55.0

