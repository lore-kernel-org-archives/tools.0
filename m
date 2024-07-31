Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F01CA94
	for <tools@linux.kernel.org>; Wed, 31 Jul 2024 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439975; cv=none; b=YWks3A88xoP7pfk79puseU9XmxCF5ilRTCLy30z8OcZ5M8OBkE7dIU5HuIfqKjeZO1NrCSSl4/fprjg3KyicJZfnZvE5+WvgfgxCYd6PK327cpTMQra4yxuZrdgBu0IM1bvjb2VN2nahgZAoejQ9P2SiVmb13jF7NvRMHTI84CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439975; c=relaxed/simple;
	bh=3cMtXDOWNBhkF2+D+Ry/LynofzNEn4/J+RhY4aml5KY=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=jdRuwCCWkHtsp/ZvwlNdgMGRVLODnMII6hpRjSgr19iY5DAFTLIRTqaTScQy6kLjLoPcXivo64QjDu62pwqa61SOgQe2d+/Hrrz+KSQdyiWaY55bzNb5XcfAw2en3fcUU4+r07Your/LlBpuHOfzjp3tmC8NuZ+ixWixsB9TtIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 8532D10189B5A;
	Wed, 31 Jul 2024 17:32:44 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 50F4660923DE;
	Wed, 31 Jul 2024 17:32:44 +0200 (CEST)
X-Mailbox-Line: From 70935696913de1e834ede287158a4ab03431b273 Mon Sep 17 00:00:00 2001
Message-ID: <70935696913de1e834ede287158a4ab03431b273.1722439238.git.lukas@wunner.de>
In-Reply-To: <cover.1722439238.git.lukas@wunner.de>
References: <cover.1722439238.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 31 Jul 2024 17:31:38 +0200
Subject: [PATCH ksmap 1/2] users: Clean up key ids and e-mail addresses
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Ben Widawsky <bwidawsk@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linus.walleij@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>

Several user entries contain outdated key ids or broken e-mail addresses
which make the map less useful than it could be:

Ben Widawsky's entry references subkey 8E9B20F4E7641153 instead of
primary key BF674C8889123D29 and his intel.com e-mail address bounces.
Fix it.

H. Peter Anvin's entry references key 58F7ABFE which cannot be found on
the usual keyservers.  It was introduced in 2016 by commit c019616fb7e4
("Port data from the existing map hosted on google").  Assume the key id
is outdated and replace it with the latest one from the kernel keyring.

Linus Walleij's entry references key 746e7b29c50a0166, a 1024 bit DSA
key created in 2005.  The kernel keyring contains a 4096 bit RSA key
instead which was created in 2011.  Assume that the older key has been
abandoned and replace it with the newer one.

Matthieu Baerts' entry similarly references key 3eacee6acfd74ede, a 2048
bit RSA key created 2009, whereas the kernel keyring contains a 4096 bit
RSA key created 2015.  Replace with the newer one.

Luis Chamberlain's entry references key DA364385 which cannot be found on
the usual keyservers.  Assume the key id is outdated and replace it with
the latest one from the kernel keyring.

Maxime Ripard's entry references key 1c7e626cec8f1020, a 4096 bit RSA
key created 2013, whereas the kernel keyring contains an eddsa263 key
created 2018.  Replace with the newer one.

Paolo Abeni's entry references the highest-order bits instead of the
lowest-order bits of his key 835023a82efbc1b74b5f62db2924798dcc8f13a4.
Fix it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthieu Baerts <matttbe@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 users/bwidawsk.yaml | 4 ++--
 users/hpa.yaml      | 2 +-
 users/linusw.yaml   | 2 +-
 users/matttbe.yaml  | 2 +-
 users/mcgrof.yaml   | 2 +-
 users/mripard.yaml  | 2 +-
 users/pabeni.yaml   | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/users/bwidawsk.yaml b/users/bwidawsk.yaml
index d8e0a65..2633c8d 100644
--- a/users/bwidawsk.yaml
+++ b/users/bwidawsk.yaml
@@ -1,5 +1,5 @@
-email: ben.widawsky@intel.com
-key: 8E9B20F4E7641153
+email: bwidawsk@kernel.org
+key: BF674C8889123D29
 locations:
   Portland OR 97209:
     description: ''
diff --git a/users/hpa.yaml b/users/hpa.yaml
index d741f52..ab223e6 100644
--- a/users/hpa.yaml
+++ b/users/hpa.yaml
@@ -1,5 +1,5 @@
 email: hpa@zytor.com
-key: 58F7ABFE
+key: 2DB3C3321B6DDF86
 locations:
   Santa Clara CA 95054:
     description: ''
diff --git a/users/linusw.yaml b/users/linusw.yaml
index c7092e6..be24493 100644
--- a/users/linusw.yaml
+++ b/users/linusw.yaml
@@ -1,5 +1,5 @@
 email: linus.walleij@linaro.org
-key: C50A0166
+key: 4110B337B0195D73
 locations:
   Sweden:
     description: ''
diff --git a/users/matttbe.yaml b/users/matttbe.yaml
index 5ccf4d9..3fb7385 100644
--- a/users/matttbe.yaml
+++ b/users/matttbe.yaml
@@ -1,6 +1,6 @@
 name: 'Matthieu Baerts'
 email: 'matttbe@kernel.org'
-key: 'CFD74EDE'
+key: 'F6B7824F4269A073'
 locations:
   'Namur, Belgium':
     latlong: '50.46071,4.86621'
diff --git a/users/mcgrof.yaml b/users/mcgrof.yaml
index fe06fe7..533f6e8 100644
--- a/users/mcgrof.yaml
+++ b/users/mcgrof.yaml
@@ -1,5 +1,5 @@
 email: mcgrof@do-not-panic.com
-key: DA364385
+key: DC553250F8FE7407
 locations:
   San Francisco, CA, 94108:
     description: ''
diff --git a/users/mripard.yaml b/users/mripard.yaml
index f8dd8ca..9e33b79 100644
--- a/users/mripard.yaml
+++ b/users/mripard.yaml
@@ -1,5 +1,5 @@
 email: maxime.ripard@bootlin.com
-key: EC8F1020
+key: 254BCFC56BF6CE8D
 locations:
   Toulouse, France:
     description: ''
diff --git a/users/pabeni.yaml b/users/pabeni.yaml
index a5290c6..76b78af 100644
--- a/users/pabeni.yaml
+++ b/users/pabeni.yaml
@@ -1,5 +1,5 @@
 email: pabeni@redhat.com
-key: 835023A8
+key: 2924798DCC8F13A4
 locations:
   Montecarlo, Italy:
     description: ''
-- 
2.43.0

