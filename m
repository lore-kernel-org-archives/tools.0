Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD8393DE8
	for <tools@linux.kernel.org>; Wed, 29 Apr 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445413; cv=none; b=Lg853Tf9p+KbtjhC3sGxLn5/Fdjh0xVIdVJOIyQaluOmIITg3fUCa5mzUXaYoN74J8VPe7VQ5TEdxvsxbomvI8wbZ7t+7SRx1mYteGhlZH7vyBsDZ9BoCEJzBuu4wClPSUi5z9TNhMy7oCu+METP4pJE/w99TBW796DRQfb6gfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445413; c=relaxed/simple;
	bh=ce5rVLxN8d0JCUiRnoJhKh7C8/M7nznj6QUdMVpOUhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g6/Jk2AQmmdkDDXrlhTAMGMtLn0Qs4AVpvmwJrZRYzRhqkl3+Wn49ngmnL5l2lSZcbmAG5Nskb9DBTVKO67KNU613/EYPq/CO04fJ5jCTAkzNBsM10Rx+6NvnBnkGO/15P5t/SGSsSdtvhy//RcyeDNy8i+1AmDIlHegYUJITZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Fm8/vuy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Fm8/vuy+"
Received: by smtp.kernel.org (Postfix)
	id 26D0EC2BCC4; Wed, 29 Apr 2026 06:50:13 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA87CC19425
	for <tools@kernel.org>; Wed, 29 Apr 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA87CC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1777445408;
	bh=jHW8TBYa/2A5N7ugo5gnzoWm2f1xlGEHP6rOncHd5sY=;
	h=From:Date:Subject:To:Cc;
	b=Fm8/vuy+TG2mJ7LnhyRFpyuBiqDXdg1l6qVGX79mwGEXjFIJzMUqcuTlDZou5OULX
	 TyS0/8j6CmJ6sSRfC/bD4plnuzSBPBA4jQNI8jxOlK+tyyBAYUf1fVAv8leCuASrgU
	 vwM6Aaz+Lcwl9RBmrzzxBO2AlMejl6iTjcc3roXNCDz3MwrCdejkf7uiwB6+aJf5eF
	 Mv9h8ats+9Fmney69ZVw3txNUbigK/Htxk9H8PcCqBIO17gc+1VtlQDE+eVHp3PWJh
	 XE0+kvL+txFhtKg6JyGpoxPaj/Xt2bcYVzof8HGbgF+K64fy00xzA3/gUwlXqMVHbW
	 HuO0yQhrB9DCg==
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 2070C60263; Wed, 29 Apr 2026 14:50:08 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Wed, 29 Apr 2026 14:49:46 +0800
Subject: [PATCH b4] config: add send-me-too configuration
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-master-v1-1-f5052d8b7f9b@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAAmq8WkC/12NQQ6CMBBFr0JmbQktWNSV9zAs2ukgNYGSTiEaw
 t0F3Ll8Py/vL8AUPTHcsgUizZ59GDaQpwywM8OThHcbgyqULip1Fb3hRFFcKo3WGnKqOMMmj5F
 a/z5CD7AVNL+NJ/siTHthtzrPKcTP8TbLw/0Pz1JIgaXTWGql6ra+Y3CEYeAUJ0w5hj43EzTru
 n4Bf80TgL0AAAA=
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
index ba18ef5..5769cd7 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -321,7 +321,9 @@ Command line flags
   :ref:`contributor_settings`).
 
 ``--not-me-too``
-  Removes your own email address from the recipients.
+  Removes your own email address from the recipients. This can be set in the
+  configuration using the :term:`b4.send-me-too`, setting to `no`. (see
+  :ref:`contributor_settings`).
 
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
index 3e81138..39168e6 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2252,7 +2252,8 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 ccdests.append(btr.addr)
 
         excludes = b4.get_excluded_addrs()
-        if cmdargs.not_me_too:
+        conf_me_too = config.get('send-me-too').lower()
+        if cmdargs.not_me_too or conf_me_too in {'no', 'n', 'false'}:
             excludes.add(myemail)
 
     tos = set()

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260429-master-846cbbaed205

Best regards,
--  
Jeremy Kerr <jk@codeconstruct.com.au>

