Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398671BFE00
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720951; cv=none; b=NzF0jyZ1Aqc905NTvL5gPQWPn8mQVs2mDCCrugvF5v3VGjEqONMJcoc6jK0zn8c9V1R4vf8xy0GsYPGDvqQ7vbsunODy3ebPTmkErb5tlqP28G63QmWBnTe0XrXGu5oYbFd6oxR5fN2XBaQbHrpKzGdGYvYEBlWv4WycJtwwSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720951; c=relaxed/simple;
	bh=AfRhXePNlt/Idvi5Eq3KvjASYRnDPLioFSxtUhOSbbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X+L7vZOblQFVVihf5nP6+qJo2G7JNDfkUhESQyQTNJn5CQVNmNV2owfcwoGy3XMxfhimm3MRQTKQKHpHjV0uk/c39I4XUDQe8n2aPziD+bKHpVCUqndRfd8CAwgUCsoPIROo8n28P3S9PphKjsCcECjbEypqX71s6JhtMNlhnoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=S/OEOWUD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="S/OEOWUD"
Received: by smtp.kernel.org (Postfix)
	id B8724C4CEED; Wed, 20 Aug 2025 20:15:50 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9BEFC4CEE7
	for <tools@kernel.org>; Wed, 20 Aug 2025 20:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9BEFC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Skn2DkGvbVOmV3X5hq9mA058wLdnP7Cy9fT4lZzkwU0=; b=S/OEOWUDZ4Ylye1pHMK/U0kSKi
	dP1XNOQaL3Ha7rThJ60aUmGAa3Xl6w213lfdzPsYZaTzwur56DHoMD2/EVRuarOxTH0ijPr3HADy3
	HOvxo6VxJBS/lIe/GzX1kA7jllNMMeCahdIK3NPebKMxST1VeYGxBMrYIRjp1p/m/BjGLgyu3ZfWh
	HWKwsVHWFgRqJbxNlcWwWFCwQ7UTZft1u0pfwPt/EPu9NGB9yuqTVxqfer2ask/vJ9N0iNL8WsaLt
	oAhgcN7+6TLoZUQN1bV9S/v24cu0e1L48cWG2YkWk56AMZmiWJLjqFo5bkvdF07J6Yfkxox5+bFDL
	xkMQqjGA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tools@kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] use username without empty comments from gecos field
Date: Wed, 20 Aug 2025 22:15:15 +0200
Message-Id: <20250820201515.9606-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

avoids trailing ,,, at usernames.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index f425fd6..3a7098f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3165,7 +3165,7 @@ def _setup_user_config(cmdargs: argparse.Namespace) -> None:
             USER_CONFIG['name'] = os.environ['GIT_AUTHOR_NAME']
         else:
             udata = pwd.getpwuid(os.getuid())
-            USER_CONFIG['name'] = udata.pw_gecos
+            USER_CONFIG['name'] = udata.pw_gecos.removesuffix(",,,")
     if 'email' not in USER_CONFIG:
         if 'GIT_COMMITTER_EMAIL' in os.environ:
             USER_CONFIG['email'] = os.environ['GIT_COMMITTER_EMAIL']
-- 
2.39.5

