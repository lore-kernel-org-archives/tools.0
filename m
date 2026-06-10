Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184F261B9E
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059976; cv=pass; b=cKl72QG2pcfTtTzczjjgDR2BsiXv86w1Ziy6juQu5qoqWzAkbqbJYVt2kmltZ0i+GOotyO5ALDkj7hqdA9UQKbFwx/lhgUGxRrbu5U+zY/jT8zPmR3DtXEENKcg6X5+Py+v2AO/mOxPApWbaIzcElQSapwMMBZLWzrrqbBdAy0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059976; c=relaxed/simple;
	bh=2NYcr8hkuDfnJzHfgZfgiU1+p+CSI+yTckOZkgy3pt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u3e5Ghj7JZFo2Ugjzz4c6t+wSaW5Em1c2fXdPteGvHTvRWHB+JOy+QPLbgh+rCi2rtnsvNdD+Z7/mnhCZakadCc7VDjIuZOQlzP+GWHF+V4jc9gLVEXDiIQrCHbxM+Ih3ZzDoa/+Aww1ToLy81VzgvXEwXV8fSjuC54Jge+g2eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=C8BB25My; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="C8BB25My"
Received: by smtp.kernel.org (Postfix)
	id 503DC1F00898; Wed, 10 Jun 2026 02:52:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781059975;
	b=p0YfxcOlv2YzgmcSDDAWOoBgrCI3M85HdbNjFe8yNya01OqWDEYnmk8APiAQQUx2uQCV
	 3S14SmYVmdrmf+co/JmaGFMjGPD5Nrzm+g9bpxZTyTzLFXCOJOQhPHDEOknzHqUbxvEms
	 NhozklTY0/4fx78yWT/Pqmq3MTMmqn/CE0cIAeioiEhukGGw3Z9apW96bBCcMq5Ieq0MQ
	 U2WW7z+l7sx7bqKJ/G3pbfSibAiguFPwlRMehIYP6MneRG37vp9eEHAOQBmU1VOpTVXVj
	 gzXGYvW/QiyNrZ5cpWFZjOEfTsIBMmKFYLSfyZqjXouP5KvYuNhh4gmG9Z5lYJlviiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781059975;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=0WP0LFagw61LHZyLfYFbNkQDb/U1pGMRxhooKghbh5k=;
	b=SzmSewTwm2CJ4/DT24ONhkvv/tEkXkHtOenTQHM5MsAma/S5WPvCqmUVKdvCXzG602Yi
	 4/4qFsC7o2g8yBECsHQbErYhdz3fa5oci89y2bDNEvt/156hLN56T20V8Az0Y6rQN1WVa
	 2rGIvwCIxveHm+3vcAp0bkgWh30wxLGDfcZN4v3wLjTkFbhCTRp6UWPxVkabg7R6e/q7J
	 oiEqAKzF1ZepO7qR2NTsX6FL0v4c2CVNp9kATzgC3uRxVTHuq4fZ2tHKqMNnW2QcWiPgW
	 YclSUt/t02xndwyOvbTBuPNcIG8mSrHtyVW4Qb3sYCz/KgZ7CpWs9h0jqb5I8jIFZTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C8BB25My;
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 823291F00893
	for <tools@kernel.org>; Wed, 10 Jun 2026 02:52:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C8BB25My
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 823291F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781059972;
	bh=0WP0LFagw61LHZyLfYFbNkQDb/U1pGMRxhooKghbh5k=;
	h=From:Date:Subject:To:Cc;
	b=C8BB25Myk6jlZOF92e2UCPLoJ5BxLYwbSrFN0dbA980gYJm5grUzitQIcO1N2xN1Y
	 Lwwn//Wo3li0D3RLoqkB/Lc4/1Cy4/QcidKXYS7OGWuGzYEMqRIrAHGPxMrL/hEaCW
	 PkPzyo8/tw0xquUZfculw3w/nj/vLxhLM9BYS7CNuCWjusNtWSzmoz2zV1qhfjQaTf
	 mZcEdLTTaHFquEq2B6z6jFvqfvWA/Xyrhj4GsKWxJSzdqWpQ+PKYmPQHneM9s4kwLd
	 +/pRju3wnnXE75gZEnznxRXD5PHeR0KCpStV6rplxsCvGlLuMISvAWw/BUlLkOsBwD
	 O7LAzXoAOFBOQ==
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 9BE4C60A17; Wed, 10 Jun 2026 10:52:52 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Wed, 10 Jun 2026 10:52:44 +0800
Subject: [PATCH b4 v2] config: add send-me-too configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-master-v2-1-9913cfb7bb3e@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAHvRKGoC/22NQQ6CMBREr0L+2hIoUMCV9zAs2t9fqQnUtIVoC
 HcXcGdYzuTNmwUCeUsBrskCnmYbrBu3wC8JYC/HBzGrtww84yIrecsGGSJ51pQClZKkeVbBBr8
 8Gfs+RHdQJXS/LkzqSRh3w071NkTnP8fbnB/sv3jOWc6w0AILwXlt6hs6TejGEP2EMUU3pHLaZ
 adLU2UV142qTavOl926rl/THeT59wAAAA==
X-Change-ID: 20260429-master-846cbbaed205
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev

My mail transport automatically saves a copy of outgoing patches, so I'm
always using the `--no-me-too` argument to `b4 send`.

Instead of having to specify this every time, add a configuration option
to control the send-to-myself setting. In order to avoid
double-negatives in configuration (ie., `send-not-me-too = no`), use an
affirmative version, `send-me-too`, which defaults to `yes` (the current
behaviour).

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
Changes in v2:
- address feedback from Konstantin:
  - fix markup for fixed-width formatting (` -> ``)
  - reflow rst to 72 cols
  - explicitly str() our config.get() result, and provide a default.
- Link to v1: https://patch.msgid.link/20260429-master-v1-1-f5052d8b7f9b@codeconstruct.com.au
---
 docs/config.rst           | 6 ++++++
 docs/contributor/send.rst | 4 +++-
 src/b4/__init__.py        | 2 ++
 src/b4/ez.py              | 3 ++-
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 2490f54..7251786 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -725,6 +725,12 @@ Contributor-oriented settings
 
      Default: ``no``
 
+   :term:`b4.send-me-too`
+     Instructs b4 to include your own address when sending. Set by default,
+     use ``no`` to suppress sending to yourself.
+
+     Default: ``yes``
+
    :term:`b4.send-prefixes`
      Extra prefixes to add to ``[PATCH]`` (e.g. ``RFC mydrv``).
 
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index ba18ef5..da8d701 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -321,7 +321,9 @@ Command line flags
   :ref:`contributor_settings`).
 
 ``--not-me-too``
-  Removes your own email address from the recipients.
+  Removes your own email address from the recipients. This can be set in
+  the configuration using the :term:`b4.send-me-too`, setting to ``no``.
+  (see :ref:`contributor_settings`).
 
 ``--no-sign``
   Don't sign your patches with your configured attestation mechanism.
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 0530fec..fae5de6 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -177,6 +177,8 @@ DEFAULT_CONFIG: ConfigDictT = {
     'review-target-branch': None,
     # Do not patatt-sign outgoing review emails
     'review-no-patatt-sign': None,
+    # Send to myself
+    'send-me-too': 'yes',
 }
 
 # This is where we store actual config
diff --git a/src/b4/ez.py b/src/b4/ez.py
index d1e2fba..06104b6 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2253,7 +2253,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 ccdests.append(btr.addr)
 
         excludes = b4.get_excluded_addrs()
-        if cmdargs.not_me_too:
+        conf_me_too = str(config.get('send-me-too', 'yes')).lower()
+        if cmdargs.not_me_too or conf_me_too in {'no', 'n', 'false'}:
             excludes.add(myemail)
 
     tos = set()

---
base-commit: 747e1e89d289188fc5f5815f144a3a66f7ffa362
change-id: 20260429-master-846cbbaed205

Best regards,
--  
Jeremy Kerr <jk@codeconstruct.com.au>

