Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C72F6168
	for <tools@linux.kernel.org>; Wed,  8 Oct 2025 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921807; cv=none; b=YN/VI2PossGsSrGig/yMA7D+f5nVVASOGGLSi756JE/i8/YbI5ErD8MmU9wpymCVA6tzAgy8lmshYgxQpNxoCNNseYrG4kQICki/8C2Z1hgj2h5Q+76KQblyVQYrCDNwj8bMxwNdOq0ItovqDgM/DIpuVjV3rcZkm9O11dSH3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921807; c=relaxed/simple;
	bh=BLKSu89QC5NrklUjKtXBt9nsRoZ48DfuKrkb1H0OtdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jGvQxSIaoBqMF5fabgDvEhU/Xv2YKugcyh/YooR6x+hyFK4FemjFne+G8Un/ERiFzbcZ85Oamk1wrQFFWGVan9CWSjHxwc8KbsotMRZ7D3kOy9IxxLf8ZuNcoznvC591PAuEm7eby9mDfxG14183wo7CQsa9i5f4sY7I632XIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 0E9D9C4CEFE; Wed,  8 Oct 2025 11:10:07 +0000 (UTC)
Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63DD2C4CEF4;
	Wed,  8 Oct 2025 11:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63DD2C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=blackshift.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:102:af0a:700:511e:7599:1cbb:af35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id A6E22763188;
	Wed, 08 Oct 2025 11:09:52 +0000 (UTC)
Received: from hardanger.blackshift.org (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id EE954481E42;
	Wed, 08 Oct 2025 11:09:51 +0000 (UTC)
From: Marc Kleine-Budde <mkl@blackshift.org>
Date: Wed, 08 Oct 2025 13:09:42 +0200
Subject: [PATCH b4] docs: b4.prep-perpatch-check-cmd: fix closing quoting
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-fix-quoting-v1-1-f07093ae1213@blackshift.org>
X-B4-Tracking: v=1; b=H4sIAHVG5mgC/x2MywqAIBAAf0X2nOBG2uNXooPVZnux0opA+vek4
 zDMJIgUmCJ0IkGgmyNvPgMWAqbVekeS58xQqlKjUo1c+JHHtZ3snTQa7WjqFnWjIRd7oKz/Ww9
 jBcP7fpJS5ERhAAAA
X-Change-ID: 20251008-fix-quoting-651ab6791585
To: "Kernel.org Tools" <tools@kernel.org>
Cc: users@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-d1514
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=mkl@blackshift.org;
 h=from:subject:message-id; bh=uzRaS6tCCUzNJGKE9jl6pL/Trwib00zpUjhukqVHcvE=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBo5kZ6y2edAEgHZS95NRf05kQ3k0B8R0jK1ece6
 AU0ToqFazOJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaOZGegAKCRAMdGXf+ZCR
 nEy6B/9xoYcV/BBzK+opp9SAZWJzoi0Vv8cJZ/4h8N/wY9hGCdVXI3iSFTDD8N01W+M4gakQvRM
 t1ghnXjHb0VsQeRnJUI2jIEACeAt7DKM6i2PpvG0KvfR8GxWrz6gYLduy/uHK6oDc/BzxJueGAo
 K8h+qKmrmXXcg8wvYH3T8vXV4724+Z6hk30feNIZoZttRSB5eqB932lKfGHfdl7rb2CFRnD4eJy
 28+QFlWRmLf52FpAxPLGPsT6GMdKkDWDPN6Yw49RNLaqW/EDbCCDonWpoXuPbB/oEqQrxjop988
 49Wydm0zCO+82hmcU36A1GyUA9x8IxV/HrlmP/zLCs0dvlLk
X-Developer-Key: i=mkl@blackshift.org; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

From: Marc Kleine-Budde <mkl@pengutronix.de>

The quote starts with 2 back-ticks and closes with 3. Fix by removing 1.

Fixes: b590645c19ef ("docs: document b4 am --check and related config changes")
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 docs/config.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index 0f30d4e7e98f..a1145afeca2c 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -444,7 +444,7 @@ Contributor-oriented settings
   not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
   tree, it uses the command shown below by default.
 
-  Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile```
+  Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile``
 
 ``b4.prep-pre-flight-checks`` (v0.14+)
   You can use this to turn off some or all pre-flight checks that b4 runs

---
base-commit: b87af2e0dc6228c52ebd1c9df7b4c13aa4093f05
change-id: 20251008-fix-quoting-651ab6791585

Best regards,
--  
Marc Kleine-Budde <mkl@blackshift.org>

