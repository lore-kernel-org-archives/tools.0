Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983FA52F71
	for <tools@linux.kernel.org>; Tue, 10 Sep 2024 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954774; cv=none; b=HYn2yJh/YWgpA6kvGtKtGLrvHEO9Z4wID1S+dLcI7w4ZUExlJ/rSwela8QQpjOyiVQfOudEdfcKRQi7M+bqhsCKS2JWGQ9zF/1i+/a0Ys6J6Q/9f7R1EEnq94hxTQoqlyGopnHYVGSqoDZApK8yFSPCf3NEFR4rEdnZUCG7NGAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954774; c=relaxed/simple;
	bh=v9Wdy41q+N26Eb4VT0o9af7TrGtCttAWQq/MUk2Udrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G2OSRq0cSi8VmBkIhKM6diM5AFzAi0ztaPLLdqpELKgua36qp3cSPLYQauTJjmaXV+pnexyAmCzMVMpEWBKiru3xURwgMf8t0HMO+5JhLML2RyMn7TmJlpiY90miieAKT4Anu2RglOO5iaJS4LU+oCDpuxtofpMEJyHIx7alfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U4oVDKMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U4oVDKMw"
Received: by smtp.kernel.org (Postfix)
	id 30ADDC4CECA; Tue, 10 Sep 2024 07:52:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95CFBC4CEC6
	for <tools@kernel.org>; Tue, 10 Sep 2024 07:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95CFBC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A92132000C;
	Tue, 10 Sep 2024 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725954770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5FIbIaCc7i7/IrWTRcWr/yA+LsU3kpYkZB5GCPkEajA=;
	b=U4oVDKMwIplvwDFDkKiOa5b4LRrBbb0oylpgJ527uyF28KYlePNUHsku9JrBEkcywDyaGJ
	CBgeOJKOIL9tJdurkocZmCSJfykcykhswbBP+bIOVklfNwwocLCQlroClpySjWTblQ48xi
	mUbbOMHSgDocNIidOoATKFIG+gcICtwGowsUn2Ui34rbSg3jQqoT54Vhv6B3Wt6SAJ52Ew
	FDkB/X6I+YZ5wDwLmLILiSW3LOsHixAuHhl6dGjJBxnK36hyq0FCF9nBuPhPx4+ZNiqR6x
	hFwrX89LymboU8bC2PFIX/uwMsVk3dXPvOKW+wG2tugeEnby1FvxSoV/Xv89zg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 10 Sep 2024 09:52:46 +0200
Subject: [PATCH b4] send: Add mail header to identify reflect messages
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-reflect-header-v1-1-99d3b6eb0bcc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAM3632YC/x2MQQqAIBQFrxJ/naAlUl0lWpi+8kNYaEQQ3T1pO
 QwzD2UkRqaheijh4sx7LKDqilywcYVgX5ga2WjZKykSlg3uFAHWIwkD03rfS2dsRyU6iuf7H44
 0a5re9wNkQ0eJZAAAAA==
X-Change-ID: 20240910-reflect-header-6e63dd90c6a8
To: "Kernel.org Tools" <tools@kernel.org>
Cc: thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=v9Wdy41q+N26Eb4VT0o9af7TrGtCttAWQq/MUk2Udrg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm3/rSMkrSJsdmRh5KFnO0IkcmWUBhJYXgWUX/h
 pr0ugqGMyuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZt/60gAKCRAgrS7GWxAs
 4ncPD/417uCz45TVf+swRXh8Tcv8QsZluYoa104St5TL5zFGdPIcmy2RUz4rBqQfYa+mmENn0Hb
 BljHh8wuKSxtYGOKb7UHrS4uMNhz7ZWR8efdN04zLedaFD0wQLszC8WP2aox9SlPAZ0ne07anlP
 qvWUCwYM967ha/19rfRqSmkk00aa8p4WzcRG04rNq4vbF5tPONHRraquQSXrlloi40wFyjzfiZb
 PJp+oTWl/Jzx4oE+yhOzvCUPtKz1IInl5CN8aHEm0mN7QR1UR1B9Rub6TIwPsrKka9IT4SNoAOv
 7n4ySzLAZQ38zWD+aDmRXO8O0zxQc1qBagWz5sL/9ZL2gNMqT0NT4JAKMBJVx4gHussByPnuY2Z
 DCIeU6u1GhgjPfjCra1mxwD3EcUKWUOYs1Obh0s/NxfxZQyIiBdYUNTP+BQo6b6LhxYFPW1sLo6
 5ALE2UuH3XrwYPJU0uh8cIeBDzvFwxDRx3pGqfO0W+EBCuFVQEfg7mBuz9aXXV7ZRWy416ge2BG
 hh90DNJfEfN8+/7IIkfuyHe/pABIycyFY2YHGjTR8tk4zAo/2UwOYJ38TWrprl8s2VdXgVBrg3O
 bNP+/TS+wPsJweKSx8oMIDLeXa4GFz27rQl9F4+jsXYjtchqpKxE9LgbZXOktcWeozzsBy6cQv2
 ZnESPztOXYAOwkw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

Series are often send with reflect before actual submission to check the
To/Cc and the content. Those reflected series are difficult to identify as
they are intended to be exaclty the same as the real mails.

To allows people to write filters for those reflect mails, add a
b4-specific header X-B4-Reflect.

---
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 docs/contributor/send.rst | 1 +
 src/b4/__init__.py        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 54ed4746a4eeb59b729bd183db0ac36dad05a434..9ae760d519f2fe493195921fc4c6be234edc8046 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -229,6 +229,7 @@ When ``--reflect`` is on:
 * when using the web endpoint, the messages aren't added to the
   public-inbox feed
 * your branch is **not** automatically rerolled to the next revision
+* A specific header, ``X-B4-Reflect``, is set to ``1``.
 
 Checking things over with ``--preview-to`` **(v0.13+)**
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 811bbcaf028d78224242433eac9fdbeb03a306b3..f7ab2e8411267425e79afce54e3bdfac6943d8f1 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3960,6 +3960,8 @@ def send_mail(smtp: Union[smtplib.SMTP, smtplib.SMTP_SSL, None], msgs: Sequence[
     for msg in msgs:
         if not msg.get('X-Mailer'):
             msg.add_header('X-Mailer', f'b4 {__VERSION__}')
+        if not msg.get('X-B4-Reflect') and reflect:
+            msg.add_header('X-B4-Reflect', f'1')
         msg.set_charset('utf-8')
 
         if dryrun or web_endpoint:

---
base-commit: 88a27ce9018a1e886829be0a57336ae0594413e1
change-id: 20240910-reflect-header-6e63dd90c6a8

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

