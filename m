Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6516A95E
	for <tools@linux.kernel.org>; Wed, 28 Aug 2024 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838006; cv=none; b=bfge6kITlZRRqRylYRKxa6uw+RbubV48aCBFppabzkFWsJn84is0IIuzeiSzfbSeXCH0VmK2V1eTYTKsHgMMP36dj4GW+WaDIG9ZND54Myb8P/GbFvsoZCHEvQRYeAanNMqnT1BIC9lw8KCtv5+Q9FhI84vvDtGav7JEZHHOhD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838006; c=relaxed/simple;
	bh=gEvdPS8vWpGFwwofL6kbwPvPNHBGjRlJknyo76INK6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pUeOKloY/3j6Gya99jblvhm+j+HApRrYygbDhwIMYRD+jrj2Sb+Y5Acm2N2Txzh58gq/k9RsnYp8nNa/+OeXot/1dobfApkUK0qL8GdYBCHUafB7YAAyq6cv1qMXWJYsEOsX+Tm2gtkPD30p4Os03ZE++ywuywA1lOtQ8/F+lwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rtgj5cGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rtgj5cGc"
Received: by smtp.kernel.org (Postfix)
	id 29B19C98EFB; Wed, 28 Aug 2024 09:40:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1B2DC98EEA
	for <tools@kernel.org>; Wed, 28 Aug 2024 09:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1B2DC98EEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2ADEFF807;
	Wed, 28 Aug 2024 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PyQK47Pn+ncmZko1cz8ArpoC42bzLSbWG9U3SB9bJy8=;
	b=Rtgj5cGccNzqTRusQXw4w6WFFg+d7YueDswQ34W22Fc49tdgebpySm7R/Xh7Jv9HGg3tV+
	sJQ6faVWX3kQg2a7j0y0o4v8YzPsv7P0zuuIw44B8WWM7126Ixtt0/2brPDQhUowKaIb4h
	GBCw3AJTD0iJWXwgHo1bxqJXrS3Lfu6L0XozGweh8c3pXD6FsvfU0o3uiPqkYOEmn4tCZk
	X4x0Ud7WVMAqeZY8dXNEeOUVE1Ow3g6kbsOMzjya821T57EW2wVVvCmyDyHZxBMIR4H5ky
	puLFgcS6cLlg9XfTzxlMA9PizwC6ZX5rSlrtZ5Xbf6d1Oaoe4yyORSrVIHF99A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 11:39:51 +0200
Subject: [PATCH b4] Remove message-id from cc list
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGbwzmYC/x2MQQqAIBAAvyJ7TigVir4SHdTdaqEsVpAg+nvSc
 QZmHsgkTBlG9YBQ4cxnqtA1CuLm00qasTKY1rh2MIMWOs5SbSp+Z9QxaqIYsEdng0Wo3SW08P0
 /JwgO5vf9ADMYvkBnAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gEvdPS8vWpGFwwofL6kbwPvPNHBGjRlJknyo76INK6Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzvBxby52PEfAqF93clLPrSCrTUoF9AZxT30BE
 RaDRr7EsBKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs7wcQAKCRAgrS7GWxAs
 4jJ/D/9HSUwflEM57BlZfHZzf+loTqu1/PrPiv+hDpYP7YXN1+8bOmV36Fwr52ys/1x5490P+kE
 7joP97F6W95ECXKfshTRzY+ThZ9inuJ3Fbs2fO2kM4uWo2tESYy1DbcgteSkkPk1OvX3434xvaQ
 J3kmU8g+8/8UyhDVOqWwP9V/njZRFHuWeGtP4o0B+MhKrClHKauoyUjHBRC73a68sbInxXq94nn
 8ioole85zqNf1mUtBd71mRxy75Tw/HECb3ddQ7jtdz51HNrEZimZDtt7Uvagi7p8pDR2UONfMDy
 WpyLOhh3lzF9l6HU2//BgT9cb2A/juk2x8rBbuQP2ppaW3yGXACH5JTc+vn9BWXLxinB3Bygy55
 WSsvEuoGR22+fGpgim+JIuiSj8RWL08j0jZ1/+sxMZiBJqJBFUQwbK4v1unPNbIAJRfBA6dL23+
 qYV5A3iqo/DIqo7yGfc9iFVG9z6Kyb5tjHc1G7MufIuXlnVxD9MaYVXEmoflO65ef6fMJlyLEpV
 O7ZN7PBaTgZjfF/DhTgo4zKdZjobD2D7jLLMvIrIZmfw3zYuPNb+MEdUFUZ8kRijrRIsyiL9KrM
 Q3PGqFnMwhkbrqk+ljRS8SK6aH4ViROE+pkvIyi24eRUGK5cGoDhWcbYD83cpgGpETgfQcpUEBj
 hPHDDcp30l3JUKw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

As the algorithm to detect mails to add in CC is very simple, it also
include the prerequisite-message-id to CC as they look like mails. In
order to avoid this kind of issue, filter out prerequisite-message-id
lines.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ec230e7ace66..b0d91c0e4017 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1990,7 +1990,7 @@ class LoreMessage:
 
     @staticmethod
     def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
-        ignores = {'phone', 'email'}
+        ignores = {'phone', 'email', 'prerequisite-message-id'}
         headers = {'subject', 'date', 'from'}
         links = {'link', 'buglink', 'closes'}
         nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}

---
base-commit: 99b128995f27cd9aa6fa8adf7588f339919ac14d
change-id: 20240828-remove-invalid-cc-eecbd7d43b3d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

